// запускается из конфига, при открытии ввода.
// onLoad = "_as = [] execVM 'control_chat\e_o.sqf'";
if false exitWith {};// набор условий для отмены блокировки, админ
disableSerialization;
_cn = (findDisplay 63) displayCtrl 101;
WaitUntil {ctrlText _cn != ""};// получение названия канала
_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";
_mn = ACM_Sln_Cat_Mod getVariable format ["ACM_Sln_Chat_%1", name Player];
_nb = false;

switch (ctrlText _cn) do {
	case (Ms_nCC select 0):{
		if (serverCommandAvailable "#kick" ) then {
			_nb = true
		} else {
			_nb = (_ms select 0) && (_mn select 0)
		};
	};
	case (Ms_nCC select 1):{
		_nb = (_ms select 1) && (_mn select 1)
	};
	case (Ms_nCC select 2):{
		_nb = (_ms select 2) && (_mn select 2)
	};
	case (Ms_nCC select 3):{
		_nb = (_ms select 3) && (_mn select 3)
	};
	case (Ms_nCC select 4):{
		_nb = (_ms select 4) && (_mn select 4)
	};
	case (Ms_nCC select 5):{
		_nb = (_ms select 5) && (_mn select 5)
	};
	case (Ms_nCC select 6):{
		_nb = (_ms select 6) && (_mn select 6)
	};
	default {
		//hint format ["Unknow Channel\n%1",ctrlText _cn]
	};
};
if false then {_nb = false};// набор условий для обязательной блокировки.
if ! _nb then {
	_cn ctrlSetText localize "STR_ACM_CHANNEL_CLOSED_NOW";
	((_this select 0) displayCtrl 101) ctrlShow false
};
