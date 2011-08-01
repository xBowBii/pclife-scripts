//by Bon_Inf*

if(not isServer) exitWith{};

private ["_patrols"];

_location = _this select 0;
_patrollocations = nearestLocations [position _location,["Name","NameCity","NameCityCapital","NameVillage","NameLocal"],2000];


for "_i" from 1 to tfor_maxnumber_footpatrols do {

	_Grp = [tfor_enemy_side,5,position _location,50] call spawnInf;

	if(isNil "_patrols") then{_patrols = units _Grp} else{_patrols = _patrols + units _grp};

	_Grp setBehaviour "SAFE";
	_Grp setSpeedMode "LIMITED";
	_Grp setFormation "COLUMN";

	_patrollocations = _patrollocations call getArrayPermutation;

	{
		if(position _x distance getMarkerPos format["respawn_%1",tfor_friendly_side] > 500) then {
			(_Grp addWaypoint [position _x,100]) setWaypointType "MOVE";
		};
	} foreach _patrollocations;

	(_Grp addWaypoint [position _location,50]) setWaypointType "CYCLE";
};


_patrols spawn tfor_cleanup_after_mission; // <- for cleanup