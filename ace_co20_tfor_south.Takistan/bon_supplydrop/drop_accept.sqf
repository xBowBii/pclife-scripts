// by Bon_Inf*

#include "dialog\definitions.sqf";

disableSerialization;

_display = findDisplay BON_SUPPLY_DIALOG;


_comboBox = _display displayCtrl BON_SUPPLY_REQUESTORS;
_cursel_req = lbCurSel _comboBox;
if(_cursel_req < 0) exitWith{};
_requestors = Server getVariable "bon_supply_requestors";

_requestor = (_requestors select _cursel_req) select 0;
_supplytype = (_requestors select _cursel_req) select 1;
_droppos = (_requestors select _cursel_req) select 2;


_supplies = Server getVariable "bon_supply_supplements";
_ok = true; _new_supplies = [];
{
	if((_x select 0) == _supplytype) then {
		if((_x select 1) < 1) then{_ok = false}	else {_new_supplies = _new_supplies + [[_x select 0, (_x select 1) - 1]]};
	} else {_new_supplies = _new_supplies + [_x]};
} foreach _supplies;
if(not _ok) exitWith{hint "You've already reached the limit for this supplement."};



bon_supply_dosupplydrop = [_droppos,_supplytype,bon_supply_side];
if(isServer) then {
	bon_supply_dosupplydrop execVM (BON_SUPPLY_PATH+"createplane.sqf");
} else {
	publicVariable "bon_supply_dosupplydrop";
};

_new_requestors = [];
{
	if((_x select 0) != _requestor) then{_new_requestors = _new_requestors + [_x]};
} foreach _requestors;
Server setVariable ["bon_supply_requestors",_new_requestors,true];
Server setVariable ["bon_supply_supplements",_new_supplies,true];

sleep 0.123;

hint format["Moving %1 to drop %2 at grid %3.",getText (configFile >> "CfgVehicles" >> bon_supply_plane >> "displayname"),getText (configFile >> "cfgVehicles" >> _supplytype >> "displayname"),mapGridPosition _droppos];
bon_supply_accepted = [_requestor,_supplytype,_droppos];
publicVariable "bon_supply_accepted";


[] call bon_supply_fnc_dlgUpdate;