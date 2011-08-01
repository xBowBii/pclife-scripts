#include "dialog\definitions.sqf"

createDialog "bon_Spawndialog";
WaitUntil{dialog};

if(isNull bon_rallypoint) then {ctrlEnable [BON_SPAWN_RALLYBUTTON,false]};
if(count (getMarkerPos "tfor_fop_marker" - [0]) == 0) then {ctrlEnable [BON_SPAWN_FOBBUTTON,false]};
if(isNull tfor_mash) then {ctrlEnable [BON_SPAWN_MASHBUTTON,false]};

["BASE"] call spawnDialogUpdate;