sleep 1;
_null = ["ammocrate1"] execVM "fillCrateUs.sqf";
_null = ["ammocrate2"] execVM "fillCrateRus.sqf";
_null = ["ammocrate3"] execVM "fillCrateSpec.sqf";
// AND NOW FUCKING CRATES IN FUCKING CHOOSE OBJECTIVE SCRIPT
//if (isServer) then {
if (!isServer) exitwith{};
	_randName = (ceil random 11);
//	_randName = 4;
	_point = format ["city%1", _randName];
	taskpoint = _point;
	publicVariable "taskpoint";
	enemyDown = 0;
	[-2, {_null = [] execVM _this}, "task.sqf"] call CBA_fnc_globalExecute;
	switch (_randName) do
	{
		case 1: {_null = [] execVM "cities\initDolina.sqf";};
		case 2: {_null = [] execVM "cities\initMogilevka.sqf";};
		case 3: {_null = [] execVM "cities\initPavlovo.sqf";};
		case 4: {_null = [] execVM "cities\initPolyana.sqf";};
		case 5: {_null = [] execVM "cities\initSobor.sqf";};
		case 6: {_null = [] execVM "cities\initKamyshovo.sqf";};
		case 7: {_null = [] execVM "cities\initGvozdno.sqf";};
		case 8: {_null = [] execVM "cities\initGorka.sqf";};
		case 9: {_null = [] execVM "cities\initPustoshka.sqf";};
		case 10: {_null = [] execVM "cities\initZeleno.sqf";};
		case 11: {_null = [] execVM "cities\initStaroe.sqf";};
	};
//};