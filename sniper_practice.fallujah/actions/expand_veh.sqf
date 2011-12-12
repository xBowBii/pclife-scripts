spotter removeAction INF_ACTION;
spotter removeAction VEH_ACTION;

/*
TEST_ACTION1 = spotter addAction ["Spawn Light Armored vehicle penetration test", "spawn_lightarmor.sqf"];
TEST_ACTION2 = spotter addAction ["Spawn BRDM for penetration test", "spawn_brdm.sqf"];
TEST_ACTION3 = spotter addAction ["Spawn convoy on the north, 400+ meters", "spawn_convoy.sqf",400];
TEST_ACTION4 = spotter addAction ["Spawn convoy on the south, 300 meters", "spawn_convoy.sqf",200];
*/

TEST_ACTION1 = spotter addAction ["Spawn light armored vehicle penetration test", "wrappers\lightarmor.sqf"];
TEST_ACTION2 = spotter addAction ["Spawn BRDM for penetration test", "wrappers\brdm.sqf"];
TEST_ACTION3 = spotter addAction ["Spawn convoy on the south, 300 meters", "wrappers\convoy200.sqf"];
TEST_ACTION4 = spotter addAction ["Spawn convoy on the north, 400+ meters", "wrappers\convoy400.sqf"];

TEST_ACTION5 = spotter addAction ["Back to previous menu", "actions\action_back.sqf"];