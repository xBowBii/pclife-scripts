// OA opfor version


private ["_dude","_i","_mags","_rnd","_mag","_weapons","_weapon"];

_dude = _this select 0;

//create an array of guns
_weapons = ["smaw","smaw","rpg7v","rpg7v","rpg7v","rpg7v","rpg7v"];

//create an array of matching mags...must match the order above 
_mags = ["SMAW_HEAA","SMAW_HEDP","PG7V","PG7VL","PG7VR","OG7"];

_rnd = floor random (count _weapons);

_weapon = _weapons select _rnd;
_mag = _mags select _rnd;


_dude addMagazineCargoGlobal [_mag,(random 4)];


_dude addWeaponCargoGlobal [_weapon,1];