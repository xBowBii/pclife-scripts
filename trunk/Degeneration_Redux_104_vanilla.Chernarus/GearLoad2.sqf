private ["_Gear","_weapon"];

_weapon = ["Binocular","Laserdesignator","NVGoggles","ItemCompass","ItemGPS","ItemMap","ItemRadio","ItemWatch"] call BIS_fnc_selectRandom;

_this addWeaponCargoGlobal [_weapon,1];

