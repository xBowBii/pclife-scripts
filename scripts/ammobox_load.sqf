//by Bon_Inf*

if(not local player) exitWith{};

_vec = _this select 0;
_id = _this select 2;

hintSilent "Погрузка амуниции ...";
_time = time;
WaitUntil{time>_time+10 ||  (getPos _vec select 2)>2 || isNull driver _vec || speed _vec > 1 || speed _vec < -1};
if(time <= _time+10) exitWith{hintSilent "reload cancelled"};

_vec setVariable ["tfor_ammoloaded",true,true];

_nearestboxes = nearestObjects [position _vec,[tfor_loadable_boxtype],5];
if(count _nearestboxes > 0) then {deleteVehicle (_nearestboxes select 0)};


hintSilent "... Загружено.";