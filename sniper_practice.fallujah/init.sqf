ace_prevtime = 5;
sniper1_score = 0;
sniper1_score = 0;
TEH_DRIVER = "";
TEH_DRIVER2 = "";
TEH_GUNNER = "";
TEH_TARGET = "";
TEH_TARGET2 = "";

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

INF_ACTION = spotter addAction ["Infantry tests", "actions\expand_inf.sqf"];
VEH_ACTION = spotter addAction ["Vehicle tests", "actions\expand_veh.sqf"];

//add group-time kill

fixObstacles = compile preprocessFileLineNumbers "fixObstacles.sqf";
reportDamage = compile preprocessFileLineNumbers "reportDamage.sqf";

handleBody = compile preprocessFileLineNumbers "handlers\handler_body.sqf";
handleHead = compile preprocessFileLineNumbers "handlers\handler_head.sqf";
handleHands = compile preprocessFileLineNumbers "handlers\handler_hands.sqf";
handleLegs = compile preprocessFileLineNumbers "handlers\handler_legs.sqf";

//fix cba_global_execute for chats
//delete eventhandlers before deleting unit - fixed?
//fix handle damage spam - fixed?
//fix actions on the spotter - fixed?
//add body collector
//add damage amount in onHit notice