_respMarkers = ["respawn_west", "respawn_west_1", "respawn_west_2", "respawn_west_3", "respawn_west_4", "respawn_west_5", "respawn_west_6", "respawn_west_7"];
_respDirs = [0, 45, 90, 135, 180, 225, 270, 315];
_respVelocities = [[0,250,20], [200,200,20], [250,0,20], [200,-200,20], [0,-250,20], [-200,-200,20], [-250,0,20], [-200,200,20]];
_aircraftTypes = ["L39_TK_EP1", "A10_US_EP1", "Su25_TK_EP1", "AV8B", "F35B", "An2_TK_EP1", "ACE_Su27_CAP", "ACE_Su30_Des", "ACE_Su34_MR_Des", "ACE_AH6_GAU19", "AH6J_EP1", "Chukar_EP1"];

_predef_aircraftType = _aircraftTypes select (paramsArray select 0);

while {TRUE} do {
	waitUntil {alive player};
	_plane = createVehicle [_predef_aircraftType, position player, [], 200, "FLY"];
	_respMarker = "respawn_west"; {if ((player distance (markerPos _x)) < (player distance (markerPos _respMarker))) then {_respMarker = _x}} forEach _respMarkers;
	_plane setVelocity (_respVelocities select (_respMarkers find _respMarker));
	_plane setDir (_respDirs select (_respMarkers find _respMarker));
	_plane setPos [(position _plane) select 0, (position _plane) select 1, 250];
	[_plane] spawn {
		_plane = _this select 0;
		waitUntil {!(canMove _plane) || !(alive player)};
		sleep 20;
		deleteVehicle _plane
	};
	
	player assignAsDriver _plane;
	player moveInDriver _plane;
	player addRating -999999;
	_wp = group player addWaypoint [markerPos "BIS_spaceCenter", 0];
	_wp setWaypointType "SAD";
	
	waitUntil {!(alive player)}
}