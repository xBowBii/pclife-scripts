if (!isServer) exitWith {};
// OA opfor version


private ["_dude","_i","_mags","_rnd","_mag","_weapons","_weapon"];

_dude = _this select 0;

//create an array of guns
_weapons = ["huntingrifle","vss_vintorez","svd","svd_camo","ksvk","m24","m40a3","m107","m4spr","DMR"];

//create an array of matching mags...must match the order above 
_mags = ["5x_22_LR_17_HMR","20Rnd_9x39_SP5_VSS","10Rnd_762x54_SVD","10Rnd_762x54_SVD","5Rnd_127x108_KSVK","5Rnd_762x51_M24","5Rnd_762x51_M24","10Rnd_127x99_m107","20Rnd_556x45_Stanag","20Rnd_762x51_DMR"];

_rnd = floor random (count _weapons);

_weapon = _weapons select _rnd;
_mag = _mags select _rnd;


_dude addMagazineCargoGlobal [_mag,(random 6)];


_dude addWeaponCargoGlobal [_weapon,1];