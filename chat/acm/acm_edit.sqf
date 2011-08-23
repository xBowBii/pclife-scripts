// тут проверка на админа
if !(serverCommandAvailable "#kick" ) exitWith {};

if (_this == "#acm_main_0") then {
_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";
  _ms set [0, false];
  // _ms = [true,true,true,true,true,true,true];// отрубит пачку каналов true - включен
  ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_State", _ms, true];
};

if (_this == "#acm_main_1") then {
_ms = ACM_Cat_Mod getVariable "ACM_Sln_Chat_State";
  _ms set [0, true];
  ACM_Cat_Mod setVariable ["ACM_Sln_Chat_State", _ms, true];
};

if (_this == "#acm_group_0") then {
_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";
  _ms set [3, false];
  ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_State", _ms, true];
};

if (_this == "#acm_group_1") then {
_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";
  _ms set [3, true];
  ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_State", _ms, true];
};

if (_this == "#acm") then
{
_ok = createDialog "ACM_Sln_Chat_admin";
};