// by "your honorable name"

if(not isServer) exitWith{};

_location = _this select 0;

EnemiesSpawned = false;
[_location, 5] execVM "scripts\spawn_enemies.sqf";
WaitUntil{EnemiesSpawned};

///
// here goes your code.
//
// to let the mission successfully complete, set
// tfor_missionstate = "SUCCESS";
//
// to let the mission fail, set
// tfor_missionstate = "FAIL";
// NOTES:
//
// spawning enemies happens at the lines 8-10, however
//
// you can spawn (manned) vehicles by
//   group = [type,side,position,spawnradius] call spawnVehicle;
//
// you can spawn infantry by
//   group = [side,groupsize,position,spawnradius,"militia"] call spawnInf;
// where the last parameter is optional and let spawn militia units if side is EAST
//
// for every object/unit you dynamically create, you should run as well
//   [<objects>] spawn tfor_cleanup_after_mission;
// so that it gets deleted after the mission is over.
//
////
/***
// One Example Mission: Destroy an ammo cache;
//
// cache destroyed -> mission successful;
// team dies more often than set by tfor_max_death_per_mission -> mission fail
//
// Then your code should somehow look like: 
*******************************************************************************
// create cache
_cache = "TKBasicWeapons_EP1" createVehicle position _location;

// let spawn some guards
_guards = [tfor_enemy_side,5,position _cache,20] call spawnInf;

// mark guards and cache for cleanup
(units _guards + [_cache]) spawn tfor_cleanup_after_mission;

// Waituntil cache destroyed or team died too often
While{damage _cache < 1 && tfor_deathcount <= tfor_max_death_per_mission} do {sleep 5};

// tell the mission manager the mission is over
if(damage _cache >= 1) then {
	tfor_missionstate = "SUCCESS";
} else {
	tfor_missionstate = "FAIL";
};
***/