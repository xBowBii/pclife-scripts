if (isServer) then {
	_randName = random 4;
	_randName = ceil _randName;
	_point = format ["city%1", _randName];
	taskpoint = _point;
	[-2, {_null = [] execVM _this}, "task.sqf"] call CBA_fnc_globalExecute;
	enemyDown = 0;
	switch (_randName) do
	{
		case 1:
		{
			_rand = random 4;
			_rand = ceil _rand;
			for "_x" from 1 to 4 do {
				_point = format ["city1p%1", _x];
				_null = [_point, _rand] execVM "spawnSquad.sqf";
			};
			_null = ["city1f1",5] execVM "createForestPatrol.sqf";
			_null = ["city1f2",5] execVM "createForestPatrol.sqf";
			_null = ["city1f3",5] execVM "createForestPatrol.sqf";
			_null = ["city1f4",5] execVM "createForestPatrol.sqf";
			_null = ["city1", 4, [445, 445, 280, 285]] execVM "createFortification.sqf";
			_truckTrigger = createTrigger["EmptyDetector",getMarkerPos "city1"];
			_truckTrigger setTriggerArea[300,300,0,false];
			_truckTrigger setTriggerActivation["ANY","PRESENT",false];
			_truckTrigger setTriggerStatements["{_x in thislist} count units group player >= 1", "_null = ['city1','truck1'] execVM 'truckSpawn.sqf';", ""];
		};
		case 2:
		{
			_rand = random 4;
			_rand = ceil _rand;
			for "_x" from 1 to 4 do {
				_point = format ["city2p%1", _x];
				_null = [_point, _rand] execVM "spawnSquad.sqf";
			};
			_null = ["city2f1",5] execVM "createForestPatrol.sqf";
			_null = ["city2f2",5] execVM "createForestPatrol.sqf";
			_null = ["city2f3",5] execVM "createForestPatrol.sqf";
			_null = ["city2f4",5] execVM "createForestPatrol.sqf";
			_null = ["city2", 8, [125, 125, 195, 195, 340, 310, 25, 25]] execVM "createFortification.sqf";
			_truckTrigger = createTrigger["EmptyDetector",getMarkerPos "city2"];
			_truckTrigger setTriggerArea[300,300,0,false];
			_truckTrigger setTriggerActivation["ANY","PRESENT",false];
			_truckTrigger setTriggerStatements["{_x in thislist} count units group player >= 1", "_null = ['city2','truck2'] execVM 'truckSpawn.sqf';", ""];
		};
		case 3:
		{
			_rand = random 4;
			_rand = ceil _rand;
			for "_x" from 1 to 4 do {
				_point = format ["city3p%1", _x];
				_null = [_point, _rand] execVM "spawnSquad.sqf";
			};
			_null = ["city3f1",5] execVM "createForestPatrol.sqf";
			_null = ["city3f2",5] execVM "createForestPatrol.sqf";
			_null = ["city3f3",5] execVM "createForestPatrol.sqf";
			_null = ["city3f4",5] execVM "createForestPatrol.sqf";
			_null = ["city3", 6, [40, 35, 115, 115, 160, 160]] execVM "createFortification.sqf";
			_truckTrigger = createTrigger["EmptyDetector",getMarkerPos "city3"];
			_truckTrigger setTriggerArea[300,300,0,false];
			_truckTrigger setTriggerActivation["ANY","PRESENT",false];
			_truckTrigger setTriggerStatements["{_x in thislist} count units group player >= 1", "_null = ['city3','truck3'] execVM 'truckSpawn.sqf';", ""];
		};
		case 4:
		{
			_rand = random 4;
			_rand = ceil _rand;
			for "_x" from 1 to 4 do {
				_point = format ["city4p%1", _x];
				_null = [_point, _rand] execVM "spawnSquad.sqf";
			};
			_null = ["city4f1",5] execVM "createForestPatrol.sqf";
			_null = ["city4f2",5] execVM "createForestPatrol.sqf";
			_null = ["city4f3",5] execVM "createForestPatrol.sqf";
			_null = ["city4f4",5] execVM "createForestPatrol.sqf";
			_null = ["city4", 9, [155, 140, 330, 330, 200, 165, 275, 245, 225]] execVM "createFortification.sqf";
			_truckTrigger = createTrigger["EmptyDetector",getMarkerPos "city4"];
			_truckTrigger setTriggerArea[300,300,0,false];
			_truckTrigger setTriggerActivation["ANY","PRESENT",false];
			_truckTrigger setTriggerStatements["{_x in thislist} count units group player >= 1", "_null = ['city4','truck4'] execVM 'truckSpawn.sqf';", ""];
		};
	};
};