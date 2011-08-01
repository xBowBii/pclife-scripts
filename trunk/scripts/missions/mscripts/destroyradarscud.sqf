// by Bon_Inf*

if(not isServer) exitWith{};

private ["_randompos","_isFlat_radar","_isFlat_scud"];

_location = _this select 0;
_size = ((size _location) select 0) max ((size _location) select 1);


EnemiesSpawned = false;
[_location] execVM "scripts\missions\spawn_enemies.sqf";



/************************************* create radar *************************************/
_radar = tfor_destroyradarscud_radartype createVehicle position _location;
//[_radar] execVM "scripts\c4only.sqf";

_isFlat_radar = [position _radar,_size] call getFlatArea;
_radar setPos _isFlat_radar;

_guards = [tfor_enemy_side,5,position _location,50] call spawnInf;
(units _guards + [_radar]) spawn tfor_cleanup_after_mission;

(_guards addWaypoint [position _radar,0]) setWaypointType "HOLD";
_guards setFormation "DIAMOND";
/****************************************************************************************/



/************************************* create scud **************************************/
_scud = tfor_destroyradarscud_scudtype createVehicle position _location;
[_scud] execVM "scripts\c4only.sqf";
_scud setFuel 0;

_isFlat_scud = [position _scud,_size] call getFlatArea;
for "_i" from 1 to 10000 do {
	_isFlat_scud = [position _scud,_size] call getFlatArea;
	if(_isFlat_radar distance _isFlat_scud > 100) exitWith{};
};
_scud setPos _isFlat_scud;

_guards = [tfor_enemy_side,5,position _location,50] call spawnInf;
(units _guards + [_scud]) spawn tfor_cleanup_after_mission;

(_guards addWaypoint [position _scud,0]) setWaypointType "HOLD";
_guards setFormation "DIAMOND";
/****************************************************************************************/



While{(alive _radar || alive _scud) && tfor_deathcount <= tfor_max_death_per_mission} do {sleep 5};


if(not alive _radar && not alive _scud) then {
	tfor_missionstate = "SUCCESS";
} else {
	tfor_missionstate = "FAIL";
};