// by Bon_Inf*

if(not isServer) exitWith{};

_location = _this select 0;
_size = ((size _location) select 0) max ((size _location) select 1);


EnemiesSpawned = false;
[_location] execVM "scripts\missions\spawn_enemies.sqf";
WaitUntil{EnemiesSpawned};


if(tfor_enemy_reinforcements == 1) then {
	WaitUntil{not isNil "ReinfSpawn"};
	While{not isNil "ReinfSpawn" && tfor_deathcount <= tfor_max_death_per_mission} do {sleep 2.345};
} else {
	while{{side _x == tfor_enemy_side} count nearestObjects [position _location,["Man","LandVehicle"],_size] > 10 && tfor_deathcount <= tfor_max_death_per_mission} do {sleep 4.567};
};


_get_tankattack_spawnpos = {
	_pos = position _this;
	_ang = random 360;
	_rad = 1250 + random 250;
	_a = (_pos select 0)+(sin(_ang)*_rad);
	_b = (_pos select 1)+(cos(_ang)*_rad);
	_pos = [_a,_b,_pos select 2];
	_pos
};

private ["_pos"];
for "_i" from 1 to 10000 do {

	_tankattack_spawnpos = _location call _get_tankattack_spawnpos;
	_pos = _tankattack_spawnpos isflatempty [10, 0, 0.1, 10, 0, false, ObjNull];

	if(if(count _pos > 0) then{_pos set [2,0]; if(count (_pos nearRoads 100) == 0 && _pos distance (getMarkerPos format["respawn_%1",tfor_friendly_side]) > 2000) then{true} else{false}} else{false}) exitWith{};
};
if(count _pos == 0) then {_pos = _location call _get_tankattack_spawnpos};

_number_attack_tanks = 5;
_enemies = [];
_tanks = [];

if(tfor_deathcount <= tfor_max_death_per_mission) then {
	sleep 5;
	tfor_commandchat = format["Attention all Squad Leaders: %1 enemy tanks are heading your way. Dig in and take them down.",_number_attack_tanks];
	publicVariable "tfor_commandchat";
	player commandChat tfor_commandchat;


	for "_i" from 1 to _number_attack_tanks do {

		_type = call compile format["tfor_%1_armor call getRandomElement",tfor_enemy_side];
		_Grp = [_type,tfor_enemy_side,_pos,0] call spawnVehicle;
		_Grp setBehaviour "SAFE";
		_Grp setSpeedMode "NORMAL";
		(_Grp addWaypoint [position _location, 0]) setWaypointType "SAD";

		_tank = (vehicle leader _Grp);
		_tank lock true;
		_tanks = _tanks + [_tank];

		_enemies = _enemies + units _Grp;

		sleep 20;
	};
	(_enemies + _tanks) spawn tfor_cleanup_after_mission;
};



While{{canMove _x} count _tanks > 0 && tfor_deathcount <= tfor_max_death_per_mission} do {sleep 5};



if(tfor_deathcount > tfor_max_death_per_mission) then {
	tfor_missionstate = "FAIL";
} else {
	tfor_missionstate = "SUCCESS";
};