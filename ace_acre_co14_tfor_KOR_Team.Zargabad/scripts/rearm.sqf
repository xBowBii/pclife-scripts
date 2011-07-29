// by Bon_Inf*

_caller = _this select 1;
_unit = vehicle _caller;
_pos = getPos _unit;


// Отмена ремонта если игрок пересел.
BON_REARM_GETCALLERSEAT = nil;
switch _caller do {
	case driver _unit : {BON_REARM_GETCALLERSEAT = {driver _this}};
	case gunner _unit : {BON_REARM_GETCALLERSEAT = {gunner _this}};
	case commander _unit : {BON_REARM_GETCALLERSEAT = {commander _this}};
};
if(isNil "BON_REARM_GETCALLERSEAT") exitWith{hint "Невозможно пополнить запасы техники"};


//Ремонт
[_unit,_pos,_caller] spawn {

	_unit = _this select 0;
	_pos = _this select 1;
	_caller = _this select 2;

	if(not isNil {_unit getVariable "bon_rearm_repairing"}) exitWith{};
	_unit setVariable ["bon_rearm_repairing",true];

	_dmge = getDammage (vehicle _unit);

	_repairtime = (_dmge*60) max 1;
	_repairvalue_per_step = _dmge/_repairtime;

	_unit vehicleChat "Ремонт...";

	while{_unit distance _pos < 2.75 && getPos _unit select 2 < 0.5 && damage _unit > 0 && _caller == _unit call BON_REARM_GETCALLERSEAT} do {
		_unit setDamage ((damage vehicle _unit) - _repairvalue_per_step);
		sleep 1;
	};
	if(damage _unit == 0) then {_unit vehicleChat "Ремонт выполнен!"}
	else{_unit vehicleChat "Ремонт отменен."};
	_unit setVariable ["bon_rearm_repairing",nil];
};

//Перевооружение
[_unit,_pos,_caller] spawn {

	_unit = _this select 0;
	_pos = _this select 1;
	_caller = _this select 2;

	if(not isNil {_unit getVariable "bon_rearm_refueling"}) exitWith{};
	_unit setVariable ["bon_rearm_refueling",true];

	_fuel_to_fill = 1 - (fuel _unit);

	_refueltime = 1 max (_fuel_to_fill*60);
	_refuelvalue_per_step = _fuel_to_fill/_refueltime;

	_unit vehicleChat "Перевооружение...";

	while{_unit distance _pos < 2.75 && getPos _unit select 2 < 0.5 && fuel _unit < 0.99 && _caller == _unit call BON_REARM_GETCALLERSEAT} do {
		_unit setFuel (fuel _unit) + _refuelvalue_per_step;
		sleep 1;
	};
	if(fuel _unit >= 0.99) then {_unit vehicleChat "Перевооружение выполнена!"}
	else{_unit vehicleChat "Перевооружение отменена."};
	_unit setVariable ["bon_rearm_refueling",nil];
};

//Боезапас
[_unit,_pos,_caller] spawn {

	_unit = _this select 0;
	_pos = _this select 1;
	_caller = _this select 2;

	if(not isNil {_unit getVariable "bon_rearm_rearming"}) exitWith{};
	_unit setVariable ["bon_rearm_rearming",true];

	_reload_timefactor = 10; // seconds each mag requires when refilling

	_turretcount = count (configFile >> "CfgVehicles" >> typeof _unit >> "turrets");

	if(_turretcount > 0) then {

		_turret = (configFile >> "CfgVehicles" >> typeof _unit >> "turrets") select 0;

		_total_magazines = getArray (_turret >> "magazines");
		_magazines_left = magazines _unit;
		_magazines_to_fill = [];
		_magazinetypes = [];
		{
			if(not(_x in _magazinetypes)) then{_magazinetypes = _magazinetypes + [_x]};
		} foreach _total_magazines;

		{
			_magtype = _x;
			_diff = ({_x == _magtype} count _total_magazines) - ({_x == _magtype} count _magazines_left) + 1;
			for "_j" from 1 to _diff do {_magazines_to_fill = _magazines_to_fill + [_magtype]};

			// rem magaz cur loaded
			_magazines_left = _magazines_left - [_magtype];
			for "_j" from 1 to (({_x == _magtype} count _total_magazines) - _diff) do{_magazines_left = _magazines_left + [_magtype]};
		} foreach _magazinetypes;

		_unit setvehicleammo 1;
		// refill - remove all mags first for full current mag
		{_unit removeMagazines _x} foreach magazines _unit;
		{_unit addMagazine _x} foreach _magazines_left;

		{
			_displayname = getText (configFile >> "CfgMagazines" >> _x >> "displayname");
			if(_displayname == "") then {_displayname = _x};
			_unit vehicleChat format["Перевооружение %1...",_displayname];

			_time = time;
			while{time - _time < _reload_timefactor && _unit distance _pos < 2.75 && getPos _unit select 2 < 0.5 && _caller == _unit call BON_REARM_GETCALLERSEAT} do{sleep 1};
			if(time - _time < _reload_timefactor) exitWith{};
			_unit addMagazine _x;
		} foreach _magazines_to_fill;
	};

	if(_unit distance _pos < 2.75 && getPos _unit select 2 < 0.5 && _caller == _unit call BON_REARM_GETCALLERSEAT) then {
		_unit vehicleChat "Перевооружение выполнено!"
	}
	else {_unit vehicleChat "Перевооружение отменено."};
	_unit setVariable ["bon_rearm_rearming",nil];
};