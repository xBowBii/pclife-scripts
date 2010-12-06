if(isServer) then
{
	_point = _this select 0;
	_myGroup = createGroup west;
	_tempSoldier = _myGroup createUnit ["CDF_Commander",getMarkerPos _point, [], 25, "FORM"];
	_tempSoldier2 = _myGroup createUnit ["CDF_Soldier_MG",getMarkerPos _point, [], 25, "FORM"];
	_tempSoldier3 = _myGroup createUnit ["CDF_Soldier_Sniper",getMarkerPos _point, [], 25, "FORM"];
	_tempSoldier4 = _myGroup createUnit ["CDF_Soldier",getMarkerPos _point, [], 25, "FORM"];
	_tempSoldier5 = _myGroup createUnit ["CDF_Soldier_GL",getMarkerPos _point, [], 25, "FORM"];
	_tempSoldier6 = _myGroup createUnit ["CDF_Soldier",getMarkerPos _point, [], 25, "FORM"];
	_tempSoldier7 = _myGroup createUnit ["CDF_Soldier_GL",getMarkerPos _point, [], 25, "FORM"];
	_tempSoldier8 = _myGroup createUnit ["CDF_Soldier_AR",getMarkerPos _point, [], 25, "FORM"];
	wp = _myGroup addwaypoint [getMarkerPos _point,5];
	wp setWaypointType "GUARD";
	wp setWaypointBehaviour "SAFE";
	wp setWaypointCombatMode "RED";
};
