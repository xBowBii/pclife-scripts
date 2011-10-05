[] execVM "preload.sqf";
BIS_Effects_Burn=compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";
onPlayerConnected "[_id, _name, _uid] execVM ""playerConnected.sqf""";
CLY_Cutscene = false;
CLY_Cutscene = false;
CLY_Cutscene = false;
CLY_Cutscene = false;
CLY_Cutscene = false;
CLY_Cutscene = false;
CLY_Cutscene = false;
CLY_Cutscene = false;
CLY_Cutscene = false;
CLY_Cutscene = false;
CLY_Cutscene = false;
CLY_Cutscene = false;
CLY_Cutscene = false;
CLY_Cutscene = false;
CLY_Cutscene = false;
CLY_Cutscene = false;
CLY_deadcharacters = [];
//CLY_Cutscene has been defined now.
//{
//_x addAction ["Tow Static Weapon", "attachVehicle.sqf", [], 1, false, true, "", "driver _target == player"];
//} forEach cararray;
//{
//_x addAction ["Tow Vehicle", "attachVehicle2.sqf", [], 1, false, true, "", "driver _target //== player"];
//} forEach cararray;
onKeyPress = compile preprocessFile "onKeyPress.sqf";
waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyDown", "nul = [_this select 0, _this select 1] execVM 'onKeyPress.sqf' "];
