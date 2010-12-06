if(isServer) then
{
	_point = _this select 0;
	_pointtwo = _this select 1;
	_myGroup = createGroup west;
	_tempSoldier = _myGroup createUnit ["CDF_Soldier_MG",getMarkerPos _point, [], 10, "FORM"];
	_tempSoldier2 = _myGroup createUnit ["CDF_Soldier_GL",getMarkerPos _point, [], 10, "FORM"];
	_myGrouptwo = createGroup west;
	_tempSoldier3 = _myGrouptwo createUnit ["CDF_Soldier",getMarkerPos _pointtwo, [], 10, "FORM"];
	_tempSoldier4 = _myGrouptwo createUnit ["CDF_Soldier_MG",getMarkerPos _pointtwo, [], 10, "FORM"];
	wp = _myGroup addwaypoint [getMarkerPos _point,5];
	wp setWaypointType "GUARD";
	wp setWaypointBehaviour "SAFE";
	wp setWaypointCombatMode "RED";
	wp2 = _myGrouptwo addwaypoint [getMarkerPos _pointtwo,5];
	wp2 setWaypointType "GUARD";
	wp2 setWaypointBehaviour "SAFE";
	wp2 setWaypointCombatMode "RED";
};
