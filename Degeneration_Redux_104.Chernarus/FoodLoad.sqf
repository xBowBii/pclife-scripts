private ["_car","_cargo"];

_car = _this select 0;

_cargo = ["DGN_Water_M","DGN_Food_M","DGN_GrapeDrank_M","DGN_Watermelon_M"] call BIS_fnc_selectRandom;

_car addMagazineCargoGlobal [_cargo,((random 4)+1)];