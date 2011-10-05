private ["_car","_weapon"];

_car = _this select 0;

_weapon = ["Binocular","Laserdesignator","NVGoggles","ItemCompass","ItemGPS","ItemMap","ItemRadio","ItemWatch"] call BIS_fnc_selectRandom;

_car addWeaponCargoGlobal [_weapon,1];
