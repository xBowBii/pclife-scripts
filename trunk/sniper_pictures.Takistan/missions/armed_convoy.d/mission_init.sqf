//marker name pattern: arm_convoy_%RND_teleport; arm_convoy_%RND_spawn; arm_convoy_%RND_wp[1-5]; arm_convoy_%RND_mine;

[format ["arm_convoy_%1_teleport", RANDOM_VALUE]] call fnc_global_teleport;

_convoy_start = createMarker["convoy_start",getMarkerPos format ["arm_convoy_%1_spawn", RANDOM_VALUE]];
_convoy_start setMarkerShape "ICON";
"convoy_start" setMarkerType "Start";
"convoy_start" setMarkerText "Convoy start.";

_convoy_end = createMarker["convoy_end",getMarkerPos format ["arm_convoy_%1_wp5", RANDOM_VALUE]];
_convoy_end setMarkerShape "ICON";
"convoy_end" setMarkerType "mil_ambush";
"convoy_end" setMarkerText "Convoy start.";

//put mission info on screen
player globalchat format ["Briefing: local partizans preparing ambush on enemy unarmed supply convoy near %2, but according to last minute recon, convoy will be supported by light armoured vehicle. Your main task is to eliminate its crew or destroy the vehicle itself. Mine placed on the road, so first vehicle in column will be destroyed. Convoy starting in %1.", CITIES_ARRAY select 0, CITIES_ARRAY select 1];

player globalchat "init complete!";