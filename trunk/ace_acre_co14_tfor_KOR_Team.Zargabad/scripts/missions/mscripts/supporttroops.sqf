// by Bon_Inf*

if(not isServer) exitWith{};

_location = _this select 0;
_pos = position _location; _pos set[2,0];


EnemiesSpawned = false;
[_location] execVM "scripts\missions\spawn_enemies.sqf";



_ang = 0;
_bcount = 10;
_inc = 360/_bcount; 
_radius = 1250 + random 500;
_min = 999999; _rallypos = _pos; _attack_locations = [];
for "_i" from 0 to _bcount do {

	_ang = _inc * _i;

	_a = (_pos select 0)+(sin(_ang)*_radius);
	_b = (_pos select 1)+(cos(_ang)*_radius);

	_attack_locations = _attack_locations + [[_a,_b,0]];
	if([_a,_b,0] distance getMarkerPos format["respawn_%1",tfor_friendly_side] < _min) then {
		_rallypos = [_a,_b,0];
		_min = _rallypos distance getMarkerPos format["respawn_%1",tfor_friendly_side];
	};
};
_roads = _rallypos nearRoads 1000;
if(count _roads > 0) then {_rallypos = position (_roads select 0)};

_marker = createMarker [str (round random 999999),_rallypos];
_marker setMarkerType "hd_flag";
_marker setMarkerText "Встретится с отрядом!";



_rand_inf = (3 + (round random 2)) * tfor_amount_enemyinfantry;
_rand_car = (2 + (round random 2)) * tfor_amount_enemyinfantry;
_rand_apc = (1 + (round random 2)) * tfor_amount_enemytanks;
_rand_tank = (0 + (round random 1)) * tfor_amount_enemytanks;

_spawned_friendly_units = [];
_spawned_enemy_units = [];

for "_i" from 1 to _rand_inf do {
	_grp = [tfor_friendly_side,8,_rallypos,50] call spawnInf;
	_spawned_friendly_units = _spawned_friendly_units + (units _grp);

	_grp = [tfor_enemy_side,8,_pos,200] call spawnInf;
	_spawned_enemy_units = _spawned_enemy_units + (units _grp);
};

for "_i" from 1 to _rand_car do {
	_grp = [call compile format["tfor_%1_car call getRandomElement",tfor_friendly_side],tfor_friendly_side,_rallypos,50] call spawnVehicle;
	_spawned_friendly_units = _spawned_friendly_units + (units _grp) + [vehicle leader _grp];

	_grp = [call compile format["tfor_%1_car call getRandomElement",tfor_enemy_side],tfor_enemy_side,_pos,200] call spawnVehicle;
	_spawned_enemy_units = _spawned_enemy_units + (units _grp) + [vehicle leader _grp];
};

for "_i" from 1 to _rand_apc do {
	_grp = [call compile format["tfor_%1_apc call getRandomElement",tfor_friendly_side],tfor_friendly_side,_rallypos,50] call spawnVehicle;
	_spawned_friendly_units = _spawned_friendly_units + (units _grp) + [vehicle leader _grp];

	_grp = [call compile format["tfor_%1_apc call getRandomElement",tfor_enemy_side],tfor_enemy_side,_pos,200] call spawnVehicle;
	_spawned_enemy_units = _spawned_enemy_units + (units _grp) + [vehicle leader _grp];
};

for "_i" from 1 to _rand_tank do {
	_grp = [call compile format["tfor_%1_armor call getRandomElement",tfor_friendly_side],tfor_friendly_side,_rallypos,50] call spawnVehicle;
	_spawned_friendly_units = _spawned_friendly_units + (units _grp) + [vehicle leader _grp];

	_grp = [call compile format["tfor_%1_armor call getRandomElement",tfor_enemy_side],tfor_enemy_side,_pos,200] call spawnVehicle;
	_spawned_enemy_units = _spawned_enemy_units + (units _grp) + [vehicle leader _grp];
};

(_spawned_enemy_units + _spawned_friendly_units) spawn tfor_cleanup_after_mission;


deleteMarker _marker;
While{{isPlayer _x} count (nearestObjects [_rallypos,["Man","LandVehicle","Air"],100]) == 0 && tfor_deathcount <= tfor_max_death_per_mission} do {
	_marker = createMarker [str (round random 999999),_rallypos];
	_marker setMarkerType "hd_flag";
	_marker setMarkerText "Link up with friendly forces!";
	sleep 10;
	deleteMarker _marker;
};
if(tfor_deathcount > tfor_max_death_per_mission) exitWith{tfor_missionstate = "FAIL"};


{
	if(leader _x == _x) then {
		((group _x) addWaypoint [_attack_locations call getRandomElement,100]) setWaypointType "MOVE";
		((group _x) addWaypoint [_pos,100]) setWaypointType "SAD";
		(group _x) setSpeedMode "NORMAL";
		(group _x) setFormation "LINE";
		{_x allowFleeing 0} foreach units (group _x);
	};
} foreach _spawned_friendly_units;



While{{alive _x} count _spawned_enemy_units > 10 && {alive _x} count _spawned_friendly_units > 10 && tfor_deathcount <= tfor_max_death_per_mission} do {sleep 10};


if({alive _x} count _spawned_friendly_units <= 10 || tfor_deathcount > tfor_max_death_per_mission) then{
	tfor_missionstate = "FAIL";
} else {
	tfor_missionstate = "SUCCESS";
};