ace_wounds_prevtime = 300;
score = 0;
"score" addPublicVariableEventHandler {[_this select 1] spawn spawnScript;};
publicVariable "score";
sleep 3;
["markr",["top","bottom","left","right"],"Land_arrows_desk_L",2] execVM "curtain.sqf";
_gate01 = createVehicle ["Land_Wall_Gate_Ind2Rail_R", getMarkerPos "gate_r", [], 0, "CAN_COLLIDE"];
_gate01 addEventHandler ["killed","[_this select 0, 5] spawn respawnObjects;"];
_gate02 = createVehicle ["Land_Wall_Gate_Ind2Rail_L", getMarkerPos "gate_l", [], 0, "CAN_COLLIDE"];
_gate02 addEventHandler ["killed","[_this select 0, 5] spawn respawnObjects;"];
[mgBox] execVM "mg_filler.sqf";
[launcherBox] execVM "launcher_filler.sqf";
[rifleBox] execVM "rifle_filler.sqf";
[miscBox] execVM "misc_filler.sqf";
[sniperBox] execVM "sniper_filler.sqf";

checkScore = compile loadFile "checkScore.sqf";
checkScore = compile preprocessFile "checkScore.sqf";

spawnScript = compile loadFile "spawnScript.sqf";
spawnScript = compile preprocessFile "spawnScript.sqf";

respawnObjects = compile loadFile "respawnObjects.sqf";
respawnObjects = compile preprocessFile "respawnObjects.sqf";