if(isServer) then
{
	_point = _this select 0;
	_myGroup = createGroup east;
	_tempSoldier = _myGroup createUnit ["TK_INS_Soldier_TL_EP1",getMarkerPos _point,[],0.8,"Sergeant"];
	_tempSoldier2 = _myGroup createUnit ["TK_INS_Soldier_MG_EP1",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier3 = _myGroup createUnit ["TK_INS_Soldier_AR_EP1",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier4 = _myGroup createUnit ["TK_INS_Soldier_3_EP1",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier5 = _myGroup createUnit ["TK_INS_Soldier_Sniper_EP1",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier6 = _myGroup createUnit ["TK_INS_Soldier_AT_EP1",getMarkerPos _point,[],0.6,"Private"];
	_null = [leader _myGroup, _point,"random"] execVM "UPS.sqf";
};
