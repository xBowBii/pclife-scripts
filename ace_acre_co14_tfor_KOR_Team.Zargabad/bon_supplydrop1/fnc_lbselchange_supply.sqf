// by Bon_Inf*

#include "dialog\definitions.sqf";

disableSerialization;

_display = findDisplay BON_SUPPLY_DIALOG;

_comboBox = _display displayCtrl BON_SUPPLY_REQUESTORS;
_cursel = lbCurSel _comboBox;
if(_cursel < 0) exitWith{};

_ctrlmap = _display displayCtrl BON_SUPPLY_MAP;
ctrlMapAnimClear _ctrlmap;


_requestors = Server getVariable "bon_supply_requestors";
_requestor = (_requestors select _cursel) select 0;

_supplytype = (_requestors select _cursel) select 1;
_limitation = 0;
_supplies = Server getVariable "bon_supply_supplements";
{
	if(_x select 0 == _supplytype) exitWith{_limitation = _x select 1};
} foreach _supplies;
_supplementdesc = _display displayCtrl BON_SUPPLY_SUPPLEMENTTYPE;
_supplementdesc ctrlSetText format["%1 (%2)",getText (configFile >> "CfgVehicles" >> _supplytype >> "displayname"),_limitation];

_supplementicon = _display displayCtrl BON_SUPPLY_SUPPLEMENTICON;
_picture = getText (configFile >> "CfgVehicles" >> _supplytype >> "picture");
if(_picture == "pictureStaticObject") then {_picture = getText (configFile >> "CfgVehicles" >> _supplytype >> "icon")};
_supplementicon ctrlSetText _picture;

_droppos = (_requestors select _cursel) select 2;
deleteMarker "bon_supply_dropmarker";
_bon_supply_marker = createMarkerLocal ["bon_supply_dropmarker",_droppos];
_bon_supply_marker setMarkerTypeLocal "mil_circle";
_bon_supply_marker setMarkerSizeLocal [3,3];


_ctrlmap ctrlMapAnimAdd [0.0, 0.50, position player];
_ctrlmap ctrlMapAnimAdd [2.0, 1.00, _droppos];
_ctrlmap ctrlMapAnimAdd [0.5, 0.30, _droppos];
ctrlMapAnimCommit _ctrlmap;