_blank = spotter addAction [" ", ""];
while {_blank >= 0} do
{
  spotter removeAction _blank;
  _blank = _blank - 1;
};

spotter addAction ["Spawn target at 300-700m", "spawn_normal.sqf"];
spotter addAction ["Spawn target at 700-1250m", "spawn_large.sqf"];
spotter addAction ["Spawn target at 1500-1700m", "spawn_xl.sqf"];
spotter addAction ["Spawn patrol for syncro-kill", "spawn_patrol.sqf"];

spotter addAction ["Back to previous menu", "actions\action_back.sqf"];