private ["_target", "_grp", "_driver", "_gunner"];

_tDir = 0;
_brdmType = "";

_place = round random 1;

switch (_place) do 
{
  case 0:
    {_brdmType = "BRDM2_TK_GUE_EP1"};  
  case 1:
    {_brdmType = "BTR40_MG_TK_GUE_EP1"};
};

//cleaning stuff
_toDelete = nearestObjects [getMarkerPos "brdm_spawn_2", ["BRDM2_TK_GUE_EP1","BTR40_MG_TK_GUE_EP1"], 350];
{
  _crew = crew _x;
  {deleteVehicle _x} foreach _crew;
  deleteVehicle _x;
} forEach _toDelete;

_target = createVehicle [_brdmType, getMarkerPos format["brdm_spawn_%1", round random 2], [], 0, "NONE"];
sleep 0.2;
_target setDir (round random 180) + 90;
_target setFuel 0;

_magazines = _target magazinesTurret [0];
{_target removeMagazinesTurret [_x,[0]];} foreach _magazines;

_grp = createGroup resistance;
_driver = _grp createUnit ["GUE_Soldier_Crew", getMarkerPos "btr_spawn", [], 0, "FORM"];
TEH_DRIVER = _driver;
_driver addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "head_hit")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleHead};_this select 2}];
_driver addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "body")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleBody};_this select 2}];
_driver addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "hands")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleHands};_this select 2}];
_driver addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "legs")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleLegs};_this select 2}];
_driver moveInDriver _target;

_gunner = _grp createUnit ["GUE_Soldier_Crew", getMarkerPos "btr_spawn", [], 0, "FORM"];
TEH_GUNNER = _gunner;
_gunner addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "head_hit")) then {[TEH_GUNNER, _this select 1, _this select 2, _this select 3] call handleHead};_this select 2}];
_gunner addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "body")) then {[TEH_GUNNER, _this select 1, _this select 2, _this select 3] call handleBody};_this select 2}];
_gunner addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "hands")) then {[TEH_GUNNER, _this select 1, _this select 2, _this select 3] call handleHands};_this select 2}];
_gunner addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "legs")) then {[TEH_GUNNER, _this select 1, _this select 2, _this select 3] call handleLegs};_this select 2}];
_gunner moveInGunner _target;

_tDir = ((((getPos _target select 0) - (getPos spotter select 0)) atan2 ((getPos _target select 1) - (getPos spotter select 1))) + 360) % 360;

[-2, {player globalchat _this}, format ["New target: armor, %1, at direction %2, close.",_brdmType,_tDir]] call CBA_fnc_globalExecute;

_grp spawn {
	_units = units _this;
	_hidetime = 20;

	While{({alive _x} count _units) > 0} do{sleep 15};

	sleep _hidetime;
	{
		hidebody _x;
		sleep 3;
		deleteVehicle _x;
	} foreach _units;

	sleep 10;
	deleteGroup _this;
};