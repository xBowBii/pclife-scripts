spotter removeAction INF_ACTION;
spotter removeAction VEH_ACTION;

TEST_ACTION1 = spotter addAction ["Spawn target at 300-700m", "wrappers\normal.sqf"];
TEST_ACTION2 = spotter addAction ["Spawn target at 700-1250m", "wrappers\large.sqf"];
TEST_ACTION3 = spotter addAction ["Spawn target at 1500-1700m", "wrappers\xl.sqf"];
TEST_ACTION4 = spotter addAction ["Spawn patrol for synchronous kill", "wrappers\patrol.sqf"];

TEST_ACTION5 = spotter addAction ["Back to previous menu", "actions\action_back.sqf"];