if(isServer) then
{
	_rand = random 2;
	_rand = floor _rand;
	_point = _this select _rand;
	p = _point;
	//p = _rand;
	//_myGroup = createGroup east;
	//_tempSoldier = _myGroup createUnit ["TK_INS_Soldier_TL_EP1",getMarkerPos _point,[],0.8,"Sergeant"];
	//_tempSoldier2 = _myGroup createUnit ["TK_INS_Soldier_3_EP1",getMarkerPos _point,[],0.6,"Private"];
	//wp = _myGroup addwaypoint [getMarkerPos _point,3];
	//wp setWaypointType "GUARD";
	_trg=createTrigger["EmptyDetector",getMarkerPos _point];
	_trg setTriggerArea[30,30,0,false];
	_trg setTriggerActivation["WEST","PRESENT",false];
	_string = format ["%1", getMarkerPos _point];
	// player sideChat _string;
	_trg setTriggerStatements["this", "_null = [] execVM 'spawnjohn.sqf';", ""];
};
