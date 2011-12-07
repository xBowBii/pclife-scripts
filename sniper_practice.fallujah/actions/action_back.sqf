_blank = spotter addAction [" ", ""];
while {_blank >= 0} do
{
  spotter removeAction _blank;
  _blank = _blank - 1;
};

spotter addAction ["Infantry tests", "actions\expand_inf.sqf"];
spotter addAction ["Vehicle tests", "actions\expand_veh.sqf"];
spotter addAction ["Statistics (future)", ""];