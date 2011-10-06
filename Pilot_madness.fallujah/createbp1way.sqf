if(isServer) then
{
	_point = _this select 0;
	_pgun = _this select 1;
	_dgun = _this select 2;
	_myGroup = createGroup east;
	_tempSoldier = _myGroup createUnit ["TK_INS_Soldier_TL_EP1",getMarkerPos _point,[],0.8,"Sergeant"];
	_tempSoldier2 = _myGroup createUnit ["TK_INS_Soldier_EP1",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier3 = _myGroup createUnit ["TK_INS_Soldier_EP1",getMarkerPos _point,[],0.6,"Private"];
	_gun = "DSHkM_Mini_TriPod_TK_INS_EP1" createVehicle (getMarkerPos _pgun);
	_gun setDir _dgun;
	_tempSoldier4 = _myGroup createUnit ["TK_INS_Soldier_3_EP1",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier4 moveInGunner _gun;
	wp = _myGroup addwaypoint [getMarkerPos _point,5];
	wp setWaypointType "GUARD";
	wp setWaypointBehaviour "SAFE";
	wp setWaypointCombatMode "RED";
};