if (isServer) then {
	_point = _this select 0;
	_triggerPos = _this select 1;

	_myGroup = createGroup east;
	_tempSoldier = _myGroup createUnit ["GUE_Soldier_Pilot",getMarkerPos frog1,[],0.8,"Sergeant"];
	_tempSoldier2 = _myGroup createUnit ["GUE_Soldier_Pilot",getMarkerPos frog2,[],0.6,"Private"];

	plane1 = createVehicle ["Su25_Ins", getMarkerPos "frog1", [], 0, "FLY"]
	plane2 = createVehicle ["Su25_Ins", getMarkerPos "frog2", [], 0, "FLY"]

	_tempSoldier moveInDriver plane2;
	_tempSoldier2 moveInDriver plane1;

	_wp = _myGroup addwaypoint [getMarkerPos _point, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "CARELESS";
	_wp setWaypointCombatMode "BLUE";
	_wp = _myGroup addwaypoint [getMarkerPos "wpend", 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "CARELESS";
	_wp setWaypointCombatMode "BLUE";

	_bombTrigger = createTrigger["EmptyDetector", getMarkerPos _triggerPos];
	_bombTrigger setTriggerArea[30,1000,0,false];
	_bombTrigger setTriggerActivation["GUER","PRESENT",false];
	_bombTrigger setTriggerStatements["this", "_null = [] execVM 'bomb.sqf';", ""];
};