//Based on script by Carl Gustaffa, with minor changes made by me to suit my lightsoldflare script.
//Fired eventhandler script for lightsoldflare.sqf

if (isServer) then {
	_unit = _this select 0;
	_projectile = _this select 6;
	
	_delay = time + 3;
	waitUntil {count getArray (configFile >> "CfgAmmo" >> typeOf _projectile >> "lightColor") > 1 || time > _delay};
	if (time > _delay) exitWith {};
	sleep 2;
	if (!alive _projectile) exitWith {};
	_color = getArray (configFile >> "CfgAmmo" >> typeOf _projectile >> "lightColor");
	_r = _color select 0;
	_g = _color select 1;
	_b = _color select 2;
	_a = _color select 3;
	_li = "#lightpoint" createVehicleLocal [0,0,0];
	_li setLightBrightness 0.24;
	_li setLightAmbient[_r*0.8, _g*0.8, _b*0.8];
	_li setLightColor[_r, _g, _b];
	_li lightAttachObject [_projectile, [0,0,0]];
	[_projectile] spawn {
		_projectile = _this select 0;
		while {alive _projectile} do {
			_projectile setPosASL [(getPosASL _projectile select 0) + 0.05 * (wind select 0), (getPosASL _projectile select 1) + 0.05 * (wind select 1), (getPosASL _projectile select 2) + 0.2];
			sleep 0.075;
		};
		sleep (random 3);
	};
	waitUntil {!alive _projectile};
	deleteVehicle _li;
	_unit setVariable ["shot", true];
};
//END