// by Bon_Inf*

#include "dialog\definitions.sqf";

disableSerialization;

private ["_requestors"];
_requestors = Server getVariable "bon_supply_requestors";
if(isNil "_requestors") then {_requestors = []};
_ok = true;
{
	if(player == (_x select 0)) exitWith{_ok = false};
} foreach _requestors;
if(not _ok) exitWith{hint "Your previous request has not been processed yet."};


_dialog = findDisplay BON_SUPPLY_REQUESTDIALOG;
_comboBox = _dialog displayCtrl BON_SUPPLY_SUPPLEMENTLIST;
_cursel_supply = lbCurSel _comboBox;
if(_cursel_supply < 0) exitWith{};
_supplies = Server getVariable "bon_supply_supplements";
_supplytype = (_supplies select _cursel_supply) select 0;


_requestors = _requestors + [[player,_supplytype,bon_supply_droppos]];
Server setVariable ["bon_supply_requestors",_requestors,true];

bon_supply_request = [player,_supplytype,bon_supply_droppos];
publicVariable "bon_supply_request";
hint "Request transmitted.";



bon_supply_droppos = nil;
closeDialog 0;