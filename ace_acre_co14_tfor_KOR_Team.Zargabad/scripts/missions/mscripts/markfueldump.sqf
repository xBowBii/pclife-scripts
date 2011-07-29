// by Bon_Inf*

if(not isServer) exitWith{};

private ["_pos"];


_location = _this select 0;
_position = position _location;


EnemiesSpawned = false;
[_location] execVM "scripts\missions\spawn_enemies.sqf";


_pos = [_position,100,0.1,10] call getFlatArea;
["fueldump_0",round random 360,_pos] execVM "dyno\objectMapper.sqf";
sleep 10;
_fueldump_objects = ("fueldump_0" call (compile (preprocessFileLineNumbers "dyno\getObjects.sqf")));
_fueldump = nearestObjects[_pos,_fueldump_objects,50];
_fueldump spawn tfor_cleanup_after_mission;

_guards = [tfor_enemy_side,5 + round random 5,_pos,50] call spawnInf;
(_guards addWaypoint [_pos,0]) setWaypointType "HOLD";
_guards setFormation "DIAMOND";
_guards allowFleeing 0;
(units _guards) spawn tfor_cleanup_after_mission;


tfor_markfueldump_marked = false;
_pos spawn {

	_units_near = [];
	_units_observed = [];
	While{not tfor_markfueldump_marked} do {

		{
			if(_x distance _this > 30) then {_units_observed = _units_observed - [_x]};
		} foreach _units_observed;

		{
			if(isPlayer _x && not (_x in _units_observed)) then {_units_near = _units_near + [_x]};
		} foreach nearestObjects [_this,["Man"],30];

		_units_observed = _units_observed + _units_near;

		{
			[_x,_this] spawn {
				_unit = _this select 0; _pos = _this select 1;
				_count_markerobjects = {_x in tfor_markfueldump_markerobjects} count magazines _unit;

				While{_unit distance _pos < 30} do {
					if({_x in tfor_markfueldump_markerobjects} count magazines _unit < _count_markerobjects) exitWith{tfor_markfueldump_marked = true};
					sleep 2;
				};
			};

			_units_near = _units_near - [_x];
		} foreach _units_near;

		sleep 2;
	};
};

While{not tfor_markfueldump_marked && tfor_deathcount <= tfor_max_death_per_mission} do {sleep 5};

if(tfor_markfueldump_marked) then {
	tfor_commandchat = "Fuel dump marked. Get out of there.";
	publicVariable "tfor_commandchat";
	player commandChat tfor_commandchat;
};

While{{side _x == tfor_friendly_side} count nearestObjects [_pos,["Man","LandVehicle","Air"],100] > 0 && tfor_deathcount <= tfor_max_death_per_mission} do {sleep 10};


if(tfor_deathcount > tfor_max_death_per_mission) then {
	tfor_missionstate = "FAIL";
} else {
	for "_i" from 1 to 10 do {
		"ARTY_Sh_105_HE" createVehicle [_pos select 0, _pos select 1, 10];
		sleep (2 + random 3);
	};
	{deleteVehicle _x} foreach _fueldump;
	tfor_missionstate = "SUCCESS";
};

tfor_markfueldump_marked = true;