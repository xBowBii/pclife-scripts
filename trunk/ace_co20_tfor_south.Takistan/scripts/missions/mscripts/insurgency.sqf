// by Bon_Inf*
if(not isServer) exitWith{};

_location = _this select 0;
_position = position _location;


EnemiesSpawned = false;
[_location,"MAIN FORCE"] execVM "scripts\missions\spawn_enemies.sqf";
WaitUntil{EnemiesSpawned};


// create cache

private ["_cachelocation"];

_radius = 2500 + random 5000; _ang = random 360;
_locations = nearestLocations [
	[(_position select 0)+(sin(_ang)*_radius),(_position select 1)+(cos(_ang)*_radius)],
	[
		"NameLocal",
		"ViewPoint",
		"BorderCrossing",
		"VegetationBroadleaf",
		"VegetationFir",
		"VegetationPalm",
		"VegetationVineyard"
	],
	10000
];
_cachelocation = _locations select 0;
While{position _cachelocation distance getmarkerpos format["respawn_%1",tfor_friendly_side] < 1000} do {
	_cachelocation = _locations select 0;
	_locations = _locations - [_locations select 0];
};


_cache = "TKBasicWeapons_EP1" createVehicle position _cachelocation;

// hide cache
_houses = [position _cache,500] call getEnterableHouses;

_hideout = [];
if(count _houses > 0) then {

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

tfor_insurgency_cache = _cache;
tfor_insurgency_location = _position;
tfor_insurgency_intel = 0;
tfor_insurgency_marker = [];


TFOR_INSURGENCY_KILLEDEH = {
	if(side _this == tfor_enemy_side && local _this && random 3 < 1.00) then {

		_this addEventHandler ["Killed",{
			_unit = _this select 0;
			_pos = [(getPos _unit select 0) + 1.5 - random 3,(getPos _unit select 1) + 1.5 - random 3,0];
			_ev = (["EvMap","EvMoscow","EvPhoto"] call getRandomElement) createvehicle _pos;

			_ev setPosATL _pos;
			[_ev] spawn tfor_cleanup_after_mission;

			_ev spawn {

				while{not isNil "tfor_insurgency_cache" && {isPlayer _x && side _x == tfor_friendly_side} count nearestObjects[position _this,["All"],1] == 0} do {sleep 3};

				if(isNil "tfor_insurgency_cache") exitWith{deleteVehicle _this};

				deleteVehicle _this;
				tfor_commandchat = "Gained new intel about a cache's probable location.";
				publicVariable "tfor_commandchat";
				player commandChat tfor_commandchat;

				tfor_insurgency_intel = tfor_insurgency_intel + 125;

				_markername = format["tfor_ins_%1",tfor_insurgency_intel];
				_markeraccuracy = 50 max (1500 - tfor_insurgency_intel);
				_markerpos = [(getPos tfor_insurgency_cache select 0) + _markeraccuracy - random (_markeraccuracy*2),(getPos tfor_insurgency_cache select 1) + _markeraccuracy - random (_markeraccuracy*2),0];

				tfor_insurgency_marker = tfor_insurgency_marker + [_markername];

				// marker recreation in while loop so that JIP can see the marker, too.
				While{not isNil "tfor_insurgency_cache"} do {
				
					_marker = createMarker [_markername,_markerpos];
					_marker setMarkerType "hd_unknown";
					_marker setMarkerSize [0.75,0.75];
					_marker setMarkerText format["%1m",_markeraccuracy];

					sleep 60;

					deleteMarker _marker;
				};
			};
		}];
	};
};

{
	_x spawn TFOR_INSURGENCY_KILLEDEH;
} foreach nearestObjects [_position,["Man"],500];

_cachelocation spawn {
	While{count tfor_insurgency_marker == 0 && alive tfor_insurgency_cache && tfor_deathcount <= tfor_max_death_per_mission} do {sleep 1};
	if(count tfor_insurgency_marker == 0) exitWith{};

	EnemiesSpawned = false;
	[_this] execVM "scripts\missions\spawn_enemies.sqf";
	WaitUntil{EnemiesSpawned};

	{
		_x spawn TFOR_INSURGENCY_KILLEDEH;
	} foreach nearestObjects [position _this,["Man"],500];
};



While{damage tfor_insurgency_cache < 1 && tfor_deathcount <= tfor_max_death_per_mission} do {sleep 5};


if(damage tfor_insurgency_cache >= 1) then {
	tfor_missionstate = "SUCCESS";
} else {
	tfor_missionstate = "FAIL";
};

{deleteMarker _x} foreach tfor_insurgency_marker;
tfor_insurgency_marker = nil;
tfor_insurgency_cache = nil;
tfor_insurgency_intel = nil;
tfor_insurgency_location = nil;
TFOR_INSURGENCY_KILLEDEH = nil;