// by Bon_Inf*

#include "dialog\definitions.sqf"
disableSerialization;


createDialog "bon_supplyrequestdialog";
WaitUntil{dialog};


_dialog = findDisplay BON_SUPPLY_REQUESTDIALOG;

_comboBox = _dialog displayCtrl BON_SUPPLY_SUPPLEMENTLIST;
lbClear _comboBox;
_supplies = Server getVariable "bon_supply_supplements";
{_comboBox lbAdd format["%1",getText (configFile >> "cfgVehicles" >> _x select 0 >> "displayname")]} foreach _supplies;
_comboBox lbSetCurSel 0;

bon_supply_droppos = position player;
_uid = if(isMultiplayer) then{getPlayerUID player} else {"0"};
_bon_supply_dropmarker = createMarkerLocal [format["bon_supply_dropmarker_%1",_uid],bon_supply_droppos];
_bon_supply_dropmarker setMarkerTypeLocal "mil_circle";
_bon_supply_dropmarker setMarkerSizeLocal [3,3];
onMapSingleClick format["bon_supply_droppos = _pos; '%1' setMarkerPosLocal _pos; true",_bon_supply_dropmarker];


WaitUntil{not dialog};
deleteMarker _bon_supply_dropmarker;
onMapSingleClick "true";