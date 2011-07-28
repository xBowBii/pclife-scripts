// by Bon_Inf*


createDialog "bon_supplydialog";
WaitUntil{dialog};


[] call bon_supply_fnc_dlgUpdate;


WaitUntil{not dialog};
deleteMarker "bon_supply_dropmarker";