if isServer then {
	ACM_Sln_Cat_Mod = "HeliHEmpty" createVehicle [0,0];
	ACM_Sln_Cat_Mod setVehicleInit "ACM_Sln_Cat_Mod = this";
	processInitCommands;
	ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_State", [true,true,true,true,true,true,true], true];
} else {
	ACM_Sln_Cat_Mod = call compile "ACM_Sln_Cat_Mod";
};
if (isPlayer Player) then {
	ACM_Sln_Cat_Mod setVariable [format ["ACM_Sln_Chat_%1", name Player], [true,true,true,true,true,true,true], true];
};
		
Ms_nCC = [
localize "str_channel_global",
localize "str_channel_side",
localize "str_channel_command",
localize "str_channel_group",
localize "str_channel_vehicle",
localize "str_commander",
localize "str_channel_direct"
];

Fn_chat_select = {
	disableSerialization;

_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";

	for "_a" from 0 to (count _ms)-1 do {
		lnbAddRow [5001, ["", Ms_nCC select _a]];
		lnbSetPicture [5001,[_a, 0], 
		if (_ms select _a) then {
			"\ca\ui\data\ui_task_done_ca.paa"
		} else {
			"\ca\ui\data\ui_task_failed_ca.paa"
		}];
		lnbAddRow [5002, ""];
		lnbSetPicture [5002,[_a, 0], "\ca\ui\data\ui_task_none_ca.paa"];
	};

{
		_a = lnbAddRow [5003, ["", name _x]];
		lnbSetPicture [5003,[_a, 0], 
		Switch (Side _x) do {
			case East:{"\ca\ui\data\flag_opfor_ca.paa"};
			case West:{"\ca\ui\data\flag_bluefor_ca.paa"};
			case Civilian:{"\ca\ui\data\flag_civil_ca.paa"};
			case Resistance:{"\ca\ui\data\flag_indep_ca.paa"};
			default {"\ca\ui\data\flag_none_ca.paa"};
		}];
	} forEach playableUnits;
};
// вкл/выкл общих каналов
fn_chat_flag = {
	_a = _this select 1;
	_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";
	lnbSetPicture [5001,[_a, 0], 
		if (_ms select _a) then {
			_ms set [_a, false];
			"\ca\ui\data\ui_task_failed_ca.paa"
		} else {
			_ms set [_a, true];
			"\ca\ui\data\ui_task_done_ca.paa"
		}];
	ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_State", _ms, true];
};
//выбор игрока
fn_chat_selPlayer = {
	disableSerialization;
	_cn = (findDisplay 5064) displayCtrl 5003;
	_tx = _cn  lnbText [_this select 1, 1];
	_ms = ACM_Sln_Cat_Mod getVariable format ["ACM_Sln_Chat_%1", _tx];
	for "_a" from 0 to (count _ms)-1 do {
		lnbSetPicture [5002,[_a, 0], 
		if (_ms select _a) then {
			"\ca\ui\data\ui_task_done_ca.paa"
		} else {
			"\ca\ui\data\ui_task_failed_ca.paa"
		}];
	};
};
//вкл/выкл каналов игрока
fn_chat_flagPlayer = {
	disableSerialization;
	_a = _this select 1;
	_cn = (findDisplay 5064) displayCtrl 5003;
	_tx = _cn lnbText [lnbCurSelRow 5003, 1];
	_ms = ACM_Sln_Cat_Mod getVariable format ["ACM_Sln_Chat_%1", _tx];
	
	lnbSetPicture [5002,[_a, 0], 
		if (_ms select _a) then {
			_ms set [_a, false];
			"\ca\ui\data\ui_task_failed_ca.paa"
		} else {
			_ms set [_a, true];
			"\ca\ui\data\ui_task_done_ca.paa"
		}];
		
	_ms = ACM_Sln_Cat_Mod setVariable [format ["ACM_Sln_Chat_%1", _tx], _ms, true];
};