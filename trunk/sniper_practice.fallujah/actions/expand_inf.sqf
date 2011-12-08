/*
_blank = spotter addAction [" ", ""];
_pool = _blank-2;
while {_blank >= _pool} do
{
  spotter removeAction _blank;
  _blank = _blank - 1;
};
*/

spotter removeAction INF_ACTION;
spotter removeAction VEH_ACTION;

TEST_ACTION1 = spotter addAction ["Spawn target at 300-700m", "spawn_normal.sqf"];
TEST_ACTION2 = spotter addAction ["Spawn target at 700-1250m", "spawn_large.sqf"];
TEST_ACTION3 = spotter addAction ["Spawn target at 1500-1700m", "spawn_xl.sqf"];
TEST_ACTION4 = spotter addAction ["Spawn patrol for syncro-kill", "spawn_patrol.sqf"];

TEST_ACTION5 = spotter addAction ["Back to previous menu", "actions\action_back.sqf"];