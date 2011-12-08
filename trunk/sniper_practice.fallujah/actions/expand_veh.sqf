/*
_blank = spotter addAction [" ", ""];
_pool = _blank-2;
while {_blank >= _pool} do {
  _blank = _blank - 1;
};
*/
spotter removeAction INF_ACTION;
spotter removeAction VEH_ACTION;

TEST_ACTION1 = spotter addAction ["Spawn Light Armored vehicle penetration test", "spawn_lightarmor.sqf"];
TEST_ACTION2 = spotter addAction ["Spawn BRDM for penetration test", "spawn_brdm.sqf"];
TEST_ACTION3 = spotter addAction ["Spawn convoy on the north, 400+ meters", "spawn_convoy.sqf",400];
TEST_ACTION4 = spotter addAction ["Spawn convoy on the south, 300 meters", "spawn_convoy.sqf",200];

TEST_ACTION5 = spotter addAction ["Back to previous menu", "actions\action_back.sqf"];