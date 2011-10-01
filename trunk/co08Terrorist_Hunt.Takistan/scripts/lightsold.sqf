////////////////////////////////////////////////////////////////
// Weapon with flashlight.
// Custom unit script for Arma 2 OA.
// Created with ArmA Edit - Version 1.3.4000.
// HELP: Run this script from the INITIALIZATION box of the unit.
// execute with _null = [this] execVM "scripts\lightsold.sqf"; in init file of unit.
////////////////////////////////////////////////////////////////

// Get the unit parameter given.
_unit = _this select 0;

// Strip the units current gear.
removeAllWeapons _unit;

// Add the new gear to the unit.
_unit addMagazine "30Rnd_556x45_Stanag";
_unit addMagazine "30Rnd_556x45_Stanag";
_unit addMagazine "30Rnd_556x45_Stanag";
_unit addMagazine "30Rnd_556x45_Stanag";
_unit addMagazine "30Rnd_556x45_Stanag";
_unit addMagazine "30Rnd_556x45_Stanag";
_unit addMagazine "30Rnd_556x45_Stanag";
_unit addMagazine "30Rnd_556x45_Stanag";
_unit addWeapon "M4A3_CCO_EP1";
_unit selectWeapon "M4A3_CCO_EP1";
_unit addMagazine "HandGrenade";
_unit addMagazine "HandGrenade";