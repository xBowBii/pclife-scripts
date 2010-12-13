if (isServer) then {
	for "_x" from 1 to 2 do {
		_point = format ["city6p%1", _x];
		_null = [_point] execVM "spawnSquad.sqf";
		sleep 0.1;
	};
	for "_i" from 1 to 5 do {
		_point = format ["city6f%1", _i];
		_null = [_point, 5] execVM "createForestPatrol.sqf";
		sleep 0.1;
	};
	_null = ["city6", 3, 85, 225, 320] execVM "createFortification.sqf";
	_truckTrigger = createTrigger["EmptyDetector",getMarkerPos "city6"];
	_truckTrigger setTriggerArea[300,300,0,false];
	_truckTrigger setTriggerActivation["ANY","PRESENT",false];
	_truckTrigger setTriggerStatements["{_x in thislist} count units group player >= 1", "_null = ['city6','truck6'] execVM 'truckSpawn.sqf';", ""];
	_winTrigger = createTrigger["EmptyDetector",getMarkerPos "city6"];
	_winTrigger setTriggerArea[600,600,0,false];
	_winTrigger setTriggerActivation["ANY","PRESENT",false];
	_winTrigger setTriggerStatements["({side _x==resistance} count thislist == 0) AND ({_x in thislist} count units group player >= 1)", "enemyDown = 1; [-2, {_null = [] execVM _this}, 'task2.sqf'] call CBA_fnc_globalExecute; for '_x' from 1 to 3 do {_montblanc = format ['city6a%1', _x];_null = ['city6', _montblanc] execVM 'spawnAttackers.sqf';};", ""];
};
