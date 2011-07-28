//by Bon_Inf*

if(not isServer) exitWith{};

private ["_airpatrols","_airvecs"];

_all_locations = nearestLocations [position Server,["Name","NameCity","NameCityCapital","NameVillage","NameLocal"],30000];

if(isNil "tfor_patrolspawn_air") then {
	_isFlat = getMarkerPos "Barracks";
	While{if(count _isFlat == 0) then{true} else{if(_isFlat distance (getMarkerPos "Barracks") < 5000) then{true} else{false}}} do {
		_randompos = [random 10000, random 10000, 0];
		_isFlat = _randompos isflatempty [
			15,	//--- Minimal distance from another object
			1,				//--- If 0, just check position. If >0, select new one
			0.1,				//--- Max gradient
			15,				//--- Gradient area
			0,				//--- 0 for restricted water, 2 for required water,
			false,				//--- True if some water can be in 25m radius
			ObjNull				//--- Ignored object
		];

		if(count _isFlat > 0) then {
			if(count (_isFlat nearRoads 50) > 0) then{_isFlat = []};
		};
	};

	tfor_patrolspawn_air = _isFlat;
};


["helipark_0",round random 360,tfor_patrolspawn_air] execVM "dyno\objectMapper.sqf";
sleep 10;
_radar = nearestObjects [tfor_patrolspawn_air,["BASE_WarfareBAntiAirRadar"],100] select 0;
_radar addEventHandler ["Killed",{
	tfor_commandchat = "Enemy Heli Park destroyed - you cut their air support, good job.";
	publicVariable "tfor_commandchat";
	player commandChat tfor_commandchat;
}];

_guards = [tfor_enemy_side,10,tfor_patrolspawn_air,100] call spawnInf;
(_guards addWaypoint [tfor_patrolspawn_air,20]) setWaypointType "HOLD";
_guards setFormation "DIAMOND";


While{alive _radar} do{

	for "_i" from 1 to tfor_maxnumber_airpatrols do {

		WaitUntil{{isPlayer _x} count nearestObjects [tfor_patrolspawn_air,["Air","Man","LandVehicle"],500] == 0};

		_type = call compile format["tfor_%1_air call getRandomElement",tfor_enemy_side];
		_Grp = [_type,tfor_enemy_side,tfor_patrolspawn_air,0] call spawnVehicle;
		_Grp setBehaviour "SAFE";
		_Grp setSpeedMode "LIMITED";

		_heli = (vehicle leader _Grp);
		_heli lock true;

		if(isNil "_airpatrols") then{_airpatrols = [_Grp]} else{_airpatrols = _airpatrols + [_Grp]};
		if(isNil "_airvecs") then{_airvecs = [_heli]} else{_airvecs = _airvecs + [_heli]};

		_locations = _all_locations call getArrayPermutation;
		{
			if(position _x distance getMarkerPos format["respawn_%1",tfor_friendly_side] > 2000) then {
				_Grp addWaypoint [position _x,100];
			};
		} foreach _locations;
		(_Grp addWaypoint [waypointPosition [_Grp,0],50]) setWaypointType "CYCLE";

		sleep 60;
	};

	sleep 1200;

	{deleteVehicle _x} foreach _airvecs;
	{
		_grp = _x;
		_vehicle = vehicle leader _grp;
		deleteVehicle _vehicle;
		sleep 0.2;
		{deleteVehicle _x} foreach units _grp;
		deleteGroup _grp;
	} foreach _airpatrols;

	_airpatrols = nil;
	_airvecs = nil;
};