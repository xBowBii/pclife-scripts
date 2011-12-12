ace_prevtime = 5;
setViewDistance 3200;
sniper1_score = 0;
sniper1_score = 0;

HEAD_DMG = 0;
BODY_DMG = 0;
HANDS_DMG = 0;
LEGS_DMG = 0;

enableSaving [false, false];

//statistic gathering template
s1_fired = 0;
s1_hit = 0;
s1_deadly = 0;
s1_most_eff_range = 0;

s2_fired = 0;
s2_hit = 0;
s2_deadly = 0;
s2_most_eff_range = 0;

BDKS_DisableBulletCam = true;

BCAM_ACTION = spotter addAction ["Toggle bulletcam on/off", "actions\bcam_toggle.sqf",[],0,false,true,"","player == spotter"];
INF_ACTION = spotter addAction ["Infantry tests", "actions\expand_inf.sqf",[],9,false,false,"","player == spotter"];
VEH_ACTION = spotter addAction ["Vehicle tests", "actions\expand_veh.sqf",[],9,false,false,"","player == spotter"];

(position spotter nearestobject 52928) setdamage 1;
(position spotter nearestobject 52133) setdamage 1;

spotter addEventHandler ["respawn",{INF_ACTION = spotter addAction ["Infantry tests", "actions\expand_inf.sqf",[],10,false,false,"","player == spotter"]; VEH_ACTION = spotter addAction ["Vehicle tests", "actions\expand_veh.sqf",[],10,false,false,"","player == spotter"]; BCAM_ACTION = spotter addAction ["Toggle bulletcam on/off", "actions\bcam_toggle.sqf",[],0,false,true,"","player == spotter"];}];
spotter addEventHandler ["fired",{_this execVM "cam.sqf"}];
sniper_1 addEventHandler ["fired",{_this execVM "cam.sqf"}];
sniper_2 addEventHandler ["fired",{_this execVM "cam.sqf"}];

//add group-time kill

fixObstacles = compile preprocessFileLineNumbers "fixObstacles.sqf";
reportDamage = compile preprocessFileLineNumbers "reportDamage.sqf";

//handlers for each part of body. They filter damage values for further use in reportDamage.sqf.
handleBody = compile preprocessFileLineNumbers "handlers\handler_body.sqf";
handleHead = compile preprocessFileLineNumbers "handlers\handler_head.sqf";
handleHands = compile preprocessFileLineNumbers "handlers\handler_hands.sqf";
handleLegs = compile preprocessFileLineNumbers "handlers\handler_legs.sqf";

//wrapper functions for action-based target spawn. This part for infantry.
spawn_normal = compile preprocessFileLineNumbers "spawn_normal.sqf";
spawn_large = compile preprocessFileLineNumbers "spawn_large.sqf";
spawn_xl = compile preprocessFileLineNumbers "spawn_xl.sqf";
spawn_patrol = compile preprocessFileLineNumbers "spawn_patrol.sqf";

if (isServer) then {["spawnNormal", {call spawn_normal}] call CBA_fnc_addEventHandler;};
if (isServer) then {["spawnLarge", {call spawn_large}] call CBA_fnc_addEventHandler;};
if (isServer) then {["spawnXL", {call spawn_xl}] call CBA_fnc_addEventHandler;};
if (isServer) then {["spawnPatrol", {call spawn_patrol}] call CBA_fnc_addEventHandler;};

//wrappers for vehicle spawn
spawn_lightarmor = compile preprocessFileLineNumbers "spawn_lightarmor.sqf";
spawn_brdm = compile preprocessFileLineNumbers "spawn_brdm.sqf";
spawn_convoy = compile preprocessFileLineNumbers "spawn_convoy.sqf";
spawn_patrol = compile preprocessFileLineNumbers "spawn_patrol.sqf";

if (isServer) then {["spawnLightarmor", {call spawn_lightarmor}] call CBA_fnc_addEventHandler;};
if (isServer) then {["spawnBrdm", {call spawn_brdm}] call CBA_fnc_addEventHandler;};
if (isServer) then {["spawnConvoy200", {[200] call spawn_convoy}] call CBA_fnc_addEventHandler;};
if (isServer) then {["spawnConvoy400", {[400] call spawn_convoy}] call CBA_fnc_addEventHandler;};

//fix cba_global_execute for chats - fixed
//delete eventhandlers before deleting unit - fixed
//fix handle damage spam - fixed
//fix actions on the spotter - fixed
//add body collector - fixed
//add damage amount in onHit notice - fixed
//make game server-slot independent via http://dev-heaven.net/projects/cca/wiki/Custom_Events_System - fixed
//fix action deleting after respawn - fixed
//fix mess with target's status reports - fixed
//custom loadouts for weaponboxes - fixed
//add spotter ability to toggle bulletcam - fixed
//add new guns to bulletcam script - fixed
//add binoculars etc to players and crates - fixed
//add some cover-spawn points to 1500+ range - fixed
//add some cover/in-building spawn points to 300-700 range - fixed?
//add automatic in-building positioning, if it breaks LOS - fixed
//fix elevator