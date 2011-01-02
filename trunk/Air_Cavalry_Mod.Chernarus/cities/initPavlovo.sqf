	for "_x" from 1 to 4 do {
		_point = format ["city3p%1", _x];
		_null = [_point] call compile preprocessFileLineNumbers "spawnSquad.sqf";
		sleep 0.1;
	};
	for "_i" from 1 to 4 do {
		_point = format ["city3f%1", _i];
		_null = [_point, 5] call compile preprocessFileLineNumbers "createForestPatrol.sqf";
		sleep 0.1;
	};
	_null = ["city3", 3, 40, 115, 160] execVM "createFortification.sqf";
	_truckTrigger = createTrigger["EmptyDetector",getMarkerPos "city3"];
	_truckTrigger setTriggerArea[300,300,0,false];
	_truckTrigger setTriggerActivation["ANY","PRESENT",false];
	_truckTrigger setTriggerStatements["{_x in thislist} count units group player >= 1", "_null = ['city3','truck3'] execVM 'truckSpawn.sqf';", ""];
	_winTrigger = createTrigger["EmptyDetector",getMarkerPos "city3"];
	_winTrigger setTriggerArea[600,600,0,false];
	_winTrigger setTriggerActivation["ANY","PRESENT",false];
	_winTrigger setTriggerStatements["({side _x==resistance} count thislist == 0) AND ({_x in thislist} count units group player >= 1)", "enemyDown = 1; [-2, {_null = [] execVM _this}, 'task2.sqf'] call CBA_fnc_globalExecute; for '_x' from 1 to 4 do {_montblanc = format ['city3a%1', _x];_null = ['city3', _montblanc] execVM 'spawnAttackers.sqf';};", ""];

