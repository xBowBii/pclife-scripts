if(isServer) then
{
	_point = _this select 0;
	_point2 = _this select 1;
	_myGroup = createGroup east;
	_tempSoldier = _myGroup createUnit ["TK_INS_Soldier_TL_EP1",getMarkerPos _point,[],0.8,"Sergeant"];
	_tempSoldier2 = _myGroup createUnit ["TK_INS_Soldier_MG_EP1",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier3 = _myGroup createUnit ["TK_INS_Soldier_AR_EP1",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier4 = _myGroup createUnit ["TK_INS_Soldier_3_EP1",getMarkerPos _point,[],0.6,"Private"];
	_wp = _myGroup addwaypoint [getMarkerPos _point2,5];
	_wp setWaypointType "GUARD";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointHousePosition 8;
};