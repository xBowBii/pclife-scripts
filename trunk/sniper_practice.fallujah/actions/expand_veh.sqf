_blank = spotter addAction [" ", ""];
while {_blank >= 0} do
{
  spotter removeAction _blank;
  _blank = _blank - 1;
};

spotter addAction ["Spawn Light Armored vehicle penetration test", "spawn_lightarmor.sqf"];
spotter addAction ["Spawn BRDM for penetration test", "spawn_brdm.sqf"];
spotter addAction ["Spawn convoy on the north, 400+ meters", "spawn_convoy.sqf",400];
spotter addAction ["Spawn on the south, 300 meters", "spawn_convoy.sqf",200];

spotter addAction ["Back to previous menu", "actions\action_back.sqf"];