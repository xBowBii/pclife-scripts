// by Bon_Inf*

#include "dialog\definitions.sqf";

disableSerialization;

_display = findDisplay BON_SUPPLY_REQUESTDIALOG;

_comboBox = _display displayCtrl BON_SUPPLY_SUPPLEMENTLIST;
_cursel = lbCurSel _comboBox;
_supplytype = ((Server getVariable "bon_supply_supplements") select _cursel) select 0;

_supplementicon = _display displayCtrl BON_SUPPLY_REQUESTSUPPLEMENTICON;

_picture = getText (configFile >> "CfgVehicles" >> _supplytype >> "picture");
if(_picture == "pictureStaticObject") then {_picture = getText (configFile >> "CfgVehicles" >> _supplytype >> "icon")};
_supplementicon ctrlSetText _picture;