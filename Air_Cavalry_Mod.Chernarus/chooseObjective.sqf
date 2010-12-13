sleep 1;
if (isServer) then {
//	_randName = random 11;
	_randName = (ceil random 11);
	_point = format ["city%1", _randName];
	taskpoint = _point;
	publicVariable "taskpoint";
	enemyDown = 0;
	[-2, {_null = [] execVM _this}, "task.sqf"] call CBA_fnc_globalExecute;
	switch (_randName) do
	{
		case 1: //dolina
		{
			_null = [] execVM "cities\initDolina.sqf";
		};
		case 2: //Mogilevka
		{
			_null = [] execVM "cities\initMogilevka.sqf";
		};
		case 3: //Pavlovo
		{
			_null = [] execVM "cities\initPavlovo.sqf";
		};
		case 4: //Polyana
		{
			_null = [] execVM "cities\initPolyana.sqf";
		};
		case 5: //St. Sobor
		{
			_null = [] execVM "cities\initSobor.sqf";
		};
		case 6: //Kamysh
		{
			_null = [] execVM "cities\initKamyshovo.sqf";
		};
		case 7: //Gvozdno
		{
			_null = [] execVM "cities\initGvozdno.sqf";
		};
		case 8: //Gorka
		{
			_null = [] execVM "cities\initGorka.sqf";
		};
		case 9: //Pustoshka
		{
			_null = [] execVM "cities\initPustoshka.sqf";
		};
		case 10: //Zeleno
		{
			_null = [] execVM "cities\initZeleno.sqf";
		};
		case 11: //Staroe
		{
			_null = [] execVM "cities\initStaroe.sqf";
		};
	};
};