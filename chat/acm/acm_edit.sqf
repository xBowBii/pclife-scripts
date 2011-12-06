
if !isAdmin exitWith {};
if (_this == "#acm_global_0") then {
_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";
  _ms set [0, false];
  ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_State", _ms, true];
};

if (_this == "#acm_blobal_1") then {
_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";
  _ms set [0, true];
  ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_State", _ms, true];
};

if (_this == "#acm_side_1") then {
_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";
  _ms set [1, true];
  ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_State", _ms, true];
};

if (_this == "#acm_side_0") then {
_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";
  _ms set [1, false];
  ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_State", _ms, true];
};

if (_this == "#acm_command_1") then {
_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";
  _ms set [2, true];
  ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_State", _ms, true];
};

if (_this == "#acm_command_0") then {
_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";
  _ms set [2, false];
  ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_State", _ms, true];
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

if (_this == "#acm_vehicle_1") then {
_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";
  _ms set [4, true];
  ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_State", _ms, true];
};

if (_this == "#acm_vehicle_0") then {
_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";
  _ms set [4, false];
  ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_State", _ms, true];
};

if (_this == "#acm_commander_1") then {
_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";
  _ms set [5, true];
  ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_State", _ms, true];
};

if (_this == "#acm_commander_0") then {
_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";
  _ms set [5, false];
  ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_State", _ms, true];
};

if (_this == "#acm_direct_1") then {
_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";
  _ms set [6, true];
  ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_State", _ms, true];
};

if (_this == "#acm_direct_0") then {
_ms = ACM_Sln_Cat_Mod getVariable "ACM_Sln_Chat_State";
  _ms set [6, false];
  ACM_Sln_Cat_Mod setVariable ["ACM_Sln_Chat_State", _ms, true];
};

if (_this == "#acm_help") then {
hint "Admin, Command line\n\nChannels\n#acm_global_0\n#acm_global_1\n\n#acm_side_1\n#acm_side_0\n\n#acm_command_1\n#acm_command_0\n\n#acm_group_0\n#acm_group_1\n\n#acm_vehicle_1\n#acm_vehicle_0\n\n#acm_commander_1\n#acm_commander_0\n\n#acm_direct_1\n#acm_direct_0\n\nAdmin panel\n#acm\n\nHelp\n#acm_help";
};

if (_this == "#acm") then {
_ok = createDialog "ACM_Sln_Chat_admin";
};