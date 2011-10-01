// by Xeno
private ["_p","_pos","_trigger","_s"];
if (!local player) exitWith {};

_p = player;
_pos = position _p;

player_backpack = [];

pbp_id = -1000;

prim_weap_player = primaryWeapon _p;
_s = format ["%1 to Backpack", prim_weap_player];
if (prim_weap_player != "") then {
    pbp_id = _p addAction [_s, "x_backpack.sqf",[],-1,false];
};

// No Weapon fix for backpack
_trigger = createTrigger["EmptyDetector" ,_pos];
_trigger setTriggerArea [0, 0, 0, false];
_trigger setTriggerActivation ["NONE", "PRESENT", true];
_trigger setTriggerStatements["primaryWeapon player != prim_weap_player","prim_weap_player = primaryWeapon player;if (pbp_id != -1 && count player_backpack == 0) then {player removeAction pbp_id;pbp_id = -1;};if (pbp_id == -1 && count player_backpack == 0 && prim_weap_player != """") then {pbp_id = player addAction [format [""%1 to Backpack"", prim_weap_player], ""x_backpack.sqf"",[],-1,false];};",""];

while {true} do {
    waitUntil {!alive player};
    _p = player;
    _weapons = weapons _p;
    _magazines = magazines _p;
    if (pbp_id != -1000) then {
        _p removeAction pbp_id;
    };
    waitUntil {alive player};
    _p = player;
    removeAllWeapons _p;
    {_p addMagazine _x;} forEach _magazines;
    {_p addWeapon _x;} forEach _weapons;
    _primw = primaryWeapon _p;
    if (_primw != "") then {
        _p selectWeapon _primw;
        _muzzles = getArray(configFile>>"cfgWeapons" >> _primw >> "muzzles");
        _p selectWeapon (_muzzles select 0);
    };
    if (count player_backpack == 0) then {
        _s = format ["%1 to Backpack", primaryWeapon _p];
        pbp_id = _p addAction [_s, "x_backpack.sqf",[],-1,false];
    } else {
        _s = format ["Weapon %1", (player_backpack select 0)];
        pbp_id = _p addAction [_s, "x_backpack.sqf",[],-1,false];
    };
};

if (true) exitWith {};