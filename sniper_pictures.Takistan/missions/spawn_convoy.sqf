_missionType = _this select 0;
player globalchat format ["%1",_missionType];
switch (_missionType) do {
  case "convoy": {
    OP_fnc_mission_config = compile preprocessFileLineNumbers "missions\spawn_convoy.d\mission_config.sqf";
    OP_fnc_mission_init = compile preprocessFileLineNumbers "missions\spawn_convoy.d\mission_init.sqf";
    OP_fnc_mission_start = compile preprocessFileLineNumbers "missions\spawn_convoy.d\mission_start.sqf";
    OP_fnc_mission_cleanup = compile preprocessFileLineNumbers "missions\spawn_convoy.d\mission_cleanup.sqf";
  };
  case "silent_elimination": {};
  case "armed_convoy": {
    OP_fnc_mission_config = compile preprocessFileLineNumbers "missions\armed_convoy.d\mission_config.sqf";
    OP_fnc_mission_init = compile preprocessFileLineNumbers "missions\armed_convoy.d\mission_init.sqf";
    OP_fnc_mission_start = compile preprocessFileLineNumbers "missions\armed_convoy.d\mission_start.sqf";
    OP_fnc_mission_cleanup = compile preprocessFileLineNumbers "missions\armed_convoy.d\mission_cleanup.sqf";
  };
  case "sniper_hunt": {};  
};

call OP_fnc_mission_config;
call OP_fnc_mission_init;
START_ACTION = teh_commander addAction ["Start mission","wrappers\confirm.sqf"];
waitUntil {sleep 1; IGNITE_MISSION};
player globalchat "mission started";
teh_commander removeAction START_ACTION;
call OP_fnc_mission_start;

END_ACTION = teh_commander addAction ["End mission","wrappers\end.sqf"];
waitUntil {sleep 1; THEEND_MISSION};
player globalchat "mission ended";
teh_commander removeAction END_ACTION;
call OP_fnc_mission_cleanup;