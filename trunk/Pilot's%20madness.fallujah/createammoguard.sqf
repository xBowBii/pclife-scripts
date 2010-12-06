if(isServer) then
{
	_point = _this select 0;
	_myGroup = createGroup east;
	_tempSoldier = _myGroup createUnit ["TK_INS_Soldier_TL_EP1",getMarkerPos _point,[],0.8,"Sergeant"];
	_tempSoldier2 = _myGroup createUnit ["TK_INS_Soldier_EP1",getMarkerPos _point,[],0.6,"Private"];
	wp = _myGroup addwaypoint [getMarkerPos _point,5];
	wp setWaypointType "GUARD";
	wp setWaypointBehaviour "SAFE";
	wp setWaypointCombatMode "RED";
};