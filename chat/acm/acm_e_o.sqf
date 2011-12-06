disableSerialization;
_cn = (_this select 0) displayCtrl 101;
WaitUntil {ctrlText _cn != ""};// получение названия канала
_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";// глобальные фпаги
_mn = ACM_Sln_Cat_Mod getVariable format ["ACM_Sln_Chat_%1", name Player];//локальные флаги
// проверка флагов
if (
switch (ctrlText _cn) do
{
	case (Ms_nCC select 0):{
		if isAdmin then {true} else {
		(_ms select 0) && (_mn select 0)
		}
	};
	case (Ms_nCC select 1):{
		(_ms select 1) && (_mn select 1)
	};
	case (Ms_nCC select 2):{
		(_ms select 2) && (_mn select 2)
	};
	case (Ms_nCC select 3):{
		if (Player == leader Player) then {
		(_ms select 7) && (_mn select 3)
		} else {
		(_ms select 3) && (_mn select 3)
		}
	};
	case (Ms_nCC select 4):{
		(_ms select 4) && (_mn select 4)
	};
	case (Ms_nCC select 5):{
		(_ms select 5) && (_mn select 5)
	};
	case (Ms_nCC select 6):{
		(_ms select 6) && (_mn select 6)
	};
	default {
		false
	}
}
) then {
	((findDisplay 24) displayCtrl 101) ctrlShow true;
	ctrlSetFocus ((findDisplay 24) displayCtrl 101)
} else {
	_cn ctrlSetText localize "str_no_action";
	((findDisplay 24) displayCtrl 101) ctrlShow false;
	((findDisplay 24) displayCtrl 101) ctrlSetText "";
};

