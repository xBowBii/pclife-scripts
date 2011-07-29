// by Bon_Inf*

if(not isServer) exitWith{};

private ['_randompos','_isFlat','_cache'];


_location = _this select 0;
_pos = position _location;
_size = 150; //((size _location) select 0) max ((size _location) select 1);


EnemiesSpawned = false;
[_location] execVM "scripts\missions\spawn_enemies.sqf";
WaitUntil{EnemiesSpawned};


_cache = tfor_searchcache_cachetype createVehicle _pos;



/****************** hide cache **********************************/
_houses = [_pos,_size] call getEnterableHouses;

_hideout = [];
if(count _houses > 0) then {

	_cache = tfor_searchcache_cachetype_inside createVehicle _pos;

	for "_i" from 1 to 10000 do {
		_house = _houses call getRandomElement;

		_buildingpos = round random (_house select 1);
		_house = _house select 0;

		_hideout = (_house buildingPos _buildingpos);

		if(count (_hideout - [0]) > 0) exitWith{};
		_hideout = [(getPos _cache select 0) + _size - random (2*_size),(getPos _cache select 1) + _size - random (2*_size),0];
	};
	_cache setPos _hideout;

} else {

	_cache = tfor_searchcache_cachetype_outside createVehicle _pos;

	for "_i" from 1 to 10000 do {
		_randompos = [(_pos select 0) + _size - random (2*_size),(_pos select 1) + _size - random (2*_size),0];
		_isFlat = _randompos isflatempty [(sizeof typeof _cache) / 2,0,0.3,(sizeof typeof _cache),0,false,_cache];
		if(
			if(count _isFlat > 0) then{
				if(count (_isFlat nearRoads 20) == 0) then{_isFlat set [2,0]; true} else {false}
			} else{false}
		) exitWith{};
	};
	if(count _isFlat == 0) then {_isFlat = _randompos};
	_cache setPos _isFlat;

};
/*****************************************************************/

_sphere = "Sign_sphere10cm_EP1" createVehicle position _cache; _sphere attachTo [_cache,[0,0,0.75]];

_guards = [tfor_enemy_side,3,position _location,50] call spawnInf;
_guards allowFleeing 0;
(_guards addWaypoint [position _cache,0]) setWaypointType "HOLD";
_guards setFormation "DIAMOND";

(units _guards + [_sphere,_cache]) spawn tfor_cleanup_after_mission;

While{damage _cache < 1 && tfor_deathcount <= tfor_max_death_per_mission} do {sleep 5};


if(damage _cache >= 1) then {
	tfor_missionstate = "SUCCESS";
} else {
	tfor_missionstate = "FAIL";
};