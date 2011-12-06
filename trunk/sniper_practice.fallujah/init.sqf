ace_prevtime = 5;
sniper1_score = 0;
sniper1_score = 0;
enableSaving [false, false];

spotter addAction ["Spawn target at 300-700m", "spawn_normal.sqf"];
spotter addAction ["Spawn target at 700-1250m", "spawn_large.sqf"];
spotter addAction ["Spawn target at 1500-1700m", "spawn_xl.sqf"];

fixObstacles = compile preprocessFileLineNumbers "fixObstacles.sqf";
reportDamage = compile preprocessFileLineNumbers "reportDamage.sqf";
