_man = _this select 0;
_weapon = _this select 1;

if (getPos _man in enemyFob) then {
	deleteVehicle baseTrigger;
//	_tempGroup = createGroup civilian;
//	ins1 joinSilent _tempGroup;
//	_man setCaptive false;
//	_man removeAllEventhandlers "fired";
	{_x setCaptive false; _x removeAllEventhandlers "fired";} foreach units group _man;
	player globalchat "Eventhandler removed!";
	[-2, {_nil = [] call compile preprocessFileLineNumbers _this}, "startChase.sqf"] call CBA_fnc_globalExecute;
//	_nil = [] call compile preprocessFileLineNumbers "startChase.sqf";
//	ins1 joinSilent group _man;
};