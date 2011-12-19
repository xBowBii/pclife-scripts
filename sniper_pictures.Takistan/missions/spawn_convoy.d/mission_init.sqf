_cities = [];
switch (RANDOM_VALUE) do {
  case 0: {_cities = ["Garmsar", "Bastam"]};
};

//marker name pattern: convoy_%RND_teleport; convoy_%RND_spawn; convoy_%RND_wp[1-5]

[format ["convoy_%1_teleport", RANDOM_VALUE]] call fnc_global_teleport;

_convoy_start = createMarker["convoy_start",getMarkerPos format ["convoy_%1_spawn", RANDOM_VALUE]];
_convoy_start setMarkerShape "ICON";
"convoy_start" setMarkerType "Start";
"convoy_start" setMarkerText "Convoy start.";

_convoy_end = createMarker["convoy_end",getMarkerPos format ["convoy_%1_wp5", RANDOM_VALUE]];
_convoy_end setMarkerShape "ICON";
"convoy_end" setMarkerType "End";
"convoy_end" setMarkerText "Convoy start.";

//put mission info on screen
player globalchat format ["Briefing: convoy of 2 light armed with MG jeeps and one truck will leave %1 heading %2. It will stay on the main road. Your task is to engage and eliminate all crew in this convoy.", _cities select 0, _cities select 1];

player globalchat "init complete!";