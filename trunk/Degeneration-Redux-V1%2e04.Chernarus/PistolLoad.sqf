// OA opfor version


private ["_dude","_i","_mags","_rnd","_mag","_weapons","_weapon"];

_dude = _this select 0;

//create an array of guns
_weapons = ["colt1911","m9","m9sd","makarov","makarovsd"];

//create an array of matching mags...must match the order above 
_mags = ["7Rnd_45ACP_1911","15Rnd_9x19_M9","15Rnd_9x19_M9SD","8Rnd_9x18_Makarov","8Rnd_9x18_MakarovSD"];

_rnd = floor random (count _weapons);

_weapon = _weapons select _rnd;
_mag = _mags select _rnd;


_dude addMagazineCargoGlobal [_mag,(random 20)];


_dude addWeaponCargoGlobal [_weapon,(random 4)];