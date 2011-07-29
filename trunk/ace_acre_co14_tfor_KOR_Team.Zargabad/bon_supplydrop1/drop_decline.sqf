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


_new_requestors = [];
{
	if((_x select 0) != _requestor) then{_new_requestors = _new_requestors + [_x]};
} foreach _requestors;
Server setVariable ["bon_supply_requestors",_new_requestors,true];


bon_supply_declined = [_requestor,_supplytype];
publicVariable "bon_supply_declined";

sleep 0.123;

deleteMarker "bon_supply_dropmarker";

[] call bon_supply_fnc_dlgUpdate;