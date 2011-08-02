// by Bon_Inf*

if(not isServer) exitWith{};

_location = _this select 0;
_pos = position _location;


EnemiesSpawned = false;
[_location] execVM "scripts\missions\spawn_enemies.sqf";



/*********************** get 10 positions in a circle of fixed radius around location ************/
_ang = 0;
_bcount = 10;
_inc = 360/_bcount; 
_radius = 750 + random 500;
_rallypos = _pos; _outpostpositions = [];
for "_i" from 0 to _bcount do {

	_ang = _inc * _i;

	_a = (_pos select 0)+(sin(_ang)*_radius);
	_b = (_pos select 1)+(cos(_ang)*_radius);

	_outpostpositions = _outpostpositions + [[_a,_b,0]];
};



/************************ pick 3 of previous computed positions randomly, spawn camps ************/
_camppositions = [];
_enemies_spawned = [];
for "_i" from 1 to 3 do{_camppositions = _camppositions + [_outpostpositions call getRandomElement]};

{
	_position = _x;
	_pos = [_position,250,0.1,2] call getFlatArea;

	_camptype = ["bunkermedium_0","bunkermedium_1","bunkermedium_2","bunkersmall_0","outpost_1","guardpost_0","guardpost_1"] call getRandomElement;
	[_camptype,round random 360,_pos] execVM "dyno\objectMapper.sqf";
	[_pos,_camptype] spawn {
		sleep 10;
		_outpost_objects = ((_this select 1) call (compile (preprocessFileLineNumbers "dyno\getObjects.sqf")));
		nearestObjects[(_this select 0),_outpost_objects,50] spawn tfor_cleanup_after_mission;
	};

	_grp = [tfor_enemy_side,15,_pos,50,"militia"] call spawnInf;
	[_grp,_pos,"patrol"] execFSM "fsm\bon_ai_movement.fsm";
	_enemies_spawned = _enemies_spawned + (units _grp);
} foreach _camppositions;


_enemies_spawned spawn tfor_cleanup_after_mission;


While{{alive _x} count _enemies_spawned > 10 && tfor_deathcount <= tfor_max_death_per_mission} do{sleep 10};


if(tfor_deathcount > tfor_max_death_per_mission) then{
	tfor_missionstate = "FAIL";
} else {
	tfor_missionstate = "SUCCESS";
};