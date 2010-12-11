if (isServer) then {
	_randName = random 5;
	_randName = ceil _randName;
	_point = format ["city%1", _randName];
	taskpoint = _point;
	publicVariable "taskpoint";
	enemyDown = 0;
	[-2, {_null = [] execVM _this}, "task.sqf"] call CBA_fnc_globalExecute;
	switch (_randName) do
	{
		case 1:
		{
			_rand = random 4;
			_rand = ceil _rand;
			for "_x" from 1 to 4 do {
				_point = format ["city1p%1", _x];
				_null = [_point, _rand] execVM "spawnSquad.sqf";
				sleep 0.1;
			};
			for "_i" from 1 to 4 do {
				_point = format ["city1f%1", _i];
				_null = [_point, 5] execVM "createForestPatrol.sqf";
				sleep 0.1;
			};
			_null = ["city1", 2, 445, 285] execVM "createFortification.sqf";
			_truckTrigger = createTrigger["EmptyDetector",getMarkerPos "city1"];
			_truckTrigger setTriggerArea[300,300,0,false];
			_truckTrigger setTriggerActivation["ANY","PRESENT",false];
			_truckTrigger setTriggerStatements["{_x in thislist} count units group player >= 1", "_null = ['city1','truck1'] execVM 'truckSpawn.sqf';", ""];
			_winTrigger = createTrigger["EmptyDetector",getMarkerPos "city1"];
			_winTrigger setTriggerArea[600,600,0,false];
			_winTrigger setTriggerActivation["ANY","PRESENT",false];
			_winTrigger setTriggerStatements["({side _x==resistance} count thislist == 0) AND ({_x in thislist} count units group player >= 1)", "enemyDown = 1; [-2, {_null = [] execVM _this}, 'task2.sqf'] call CBA_fnc_globalExecute; for '_x' from 1 to 2 do {_montblanc = format ['city1a%1', _x];_null = ['city1', _montblanc] execVM 'spawnAttackers.sqf';};", ""];
		};
		case 2:
		{
			_rand = random 4;
			_rand = ceil _rand;
			for "_x" from 1 to 4 do {
				_point = format ["city2p%1", _x];
				_null = [_point, _rand] execVM "spawnSquad.sqf";
				sleep 0.1;
			};
			for "_i" from 1 to 4 do {
				_point = format ["city2f%1", _i];
				_null = [_point, 5] execVM "createForestPatrol.sqf";
				sleep 0.1;
			};
			_null = ["city2", 4, 125, 195, 310, 25] execVM "createFortification.sqf";
			_truckTrigger = createTrigger["EmptyDetector",getMarkerPos "city2"];
			_truckTrigger setTriggerArea[300,300,0,false];
			_truckTrigger setTriggerActivation["ANY","PRESENT",false];
			_truckTrigger setTriggerStatements["{_x in thislist} count units group player >= 1", "_null = ['city2','truck2'] execVM 'truckSpawn.sqf';", ""];
			_winTrigger = createTrigger["EmptyDetector",getMarkerPos "city2"];
			_winTrigger setTriggerArea[600,600,0,false];
			_winTrigger setTriggerActivation["ANY","PRESENT",false];
			_winTrigger setTriggerStatements["({side _x==resistance} count thislist == 0) AND ({_x in thislist} count units group player >= 1)", "enemyDown = 1; [-2, {_null = [] execVM _this}, 'task2.sqf'] call CBA_fnc_globalExecute; for '_x' from 1 to 4 do {_montblanc = format ['city2a%1', _x];_null = ['city2', _montblanc] execVM 'spawnAttackers.sqf';};", ""];
		};
		case 3:
		{
			_rand = random 4;
			_rand = ceil _rand;
			for "_x" from 1 to 4 do {
				_point = format ["city3p%1", _x];
				_null = [_point, _rand] execVM "spawnSquad.sqf";
				sleep 0.1;
			};
			for "_i" from 1 to 4 do {
				_point = format ["city3f%1", _i];
				_null = [_point, 5] execVM "createForestPatrol.sqf";
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
		};
		case 4:
		{
			_rand = random 4;
			_rand = ceil _rand;
			for "_x" from 1 to 4 do {
				_point = format ["city4p%1", _x];
				_null = [_point, _rand] execVM "spawnSquad.sqf";
				sleep 0.1;
			};
			for "_i" from 1 to 4 do {
				_point = format ["city4f%1", _i];
				_null = [_point, 5] execVM "createForestPatrol.sqf";
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
		};
		case 5:
		{
			_rand = random 4;
			_rand = ceil _rand;
			for "_x" from 1 to 4 do {
				_point = format ["city5p%1", _x];
				_null = [_point, _rand] execVM "spawnSquad.sqf";
				sleep 0.1;
			};
			for "_i" from 1 to 5 do {
				_point = format ["city5f%1", _i];
				_null = [_point, 5] execVM "createForestPatrol.sqf";
				sleep 0.1;
			};
			_null = ["city5", 5, 80, 180, 220, 315, 85] execVM "createFortification.sqf";
			_truckTrigger = createTrigger["EmptyDetector",getMarkerPos "city5"];
			_truckTrigger setTriggerArea[300,300,0,false];
			_truckTrigger setTriggerActivation["ANY","PRESENT",false];
			_truckTrigger setTriggerStatements["{_x in thislist} count units group player >= 1", "_null = ['city5','truck5'] execVM 'truckSpawn.sqf';", ""];
			_winTrigger = createTrigger["EmptyDetector",getMarkerPos "city5"];
			_winTrigger setTriggerArea[600,600,0,false];
			_winTrigger setTriggerActivation["ANY","PRESENT",false];
			_winTrigger setTriggerStatements["({side _x==resistance} count thislist == 0) AND ({_x in thislist} count units group player >= 1)", "enemyDown = 1; [-2, {_null = [] execVM _this}, 'task2.sqf'] call CBA_fnc_globalExecute; for '_x' from 1 to 3 do {_montblanc = format ['city5a%1', _x];_null = ['city4', _montblanc] execVM 'spawnAttackers.sqf';};", ""];
		};
	};
};