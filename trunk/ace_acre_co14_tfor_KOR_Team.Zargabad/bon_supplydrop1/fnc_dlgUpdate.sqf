// by Bon_Inf*

#include "dialog\definitions.sqf";

disableSerialization;

_dialog = findDisplay BON_SUPPLY_DIALOG;

_requestors = Server getVariable "bon_supply_requestors";
if(not isNil "_requestors") then{
	_comboBox = _dialog displayCtrl BON_SUPPLY_REQUESTORS;
	lbClear _comboBox;

	_new_requestors = []; _ok = true;
	{
		if(not isNull (_x select 0)) then {
			_new_requestors = _new_requestors + [_x];
			_comboBox lbAdd name (_x select 0);
		} else {_ok = false};
	} foreach _requestors;
	if(not _ok) then{Server setVariable ["bon_supply_requestors",_new_requestors,true]};
};

_comboBox lbSetCurSel 0;
if(_comboBox lbText 0 == "") then {

	_supplementdesc = _display displayCtrl BON_SUPPLY_SUPPLEMENTTYPE;
	_supplementdesc ctrlSetText "";

	_supplementicon = _display displayCtrl BON_SUPPLY_SUPPLEMENTICON;
	_supplementicon ctrlSetText "";
};