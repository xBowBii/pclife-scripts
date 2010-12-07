// by Xeno
private ["_p", "_weapons", "_magazines", "_hasruck", "_ruckmags", "_ruckweapons", "_primw", "_muzzles"];
if (!(local player)) exitWith {};

[] spawn {
   _endtime = time + 100;
   waitUntil {!(isNil "ace_sys_ruck_fnc_killedEH") || (time >= _endtime)};
   if (!isNil "ace_sys_ruck_fnc_killedEH") then {
      ace_sys_ruck_fnc_killedEH = {};
   };
};

while {true} do {
	waitUntil {!alive player};
	_p = player;
	_weapons = weapons _p;
	_magazines = magazines _p;
	_hasruck = false;
	_ruckmags = [];
	_ruckweapons = [];
	if (_p call ACE_fnc_HasRuck) then {
		_ruckmags = [_p] call ACE_fnc_RuckMagazinesList;
		_ruckweapons = [_p] call ACE_fnc_RuckWeaponsList;
		_hasruck = true;
	};
	removeAllItems _p;
	removeAllWeapons _p;
	waitUntil {alive player};
	player setVariable ["BIS_noCoreConversations", true];
	_p = player;
	removeAllItems _p;
	removeAllWeapons _p;
	{_p addMagazine _x;} forEach _magazines;
	{_p addWeapon _x;} forEach _weapons;
    _primw = primaryWeapon _p;
    if (_primw != "") then {
        _p selectWeapon _primw;
		//  Fix for weapons with grenade launcher
        _muzzles = getArray(configFile>>"cfgWeapons" >> _primw >> "muzzles");
        _p selectWeapon (_muzzles select 0);
    };
	if (_hasruck) then {
		if (!isNil "_ruckmags") then {
			_null = [_p, _ruckmags] call ACE_fnc_PackMagazine;
		};
		if (!isNil "_ruckweapons") then {
			_null = [_p, _ruckmags] call ACE_fnc_PackWeapon;
		};
	};
};