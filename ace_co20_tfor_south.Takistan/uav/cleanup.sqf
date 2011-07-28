_success = false;

_logic = _this select 0;
_uav = _this select 1;
_crew = _this select 2;

_grp = group leader (_crew select 0);


{
	deleteVehicle vehicle _x;
	deleteVehicle _x;
} foreach _crew;
deleteGroup _grp;

{deleteVehicle _x} foreach [_logic,_uav];



if(isNull _logic && isNull _pilot && isNull _gunner && isNull _uav) then {_success = true};

_success