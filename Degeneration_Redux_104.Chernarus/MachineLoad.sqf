// OA opfor version


private ["_dude","_i","_mags","_rnd","_mag","_weapons","_weapon"];

_dude = _this select 0;

//create an array of guns
_weapons = ["m249","m240","mk_48","mg36","m8_saw","rpk_74","pk","pecheneg"];

//create an array of matching mags...must match the order above 
_mags = ["200Rnd_556x45_M249","100Rnd_762x51_M240","100Rnd_762x51_M240","30Rnd_556x45_G36","30Rnd_556x45_G36","75Rnd_545x39_RPK","100Rnd_762x54_PK","100Rnd_762x54_PK"];

_rnd = floor random (count _weapons);

_weapon = _weapons select _rnd;
_mag = _mags select _rnd;


_dude addMagazineCargoGlobal [_mag,(random 6)];


_dude addWeaponCargoGlobal [_weapon,1];