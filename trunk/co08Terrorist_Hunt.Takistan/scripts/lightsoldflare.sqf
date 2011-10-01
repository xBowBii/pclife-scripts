/*
	AIsoldierFlare v1.3
	By Demonized
	
add this line in either init.sqf file or in a trigger at mission start:   AIsoldierFlare_units = [];
Units will get weapons based on faction.
Execute with:	wep = [unitName] execVM "scripts\lightsoldflare.sqf";
        		wep = [this,"ambush","red","sunElev"] execVM "scripts\lightsoldflare.sqf";
        		wep = [this,"random_color","refill",10] execVM "scripts\lightsoldflare.sqf";


unit name must be first argument and these options can be used anywhere in line.
if using: wep = [this] execVM "scripts\lightsoldflare.sqf";	- then all will be randomised, and weapons will be based on faction, US get US weapons etc... west units gets green flares, east red, resistance yellow, civ white.
"debug"		- show helpful hints about the scripts beheaviour, this is the same as setting _debugMode to true below, but now it will be a specific debug for only this script, not all.

"red"   			- color of flares used.
"green"			- color of flares used.
"yellow"			- color of flares used.
"white"			- color of flares used.
"random_color"   		- random color of flares used - note color will be same on all flares added to inventory of unit.
"refill",x,y		- will refill flares when empty after x amount of time y amount of times.

"sunElev"			- same as _sunElev = true; - use a old sun elevation function to determine when to fire flares (night or day check), note: results may vary +/- ca 1 hour, not recomended.
"ambush"			- wait until enemy detected is close then fire flares.
"random_mode"		- randomly decide if ambush is used for using flares.
"beheaviour"		- decide ambush mode based on group beheaviour, fex: if group is in stealth mode, use "ambush" from above option else normal.
"nvg"				- unit will keep night vision goggles if it had them when script started.
"no_launcher"		- this will remove any launchers equipped and add extra rifle magazines instead,

This is only for A2,OA,BAF,PMC vanilla weapons, may work on others but no guarantee, use debug, and run script on player to find out.
"custom","weapon_classname"

This should be used for any weapon that do not work 100% with script, fex ACE weapons, this has no limits, any addons can be used.
"full_custom","weapon_class_name","weapon_bullets_used","custom_flare_classname","weapon_GL_muzzlename"

Examples custom:
wep = [this,"red","ambush","custom","M4A1_HWS_GL"] execVM "scripts\lightsoldflare.sqf";
wep = [this,"full_custom","ACE_AK103_GL","ACE_30Rnd_762x39_S_AK47","ACE_SSRed_GP25","ACE_GP25Muzzle_AI"] execVM "scripts\lightsoldflare.sqf";

*/
if (isServer) then {
	_unit = _this select 0;
	
	//-------------------- CAN BE MODIFIED -----------------------------//
	// note: true = ON  -  false = OFF
	
	_debugMode = false; 	// default false, show hints when running script. - same effect as using "debug" in initline.
	_sunElev = false;		// default false, use sun elevation to determine night or day eg, use flares or not. - same effect if using "sunElev" in initline.
	_dist = 300;		// default 300, this is range in meters to known enemy before shooting flares if not detected and "ambush" is not used.
	_ambDist = 30;		// default 30, this is the minimum range to fire flares if undetected and in ambush mode.
	_nearby = 200;		// default 200, if anyone using this script is within 200 and is shooting flares, unit will wait until its needed.
	_refill = false;		// default false, refill flares when empty after _refTime below in seconds. - same effect if using "refill",x_seconds in initline.
	_refTime = 60;		// default is 60, time until refill after empty.
	_refMany = 3;		// default is 3, amount of times flares will be refilled, set to -1 for infinite.
	_beheaviour = false;	// default is false, use beheaviour to determine ambush or not dynamically, if stealth mode, the ambush activated. - same effect if using "beheaviour" in initline.
	
	//-------------------- DO NOT MODIFY BELOW ME ----------------------//
	_launcherEquipped = false;
	_shootflares = false;
	_noMedic = true;
	_flare_muzzle = "";
	_flareType = "";
	_typeColor = "";
	_heType = "";
	_weaponUsed = "";
	_weaponAmmo = "";
	_launcher = "";
	_sel = 0;
	_weapon = 0;
	_pNrMag = 0;
	_add_he = 0;
	_wpArr = [];
	_magazinearray = [];
	_muzzles = [];
	_GL_magazine_array = [];
	_launcherMagArr = [];
	_launcherMag = [];
	
	// this below is sun elevation calculations but it gives different values on different times of the year so it will not be 100% accurate
	// and was never meant to be, results will vary, hour, weather, island etc effects in, but it gives an estimate.
	// great for those missions spanning over day and night and possibly longer, where you dont know if its light(day) or dark(night).
	_X_fnc_SunElev = {
		/*
		Author: CarlGustaffa
		
		Description:
		Returns the suns altitude for current day and hour of the year on any island (whos latitude may differ).
		
		Parameters:
		None needed.
		
		Returns:
		Suns altitude in degrees, positive values after sunrise, negative values before sunrise.
		*/
		
		private ["_lat", "_day", "_hour", "_angle"];
		_lat = -1 * getNumber(configFile >> "CfgWorlds" >> worldName >> "latitude");
		_day = 360 * (dateToNumber date);
		_hour = (daytime / 24) * 360;
		_angle = ((12 * cos(_day) - 78) * cos(_lat) * cos(_hour)) - (24 * sin(_lat) * cos(_day));
		_angle
	};
	
	// get magazines function.
	_getMagazineTypes = {
		if (isServer) then {
			_wep = _this select 0;
			_mag = [];
			_mzl = getArray(configFile >> "CfgWeapons" >> _wep >> "muzzles");
			if ("this" in _mzl) then {
				_mag = getArray(configFile >> "CfgWeapons" >> _wep >> "magazines");
			} else {
				_mag = getArray(configFile >> "CfgWeapons" >> _wep >> (_mzl select 0) >> "magazines");
			};
			_return = [_mag,_mzl];
			
			if (count _this != 1) then {
				_magazinearray = _return select 0;
				_muzzles = _return select 1;
				
				_weaponAmmo = _magazinearray select 0;
				_flare_muzzle = _muzzles select 1;
				_GL_magazine_array = getArray (configFile >> "CfgWeapons" >> _weaponUsed >> _flare_muzzle >> "magazines");
			};
			
			_return
		};
	};
	
	// debug mode.
	if ("debug" in _this) then {_debugMode = true};
	
	// get weapons.
	if ("full_custom" in _this) then {
		if (_debugMode) then {player sidechat "full custom weapons used"; sleep 0.5};
		_sel = _this find "full_custom";
		_weaponUsed = _this select (_sel + 1);
		_weaponAmmo = _this select (_sel + 2);
		_flareType = _this select (_sel + 3);
		_flare_muzzle = _this select (_sel + 4);
		if (_debugMode) then {player sidechat format ["weapon %1 ammo %2 flare %3 muzzle %4",_weaponUsed,_weaponAmmo,_flareType,_flare_muzzle]; sleep 0.5};
	} else {
		if ("custom" in _this) then {
			if (_debugMode) then {player sidechat "custom weapons used"; sleep 0.5};
			_sel = _this find "custom";
			_weaponUsed = _this select (_sel + 1);
		} else {
			// get faction and assign weapon accordingly.
			_faction = faction _unit;
			if (_faction in ["CDF","GUE","INS","BIS_TK_INS","CIV","CIV_RU","BIS_CIV_special","BIS_TK_CIV"]) then {_weapon = 0};
			if (_faction in ["RU","BIS_UN"]) then {_weapon = 1};
			if (_faction in ["USMC"]) then {_weapon = 2};
			if (_faction in ["BIS_BAF"]) then {_weapon = 3};
			if (_faction in ["BIS_CZ"]) then {_weapon = 4};
			if (_faction in ["BIS_GER","BIS_TK","BIS_TK_GUE"]) then {_weapon = 5};
			if (_faction in ["PMC_BAF"]) then {_weapon = 6};
			if (_faction in ["BIS_US"]) then {_weapon = 7};
			
			switch (_weapon) do {
				case 0: {_wpArr = ["AK_74_GL"]};
				case 1: {_wpArr = ["AK_107_GL_kobra","AK_107_GL_PSO","AK_74_GL_kobra"]};
				case 2: {_wpArr = ["M4A1_RCO_GL","M16A4_ACG_GL","M16A2GL","M16A4_GL","M4A1_HWS_GL","M4A1_HWS_GL_camo"]};
				case 3: {_wpArr = ["BAF_L85A2_UGL_ACOG","BAF_L85A2_UGL_SUSAT","BAF_L85A2_UGL_Holo"]};
				case 4: {_wpArr = ["M4A3_RCO_GL_EP1","M16A2GL"]};
				case 5: {_wpArr = ["M16A2GL","AK_74_GL"]};
				case 6: {_wpArr = ["m8_CarbineGL"]};
				case 7: {_wpArr = ["SCAR_H_STD_EGLM_Spect","SCAR_L_CQC_EGLM_Holo","SCAR_L_STD_EGLM_TWS","SCAR_L_STD_EGLM_RCO","M16A2GL","M4A3_RCO_GL_EP1"]};
			};
			_weaponUsed = _wpArr select (floor(random(count _wpArr)));
		};
		if (_debugMode) then {player sidechat format["rifle selected is %1",_weaponUsed]; sleep 0.5};
		
		// find magazines and muzzle in cfg files for new weapon.
		_return = [_weaponUsed] call _getMagazineTypes;
		_magazinearray = _return select 0;
		_muzzles = _return select 1;
		
		_weaponAmmo = _magazinearray select 0;
		_flare_muzzle = _muzzles select 1;
		_GL_magazine_array = getArray (configFile >> "CfgWeapons" >> _weaponUsed >> _flare_muzzle >> "magazines");
		
		//select flarecolor.
		_orgArr = _this;
		if ({_x in _this} count ["red","green","yellow","white","random_color"] == 0) then {
			_side = side _unit;
			if (_side == west) then {_orgArr = ["green"]};
			if (_side == east) then {_orgArr = ["red"]};
			if (_side == resistance) then {_orgArr = ["yellow"]};
			if (_side == civilian) then {_orgArr = ["white"]};
		};
		if ("random_color" in _orgArr) then {
			_orgArr = ["red","green","yellow","white"];
			_typeColor = _orgArr select (floor(random(count _orgArr)));
			_orgArr = [_typeColor];
		};
		if ("white" in _orgArr) then {_sel = 1; _typeColor = "white"};
		if ("green" in _orgArr) then {_sel = 2; _typeColor = "green"};
		if ("red" in _orgArr) then {_sel = 3; _typeColor = "red"};
		if ("yellow" in _orgArr) then {_sel = 4; _typeColor = "yellow"};
		_flareType = _GL_magazine_array select _sel;
		_heType = _GL_magazine_array select 0;
		if (_debugMode) then {player sidechat format["flare color selected is %1",_typeColor]; sleep 0.5};
		if (_debugMode) then {player sidechat format["he grenade selected is %1",_heType]; sleep 0.5};
	};
	
	// AT or AA weapons equipped will be present in loadout with same amount of missiles.
	_crrWeps = weapons _unit;
	_crrMag = magazines _unit;
	
	// find any launchers and amount of ammo.
	{
		if (getText(configFile >> "CfgWeapons" >> _x >> "reloadaction") == "ManActReloadAT") then {
			_launcher = _x;
			_launcherMagArr = getArray (configFile >> "CfgWeapons" >> _launcher >> "magazines");
			{
				if (_x in _launcherMagArr) then {
					_launcherMag = _launcherMag + [_x];
				};
			} foreach _crrMag;
			if (!("no_launcher" in _this)) then {
				_launcherEquipped = true;
			};
		};
	} foreach _crrWeps;
	
	// find current equipped rifle and get amoun of magazine to replace.
	_pWep = primaryWeapon _unit;
	_return = [_pWep] call _getMagazineTypes;
	_pMag = _return select 0;
	{
		if (_x in _pMag) then {
			_pNrMag = {_x in _pMag} count _crrMag;
		};
	} foreach _crrMag;
	
	// determine if medic class then leave out extra flares or he grenades.
	if (getNumber(configFile >> "CfgVehicles" >> (typeOf _unit) >> "attendant") != 1) then {
		_noMedic = false;
		_add_he = 4;
		if (_debugMode) then {player sidechat "not a medic adding he grenades as well"; sleep 0.5};
	};
	
	// equip unit.
	removeAllWeapons _unit;
	_addEquipment = true;
	_add_mag = _pNrMag;
	_add_fl = 4;
	if (!_launcherEquipped) then {_add_mag =  12};
	if (_noMedic) then {_add_mag =  8};
	while {_addEquipment} do {
		if (_add_mag != 0) then {_unit addMagazine _weaponAmmo; _add_mag = _add_mag - 1};
		if (_add_mag == 0 AND _add_fl != 0) then {_unit addMagazine _flareType; _add_fl = _add_fl - 1};
		if (_add_mag == 0 AND _add_fl == 0 AND _add_he != 0) then {_unit addMagazine _heType; _add_he = _add_he - 1};
		if ({_x == 0} count [_add_mag,_add_fl,_add_he] == 3) then {_addEquipment = false};
	};
	_unit addWeapon _weaponUsed;
	if ("this" in _muzzles) then {_unit selectWeapon _weaponUsed} else {_unit selectWeapon (_muzzles select 0)};
	if (_launcherEquipped) then {
		{_unit addMagazine _x} foreach _launcherMag;
		_unit addWeapon _launcher;
	};
	if ("nvg" in _this AND "NVGoggles" in _crrWeps) then {_unit addWeapon "NVGoggles"};
	
	if (_debugMode) then {player sidechat "guns equipped"; sleep 0.5};
	if (_unit == player) exitWith {player sidechat "PLAYER DETECTED SCRIPT EXITING FOR PLAYER UNIT"};
	AIsoldierFlare_units = AIsoldierFlare_units + [_unit];
	
	// check sun elevation once every minute.
	if ("sunElev" in _this OR _sunElev) then {
		_sunangle = 1;
		while {_sunangle > 0} do {
			_sunangle = [] call _X_fnc_SunElev;
			if (_debugMode) then {player sidechat format ["Angle of the sun is %1",_sunangle]; sleep 0.5};
			if (_sunangle > 0) then {
				if (_debugMode) then {player sidechat "it is day checking again in 1 minutes"; sleep 0.5};
				sleep 60;
			};
		};
		if (_debugMode) then {player sidechat "it is now dark and flares will be used"; sleep 0.5};
	};
	
	// add EH so flare also gives actual light to AI.
	_unit addEventHandler ["fired", {_this execVM "scripts\EH_lightflare.sqf"}];
	
	if ("random_mode" in _this) then {_dist = [_ambDist,_dist] select (floor(random 2))};
	if ("ambush" in _this) then {_dist = _ambDist};
	if ("refill" in _this) then {
		_sel = _this find "refill";
		_refTime = _this select (_sel + 1);
		_refMany = _this select (_sel + 2);
		_refill = true;
		_unit setVariable ["refill", true];
	};
	_ammocount = 4;
	_unit setVariable ["shot", false];
	_unit setVariable ["flares", false];
	
	// this is the detect and shooting part.
	while {alive _unit AND _ammocount != 0} do {
		if ("beheaviour" in _this) then {
			_beheaviour = true;
			while {_beheaviour} do {
				if (behaviour _unit == "STEALTH") then {
					if ((_unit findNearestEnemy position _unit) distance _unit < _ambDist OR !alive _unit) then {
						_beheaviour = false;
						if (_debugMode) then {player sidechat "beheaviour is activated im sneaking"; sleep 0.5};
					};
				} else {
					if ((_unit findNearestEnemy position _unit) distance _unit < _dist OR !alive _unit) then {
						_beheaviour = false;
						if (_debugMode) then {player sidechat "beheaviour is activated im not sneaking"; sleep 0.5};
					};
				};
				sleep 1;
			};
		} else {
			waitUntil {behaviour _unit == "COMBAT" OR (_unit findNearestEnemy position _unit) distance _unit < _dist OR !alive _unit};
		};
	
		if (vehicle _unit != _unit) then {
			waitUntil {vehicle _unit == _unit OR !alive _unit};
		};
		
		waitUntil {(_unit findNearestEnemy position _unit) distance _unit < 300 OR !alive _unit};
		while {(_unit findNearestEnemy position _unit) distance _unit < 300 AND alive _unit AND !_shootflares} do {
			if ({_unit != _x AND _unit distance _x < _nearby AND _x getVariable "flares"} count AIsoldierFlare_units == 0) then {
				if (_debugMode) then {player sidechat "no one else around using flares im shooting"; sleep 0.5};
				_shootflares = true;
			} else {
				if (_debugMode) then {player sidechat "someone else is shooting flares nearby"; sleep 0.5};
				sleep 1 + (random 5);
			};
		};
		
		while {_shootflares AND alive _unit} do {
			if ((_unit findNearestEnemy position _unit) distance _unit < 300) then {
				_unit setVariable ["flares", true];
				_flaretarget = _unit findNearestEnemy getPos _unit;
				_pos = getPos _flaretarget;
				_invT = "HeliHEmpty" createVehicle _pos;
				_invT setPos [(_pos select 0)+20,(_pos select 1)+20,20];
				sleep 0.5;
				_unit doTarget _invT;
				sleep 0.5;
				_unit selectWeapon _flare_muzzle;
				_unit fire [_flare_muzzle, _flare_muzzle, _flareType];
				_ammocount = _ammocount -1;
				//sleep 25 + (random 20);
				waitUntil {_unit getVariable "shot"};
				_unit setVariable ["shot", false];
				
				if (_ammocount > 0) then {
					if (_debugMode) then {player sidechat "still have ammo left"; sleep 0.5};
				} else {
					if (_debugMode) then {player sidechat "out of ammo"; sleep 0.5};
					_shootflares = false;
					_unit setVariable ["flares", false];
				};
				
				if (!alive _unit) then {
					if (_debugMode) then {player sidechat "unit is dead"; sleep 0.5};
					_shootflares = false;
					_unit setVariable ["flares", false];
				};
			} else {
				_unit setVariable ["flares", false];
				_shootflares = false;
			};
			if (alive _unit AND _ammocount == 0 AND _refMany != 0 AND _refill) then {
				if (_debugMode) then {player sidechat "refilling"; sleep 0.5};
				_refMany = _refMany - 1;
				sleep _refTime;
				if (alive _unit) then {{_unit addMagazine _x} foreach [_flareType,_flareType,_flareType,_flareType]};
				_ammocount = 4;
				_shootflares = true;
				if (_debugMode) then {player sidechat "refilling done"; sleep 0.5};
			};
		};
		deleteVehicle _invT;
	};
	AIsoldierFlare_units = AIsoldierFlare_units - [_unit];
	if (_debugMode) then {player sidechat "exiting script"};
};
// END.