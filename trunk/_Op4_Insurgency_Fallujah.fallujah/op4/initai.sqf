_haji = _this select 0;

_allrifles = ["AK_47_M","AK_47_S","ACE_AKM","ACE_AKMS","AKS_GOLD","AK_74","AKS_74","AKS_74_U","AKS_74","ACE_SKS","ACE_SKS","ACE_SKS","ACE_M3A1","LeeEnfield","Sa58P_EP1","Sa58V_EP1","Saiga12K","FN_FAL","ACE_G3A3","M16A2","bizon",
"AK_74_GL","ACE_AKS74_GP25","ACE_AKM_GL",
"ACE_RPK","RPK_74","PK",
"ACE_SVD_Bipod","SVD","huntingrifle","ksvk"];
_allmags = ["30Rnd_762x39_AK47","30Rnd_762x39_AK47","30Rnd_762x39_AK47","30Rnd_762x39_AK47","30Rnd_762x39_AK47","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","ACE_10Rnd_762x39_B_SKS","ACE_10Rnd_762x39_B_SKS","ACE_10Rnd_762x39_B_SKS","ACE_30Rnd_1143x23_B_M3","10x_303","30Rnd_762x39_SA58","30Rnd_762x39_SA58","8Rnd_B_Saiga12_Pellets","20Rnd_762x51_FNFAL","ACE_20Rnd_762x51_B_G3","30Rnd_556x45_Stanag","64Rnd_9x19_Bizon",
"30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_762x39_AK47",
"ACE_75Rnd_762x39_B_AK47","ACE_45Rnd_545x39_B_AK","100Rnd_762x54_PK",
"10Rnd_762x54_SVD","10Rnd_762x54_SVD","5x_22_LR_17_HMR","5Rnd_127x108_KSVK"];
_extras = ["BAF_ied_v1","BAF_ied_v2","BAF_ied_v3","BAF_ied_v4","BAF_L109A1_HE","HandGrenade_East","HandGrenade","Mine","MineE","ACE_MON50_M","ACE_Pomz_M","PipeBomb"];
_noextras = ["AK_74_GL","ACE_AKS74_GP25","ACE_AK74M_GL","ACE_AKM_GL","ACE_RPK","RPK_74","PK","ACE_SVD_Bipod","SVD","huntingrifle","ksvk"];
_gl = ["AK_74_GL","ACE_AKS74_GP25","ACE_AK74M_GL","ACE_AKM_GL"];
_rpg = ["OG7","PG7V","PG7VL","PG7VR"];

  if (side _haji == east) then {
  if !(_haji hasweapon "ACE_GlassesBalaklava") then {

	_rnd = floor random (count _allrifles); 
	_rifle = _allrifles select _rnd;
	_mag = _allmags select _rnd; 

removeAllWeapons _haji;

for [{_i=1},{_i<=8},{_i=_i+1}] do {
	_haji addMagazine _mag;
};
_haji addWeapon _rifle;
_haji selectweapon _rifle;
_gun = primaryweapon _haji; 

if (_gun in _gl) then {
for [{_i=1},{_i<=4},{_i=_i+1}] do {
	_haji addMagazine "1Rnd_HE_GP25";
	};
};

if !(_gun in _noextras) then {
if (random 1 < 0.26) then {
if (random 1 < 0.26) then {
_haji addmagazine "strela";
_haji addweapon "strela";
} else {
	_rndrpg1 = floor random (count _rpg); 
	_rpg1 = _rpg select _rndrpg1;
	_rndrpg2 = floor random (count _rpg); 
	_rpg2 = _rpg select _rndrpg2;
	_rndrpg3 = floor random (count _rpg); 
	_rpg3 = _rpg select _rndrpg3;	
	_haji addmagazine _rpg1;
	_haji addmagazine _rpg2;
	_haji addmagazine _rpg3;
	_haji addweapon "RPG7V";
};	
} else {
	_rndextras1 = floor random (count _extras); 
	_extras1 = _extras select _rndextras1;
	_rndextras2 = floor random (count _extras); 
	_extras2 = _extras select _rndextras2;
	_haji addmagazine _extras1;
	_haji addmagazine _extras2;
};
};

    _haji setskill ["aimingAccuracy",(0.15 + random 0.25)];
    _haji setskill ["spotDistance",0.85];
    _haji setskill ["spotTime",0.85];
    _haji setskill ["courage",0.85]; 
    _haji setskill ["commanding",0.85]; 
    _haji setskill ["aimingShake",0.15];
    _haji setskill ["aimingSpeed",0.65];
	_haji addweapon "ACE_GlassesBalaklava";
	["ace_sys_wounds_rev", {if (side (_this select 0) == east) then {(_this select 0) setdamage 1};}] call CBA_fnc_addEventhandler;
	};
  };