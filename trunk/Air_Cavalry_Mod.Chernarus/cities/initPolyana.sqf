//	_myGroup2 = [getMarkerPos "patrol", EAST, ["GUE_Commander", "GUE_Soldier_GL", "GUE_Soldier_3", "GUE_Soldier_AT", "GUE_Soldier_GL", "GUE_Soldier_2"],[],[],[0.82, 0.7, 0.6, 0.6, 0.65, 0.7],[],[],0] call BIS_fnc_spawnGroup;
//	_null = [leader _myGroup2, "patrol","random"] execVM "UPS.sqf";

	for "_x" from 1 to 4 do {
		_point = format ["city4p%1", _x];
		_null = [_point] call compile preprocessFileLineNumbers "spawnSquad.sqf";
		sleep 0.1;
	};
	for "_i" from 1 to 4 do {
		_point = format ["city4f%1", _i];
		_null = [_point, 5] call compile preprocessFileLineNumbers "createForestPatrol.sqf";
		sleep 0.1;
	};

	_null = ["city4", 5, 140, 330, 165, 275, 225] execVM "createFortification.sqf";
	_truckTrigger = createTrigger["EmptyDetector",getMarkerPos "city4"];
	_truckTrigger setTriggerArea[300,300,0,false];
	_truckTrigger setTriggerActivation["ANY","PRESENT",false];
	_truckTrigger setTriggerStatements["{_x in thislist} count units group player >= 1", "_null = ['city4','truck4'] execVM 'truckSpawn.sqf';", ""];
	_winTrigger = createTrigger["EmptyDetector",getMarkerPos "city4"];
	_winTrigger setTriggerArea[600,600,0,false];
	_winTrigger setTriggerActivation["ANY","PRESENT",false];
	_winTrigger setTriggerStatements["({side _x==resistance} count thislist == 0) AND ({_x in thislist} count units group player >= 1)", "enemyDown = 1; [-2, {_null = [] execVM _this}, 'task2.sqf'] call CBA_fnc_globalExecute; for '_x' from 1 to 3 do {_montblanc = format ['city4a%1', _x];_null = ['city4', _montblanc] execVM 'spawnAttackers.sqf';};", ""];

