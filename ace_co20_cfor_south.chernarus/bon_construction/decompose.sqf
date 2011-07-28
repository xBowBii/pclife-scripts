_object = _this select 0;

{
	_x action ["eject",vehicle _x];
} foreach crew _object;


_ok_to_delete = true;


if(typeOf _object == tfor_artitype) then {

	_tfor_cannons_uid = Server getVariable format["tfor_cannons_%1",getPlayerUID player];
	_nr_cannons = 0 max (count _tfor_cannons_uid) - 1;

	//if(_nr_cannons == 0) then{tfor_maxgroupsize = Server getVariable "tfor_maxgroupsize"};
	tfor_artifunds = tfor_artifunds + 1;

	_tfor_cannons_uid = _tfor_cannons_uid - [_object];
	Server setVariable [format["tfor_cannons_%1",getPlayerUID player],_tfor_cannons_uid,true];
};



if({typeOf _object == _x select 0} count tfor_commander_assets > 0) then {

	if(count nearestObjects [position _object,[tfor_mhqtype],50] == 0) then{
		hint format["Negative, you need to have a %1 nearby.",getText (configFile >> "CfgVehicles" >> tfor_mhqtype >> "displayname")];
		_ok_to_delete = false;
	} else {
		_costs = 1;
		{if(typeOf _object == _x select 0) exitWith{_costs = _x select 2}} foreach tfor_commander_assets;
		tfor_current_commander_funds = tfor_current_commander_funds + _costs;
		publicVariable "tfor_current_commander_funds";
	};
};


if(_ok_to_delete) then {
	sleep 1;

	deleteVehicle _object;
	hint format ["%1 decomposed",getText (ConfigFile >> "CfgVehicles" >> typeOf _object >> "displayname")];
};