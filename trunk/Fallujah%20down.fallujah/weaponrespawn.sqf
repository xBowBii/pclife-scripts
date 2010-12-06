_weapons = [];
_magazines = [];

while {true} do {
    waitUntil {!alive player};
    _weapons = weapons player;
    _magazines = magazines player;
    waitUntil {alive player};
    _p = player;
    removeAllWeapons _p;
    {_p addMagazine _x} forEach _magazines;
    {_p addWeapon _x} forEach _weapons;
    _primw = primaryWeapon _p;
    if (_primw != "") then {
        _p selectWeapon _primw;
        _muzzles = getArray(configFile >> "cfgWeapons" >> _primw >> "muzzles");
        _p selectWeapon (_muzzles select 0);
    };
};