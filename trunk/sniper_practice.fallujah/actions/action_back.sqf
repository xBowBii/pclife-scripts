/*
_blank = spotter addAction [" ", ""];
_pool = _blank-5;
while {_blank >= _pool} do
{
  spotter removeAction _blank;
  _blank = _blank - 1;
};
*/
spotter removeAction TEST_ACTION1;
spotter removeAction TEST_ACTION2;
spotter removeAction TEST_ACTION3;
spotter removeAction TEST_ACTION4;
spotter removeAction TEST_ACTION5;

INF_ACTION = spotter addAction ["Infantry tests", "actions\expand_inf.sqf"];
VEH_ACTION = spotter addAction ["Vehicle tests", "actions\expand_veh.sqf"];
//spotter addAction ["Statistics (future)", ""];