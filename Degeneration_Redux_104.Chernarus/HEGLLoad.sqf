private ["_car","_weapon"];

_car = _this select 0;

_weapon = ["1Rnd_HE_GP25","Laserbatteries","FlareWhite_GP25","FlareGreen_GP25","FlareRed_GP25","FlareYellow_GP25","1Rnd_SMOKE_GP25","1Rnd_SMOKEGREEN_GP25","1Rnd_SMOKERED_GP25","1Rnd_SMOKEYELLOW_GP25","1Rnd_HE_M203","FlareWhite_M203","FlareGreen_M203","Flarered_M203","FlareYellow_M203","1Rnd_Smoke_M203","1Rnd_SmokeRed_M203","1Rnd_Smoke"] call BIS_fnc_selectRandom;

_car addWeaponCargoGlobal [_weapon,(random 4)];
