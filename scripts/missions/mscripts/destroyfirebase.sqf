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
	while{{side (driver _x) == tfor_enemy_side} count nearestObjects[position _location,["Man","Car","Tank"],800] > 10 && tfor_deathcount <= tfor_max_death_per_mission} do {sleep 4.567};
};


_get_iedfactory_pos = {

	_pos = position _this;
	_ang = random 360;
	_rad = 500 + random 1000;

	_a = (_pos select 0)+(sin(_ang)*_rad);
	_b = (_pos select 1)+(cos(_ang)*_rad);

	_pos = [_a,_b,_pos select 2];

	_pos
};

private ["_pos"];
for "_i" from 1 to 10000 do {

	_iedfactory_pos = _location call _get_iedfactory_pos;

	_pos = _iedfactory_pos isflatempty [10, 0, 0.1, 5, 0, false, ObjNull];

	if(if(count _pos > 0) then{_pos set [2,0]; if(count (_pos nearRoads 100) == 0) then{true} else{false}} else{false}) exitWith{};

};
if(count _pos == 0) then {_pos = [(position _location select 0) + 600 - random 1200,(position _location select 1) + 600 - random 1200,0]};


for "_i" from 1 to (3 + round random 3) do {
	"Bo_GBU12_LGB" createVehicle [(_pos select 0) + 50 - random 100,(_pos select 1) + 50 - random 100,10];
	sleep (2 + random 2);
};

sleep 5;
tfor_commandchat = format["Heavy explosions draw our attention to grid %1. To all Squad Leaders, move your troops to this position and investigate the area.",mapGridPosition _pos];
publicVariable "tfor_commandchat";
player commandChat tfor_commandchat;


["firebase_0",round random 360,_pos] execVM "dyno\objectMapper.sqf";
sleep 5;
_d30s = [];



While{count _d30s == 0 && tfor_deathcount <= tfor_max_death_per_mission} do{
	_d30s = nearestObjects[_pos,[tfor_destroyfirebase_artitype],50];
	sleep 1;
};

{
	_x addEventHandler ["killed",{
		clearVehicleInit this;
		deleteVehicle (_this select 0);
	}];
} foreach _d30s;


[_pos,_d30s] spawn {
	_pos = _this select 0;
	_d30s = _this select 1;
	While{{alive _x} count _d30s > 0 && tfor_deathcount <= tfor_max_death_per_mission} do {
		_marker = createMarker ["tfor_destroyfirebase",_pos];
		_marker setMarkerType "hd_destroy";
		_marker setMarkerText " check this grid";
		sleep 20;
		deleteMarker _marker;
	};
};


_grp = [tfor_enemy_side,5 + round random 3,_pos,50,"militia"] call spawnInf;
(_grp addWaypoint [_pos,0]) setWaypointType "HOLD";
_grp setFormation "DIAMOND";


_objects = ("firebase_0" call (compile (preprocessFileLineNumbers "dyno\getObjects.sqf")));
((units _grp) + nearestObjects[_pos,_objects,50]) spawn tfor_cleanup_after_mission;



While{{alive _x} count _d30s > 0 && tfor_deathcount <= tfor_max_death_per_mission} do {sleep 5};


if(tfor_deathcount > tfor_max_death_per_mission) then {
	tfor_missionstate = "FAIL";
} else {
	tfor_missionstate = "SUCCESS";
};

deleteMarker "tfor_destroyfirebase";