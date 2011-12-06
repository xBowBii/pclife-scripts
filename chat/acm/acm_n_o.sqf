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
		if (_a < 7) then {
			lnbAddRow [5002, ""];
		lnbSetPicture [5002,[_a, 0], "\ca\ui\data\ui_task_none_ca.paa"];
		};
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
		
	ACM_Sln_Cat_Mod setVariable [format ["ACM_Sln_Chat_%1", _tx], _ms, true];
};

fn_chat_load = {
if isServer then {
	ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_Key", getText (configFile >> "ACM_chat_key"),true]
};
if isDedicated exitWith {};
	ACM_Sln_Cat_Mod setVariable [format ["ACM_Sln_Chat_%1", name Player], [true,true,true,true,true,true,true], true];
	Ms_nCC = [];
	_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_Function";
	{Ms_nCC set [count Ms_nCC, localize _x]} forEach (_ms select 1);
	if (isClass (configFile >> "ACM_Sln_Chat_admin")) exitWith {
		hint "Admin, Command line\n\n#acm_main_0\n#acm_main_0\n\n#acm_group_0\n#acm_group_1\n\n#acm";
		};
	_fn_lock = _ms select 2;
	disableSerialization;
	while {true} do
	{
		waitUntil {!isNull (findDisplay 63) || !(isNull (findDisplay 24)};
		_dc = findDisplay 63;
		[_dc] Spawn _fn_lock;
		waitUntil {isNull _dc};
	};
};
fn_chat_lock = compile preprocessFileLineNumbers '\acm\acm_e_o.sqf';

_Ms_nCC = [
"str_channel_global",
"str_channel_side",
"str_channel_command",
"str_channel_group",
"str_channel_vehicle",
"str_commander",
"str_channel_direct",
"STR_ACM_CHANNEL_Leader"
];

if (isNil "ACM_Sln_Cat_Mod") then {
	ACM_Sln_Cat_Mod = "HeliHEmpty" createVehicle [0,0];
	ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_State", [true,true,true,true,true,true,true,true], true];
	ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_Function",[
	fn_chat_load, _Ms_nCC, fn_chat_lock
	], true];
	ACM_Sln_Cat_Mod setVehicleInit "
		ACM_Sln_Cat_Mod = this;
		this setVehicleVarName 'ACM_Sln_Cat_Mod';
		as = [] Spawn ((this getVariable 'ACM_Sln_Chat_Function') select 0)
		";
	processInitCommands;
};
sleep 2;
_tx = getText (configFile >> "ACM_chat_key");
isAdmin = (ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_Key") == _tx;
