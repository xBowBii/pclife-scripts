// by Bon_Inf*

if(not isServer) exitWith{};


private ["_pos"];

_location = _this select 0;
_position = position _location;

EnemiesSpawned = false;
[_location,"MAIN FORCE"] execVM "scripts\missions\spawn_enemies.sqf";
WaitUntil{EnemiesSpawned};


_pos = [_position,150] call getFlatArea;
["tentcamp_0",round random 360,_pos] execVM "dyno\objectMapper.sqf";
_pos spawn {
	sleep 10;
	_camp_objects = ("tentcamp_0" call (compile (preprocessFileLineNumbers "dyno\getObjects.sqf")));
	nearestObjects[_this,_camp_objects,50] spawn tfor_cleanup_after_mission;
};



While {{isPlayer _x} count nearestObjects [_pos,["Man"],10] == 0 && tfor_deathcount <= tfor_max_death_per_mission} do {sleep 5};

tfor_commandchat = "To all Squad Leaders at current objective - Danger: Multiple enemy Squad Units are heading to your position, guess you just ran in an ambush. Dig in and defend your position, the enemy is not allowed to capture the area.";
publicVariable "tfor_commandchat";
player commandChat tfor_commandchat;


_enemies = [];

_ang = 0;
_rad = 200; //radius
_bcount = 3 max (ceil (playersNumber tfor_friendly_side max 1)/2);
_inc = 360/_bcount; 
for "_i" from 1 to _bcount do
{
	_a = (_pos select 0)+(sin(_ang)*_rad);
	_b = (_pos select 1)+(cos(_ang)*_rad);

	_spawnpos = [_a,_b,_pos select 2];
	_ang = _ang + _inc;


	_grp = [tfor_enemy_side,3 + round random 5,_spawnpos,50] call spawnInf;
	if(random 2 < 1) then {
		_cargrp = [call compile format["tfor_%1_car call getRandomElement",tfor_enemy_side],tfor_enemy_side,_spawnpos,50] call spawnVehicle;
		(units _cargrp) joinSilent _grp;
		sleep 1;
		deleteGroup _cargrp;
	};
	_enemies = _enemies + (units _grp);

	(_grp addWaypoint [_pos,10]) setWaypointType "SAD";
	{_x allowFleeing 0} foreach units _grp;

	sleep 30;
};
_enemies spawn tfor_cleanup_after_mission;


While{{alive _x} count _enemies > 3 && {_x in _enemies} count nearestObjects [_pos,["Man"],10] == 0 && tfor_deathcount <= tfor_max_death_per_mission} do {sleep 5};


if({alive _x} count _enemies <= 3 && tfor_deathcount <= tfor_max_death_per_mission) then {
	tfor_missionstate = "SUCCESS";
} else {
	tfor_missionstate = "FAIL";
};