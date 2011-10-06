// OA opfor version


private ["_dude","_i","_mags","_rnd","_mag","_weapons","_weapon"];

_dude = _this select 0;

//create an array of guns
_weapons = ["saiga12k","bizon","aks_gold","AK_74","AK_47_M","FN_FAL","RPK_74","PK","AK_74_GL_kobra","AK_47_S","AKS_74_pso","AKS_74_GOSHAWK","AKS_74_U","LeeEnfield","m16a2","m16a2gl","m16a4","m16a4_gl","m16a4_acg","m16a4_acg_gl","m4a1","m4a1_aim","m4A1_AIM_camo","M4A1_AIM_SD_camo","M4A1_HWS_GL","m4a1_hws_gl_camo","m4a1_hws_gl_sd_camo","m4a1_rco_gl","m8_carbine","m8_carbinegl","m8_compact","m8_sharpshooter","g36a","g36k","g36c","g36c_sd_eotech","mp5a5","mp5sd","m1014"];

//create an array of matching mags...must match the order above 
_mags = ["8Rnd_B_Saiga12_Pellets","64Rnd_9x19_Bizon","30Rnd_762x39_AK47","30Rnd_545x39_AK","30Rnd_762x39_AK47","20Rnd_762x51_FNFAL","75Rnd_545x39_RPK","100Rnd_762x54_PK","30Rnd_545x39_AK","30Rnd_762x39_AK47","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","10x_303","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_StanagSD","100Rnd_556x45_BetaCMag","20Rnd_556x45_Stanag","30Rnd_556x45_StanagSD","30Rnd_556x45_Stanag","30Rnd_556x45_G36","30Rnd_556x45_G36","30Rnd_556x45_G36","20Rnd_556x45_Stanag","30Rnd_556x45_G36","30Rnd_556x45_G36","30Rnd_556x45_G36","30Rnd_556x45_G36SD","30Rnd_9x19_MP5","30Rnd_9x19_MP5SD","8Rnd_B_Beneli_Pellets"];

_rnd = floor random (count _weapons);

_weapon = _weapons select _rnd;
_mag = _mags select _rnd;


_dude addMagazineCargoGlobal [_Mag,(random 12)];


_dude addWeaponCargoGlobal [_weapon,(random 2)];