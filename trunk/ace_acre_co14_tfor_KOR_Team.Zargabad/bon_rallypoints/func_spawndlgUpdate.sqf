// by Bon_Inf*

#include "dialog\definitions.sqf";

disableSerialization;
private ["_target","_display","_ctrlmap","_success"];

_success = false;
_target = _this select 0;

_display = findDisplay BON_SPAWN_DIALOG;
_ctrlmap = _display displayCtrl BON_SPAWN_MAP;
ctrlMapAnimClear _ctrlmap;

if(_target == "RALLY") then
{
	spawnpos = [(getPos bon_rallypoint select 0) + 2 - random 4, (getPos bon_rallypoint select 1) + 2 - random 4, 0];
	ctrlSetText [BON_SPAWN_PICTURE, BON_SPAWN_PATH+"dialog\images\Rally.paa"];
};
if(_target == "BASE") then
{
	spawnpos = getMarkerPos format["respawn_%1",tfor_friendly_side];
	ctrlSetText [BON_SPAWN_PICTURE, BON_SPAWN_PATH+"dialog\images\Base.paa"];
};
if(_target == "FOB") then
{
	spawnpos = getMarkerPos "tfor_fop_marker";
	ctrlSetText [BON_SPAWN_PICTURE, BON_SPAWN_PATH+"dialog\images\FOB.paa"];
};
if(_target == "MASH") then
{
	spawnpos = if(isNull tfor_mash) then {position player} else {position tfor_mash};
	ctrlSetText [BON_SPAWN_PICTURE, BON_SPAWN_PATH+"dialog\images\MASH.paa"];
};

ctrlSetText [BON_SPAWN_INFO1, format["Distance to Base: %1m", round (spawnpos distance (getMarkerPos format["respawn_%1",tfor_friendly_side]))]];
ctrlSetText [BON_SPAWN_INFO2, format["Distance to Main Target: %1m", round (spawnpos distance position (tfor_currentmission select 0))]];
ctrlSetText [BON_SPAWN_INFO3, format["Number of friendly units nearby: %1", [tfor_friendly_side,spawnpos,100] call countUnitsAround]];


_ctrlmap ctrlMapAnimAdd [0.0, 0.50, position player];
_ctrlmap ctrlMapAnimAdd [2.0, 1.00, spawnpos];
_ctrlmap ctrlMapAnimAdd [0.5, 0.30, spawnpos];
ctrlMapAnimCommit _ctrlmap;

_success = true;
_success