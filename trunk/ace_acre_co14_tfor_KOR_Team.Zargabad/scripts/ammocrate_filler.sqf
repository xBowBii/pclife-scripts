// by Bon_Inf*


_cache = _this select 0;



_weapons = [


];


_magazines = [

];



if(tfor_arma2) then {
	#include "ammo_arma2.sqf"
};
if(tfor_BAF) then {
	#include "ammo_baf.sqf"
};
if(tfor_PMC) then {
	#include "ammo_pmc.sqf"
};
if(tfor_ACE) then {
	#include "ammo_ace.sqf"
};

if(tfor_acre == 1) then {
	_weapons = _weapons + ["ACRE_PRC148","ACRE_PRC117F","ACRE_PRC119","ACRE_PRC343"];
};





//remove duplicates:
{
	_magazines = (_magazines - [_x]) + [_x];
} foreach _magazines;
{
	_weapons = (_weapons - [_x]) + [_x];
} foreach _weapons;


tfor_loadable_magazines = _magazines;



_weaponcapacity = 0 max getNumber (configFile >> "CfgVehicles" >> typeOf _cache >> "transportMaxWeapons") - 100;
_magazinecapacity = 0 max getNumber (configFile >> "CfgVehicles" >> typeOf _cache >> "transportMaxMagazines") - 100;


while {alive _cache} do {

	{deleteVehicle _x} foreach nearestObjects [position _cache,["WeaponHolder"],100];

	clearMagazineCargo _cache;
	clearWeaponCargo _cache;

	{
		_cache addWeaponCargo [_x, floor(_weaponcapacity / (count _weapons))];
	} foreach _weapons;

	{
		_cache addMagazineCargo [_x, floor(_magazinecapacity / (count _magazines))];
	} foreach _magazines;


	// restock time.
	sleep 1800;
}; 