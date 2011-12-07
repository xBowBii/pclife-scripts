ace_prevtime = 5;
sniper1_score = 0;
sniper1_score = 0;
TEH_DRIVER = "";
TEH_DRIVER2 = "";
TEH_GUNNER = "";
TEH_TARGET = "";
TEH_TARGET2 = "";
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

spotter addAction ["Infantry tests", "actions\expand_inf.sqf"];
spotter addAction ["Vehicle tests", "actions\expand_veh.sqf"];

//add group-time kill

fixObstacles = compile preprocessFileLineNumbers "fixObstacles.sqf";
reportDamage = compile preprocessFileLineNumbers "reportDamage.sqf";
