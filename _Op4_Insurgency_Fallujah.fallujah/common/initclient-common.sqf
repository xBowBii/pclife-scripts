// \initclient-common.sqf

#include "defines.sqf"
#include "functions.sqf"
#include "client\defines.sqf"
#include "client\variables.sqf"
#include "client\briefing.sqf"
#include "client\AI\functions.sqf"
#include "client\actions\functions.sqf"
#include "client\gear\functions.sqf"
//#include "client\injured\functions.sqf"
#include "client\markers\functions.sqf"
#include "client\markers\createMarkers.sqf"
#include "client\misc\functions.sqf"
#include "client\misc\triggers.sqf"
#include "client\respawn\functions.sqf"
#include "client\support\functions.sqf"
#include "client\UI\functions.sqf"
#include "client\UI\onKeyPress.sqf"
#include "client\UI\onMouseMove.sqf"
player enableIRLasers true; 
player enableGunLights true; 
player setVariable ["BIS_noCoreConversations", true];

// Grass
grasslayer = 1;
setTerrainGrid 50;

// FSM for service point (vehicle repairs etc.)
execFSM "common\fsm\ServicePoint.fsm";
execVM "op4\jip.sqf";
execVM "op4\hmvreskin.sqf";
execVM "op4\ratingcheck.sqf";

_medics = ["ACE_USMC_Soldier_Medic_D"];
_class = typeOf player;

//isDesertLAV = isClass(configFile >> "CfgPatches" >> "LAV_25_OIF");
//if isDesertLAV then { 
//execVM "op4\lavreskin.sqf";
//};

if isWest then { 
//	player addRating 1000000;
	player addEventHandler ["handleDamage", { _this call handleDamage; }]; 
	player addEventHandler ["killed",{ _this call onPlayerKilled; }]; 
	player addEventHandler ["respawn",{ titleCut ["", "BLACK IN", 10]; }]; 
	
	if !(_class in _medics) then {	
	{player addmagazine "ACE_Morphine"} foreach [1,2];
	{player addmagazine "ACE_Epinephrine"} foreach [1,2];
	} else {	
	player addEventHandler ["respawn",{ player setVariable ["ace_w_heal", true]; }]; 
	player setVariable ["ace_w_heal", true];
	};
	
	player addEventHandler ["fired",{ call firedEH; }]; 
	call addActions;
	HQ addaction ["Return to FOB", "op4\rtb.sqf",[],1,false,true,"","true"];
	flag1 addaction ["Move to MHQ", "op4\mhq.sqf",[],1,false,true,"","true"];
}; 
if isEast then {
	player setVariable ["INS_playerString",str player, true];
	player addEventHandler ["respawn",{ removeAllWeapons player; player addweapon "ACE_GlassesBalaklava"; }]; 
	["ace_sys_wounds_rev", {if (side player == east) then {(_this select 0) setdamage 1};}] call CBA_fnc_addEventhandler;
};
if (isServer) then { [] spawn { call compile preprocessFileLineNumbers "initserver.sqf"; }; }; 
endLoadingScreen;

waitUntil { !(isNull (findDisplay 46)) }; 
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call onKeyPress"];
(findDisplay 46) displayAddEventHandler ["MouseMoving", "_this call onMouseMove"]; 
waitUntil { !isDead(HQ) || time > 30 };

#include "client\mainLoop.sqf"