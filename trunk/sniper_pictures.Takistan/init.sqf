enableSaving [false, false];
setViewDistance 2000;

IGNITE_MISSION = false;
THEEND_MISSION = false;
RANDOM_VALUE = 0;

ALLIED_UNITS = [teh_commander, spotter_1, sniper_1, spotter_2, sniper_2];

fnc_global_teleport = {
  private "_point";
  _point = _this select 0;
  
  _atv1 = createVehicle ["ACE_ATV_Honda_Desert", getMarkerPos _point, [], 5, "FORM"];
  _atv2 = createVehicle ["ACE_ATV_Honda_Desert", getMarkerPos _point, [], 5, "FORM"];
  _atv3 = createVehicle ["ACE_ATV_Honda_Desert", getMarkerPos _point, [], 5, "FORM"];

  "dynamicBlur" ppEffectEnable true;
  "dynamicBlur" ppEffectAdjust [9];
  "dynamicBlur" ppEffectCommit 0.1;
  {
    if (alive _x) then {
      _x setPosATL [(getMarkerPos _point select 0) + (random 3), (getMarkerPos _point select 1) + (random 3), 0];
    };
  } foreach ALLIED_UNITS;
  sleep 1;
  "dynamicBlur" ppEffectAdjust [0.5];
  "dynamicBlur" ppEffectCommit 3.5;
  sleep 1;
  "dynamicBlur" ppEffectEnable false;
};

fnc_home_teleport = {
  private "_point";
  _point = "respawn_west";

  "dynamicBlur" ppEffectEnable true;
  "dynamicBlur" ppEffectAdjust [9];
  "dynamicBlur" ppEffectCommit 0.1;
  {
    if (alive _x) then {
      _x setPosATL [(getMarkerPos _point select 0) + (random 4), (getMarkerPos _point select 1) + (random 4), 0];
    };
  } foreach ALLIED_UNITS;
  sleep 0.5;
  "dynamicBlur" ppEffectAdjust [0.1];
  "dynamicBlur" ppEffectCommit 5;
  sleep 0.5;
  "dynamicBlur" ppEffectEnable false;
};

{
  if (alive _x) then {
    removeallweapons _x;
    {_x removeMagazine _x} forEach magazines _x;
    _x addWeapon "Binocular_Vector";
    _x addWeapon "ACE_earplugs";
    _x addMagazineCargo ["ACE_Battery_Rangefinder",1];
  };
} foreach ALLIED_UNITS;

TEST_ACTION1 = task_manager addAction ["Spawn eliminate convoy mission", "wrappers\convoy_light.sqf",[],10,false,false,"","player == teh_commander"];
TEST_ACTION2 = task_manager addAction ["Spawn eliminate armoured convoy mission", "wrappers\convoy_armed.sqf",[],10,false,false,"","player == teh_commander"];

spawn_convoy = compile preprocessFileLineNumbers "missions\spawn_convoy.sqf";
if (isServer) then {["spawnConvLight", {["convoy"] call spawn_convoy}] call CBA_fnc_addEventHandler;};
if (isServer) then {["spawnConvArm", {["armed_convoy"] call spawn_convoy}] call CBA_fnc_addEventHandler;};