                                        /////////////////////////////////////////////////////
// Called from an ammocrate's init field via:
// null = this execVM "ammo-oae.sqf";
/////////////////////////////////////////////////////

while {alive _this} do
{

// Remove the stock items from the crate
clearMagazineCargo _this;
clearWeaponCargo _this;

/////////////////////////////////////////////////////
// WEAPONS
/////////////////////////////////////////////////////

// Rifles
_this addWeaponCargo ["AK_74", 10];
_this addWeaponCargo ["AK_74_GL", 10];
_this addWeaponCargo ["AK_74_GL_kobra", 10];
_this addWeaponCargo ["AK_47_M", 10];
_this addWeaponCargo ["AK_47_S", 10];
_this addWeaponCargo ["AKS_74", 10];
_this addWeaponCargo ["AKS_74_GOSHAWK", 10];
_this addWeaponCargo ["AKS_74_kobra", 10];
if (paramsArray select 7 == 1) then {_this addWeaponCargo ["AKS_74_NSPU", 10];};
_this addWeaponCargo ["AKS_74_pso", 10];
_this addWeaponCargo ["AKS_74_U", 10];
_this addWeaponCargo ["FN_FAL", 10];
if (paramsArray select 7 == 1) then {_this addWeaponCargo ["FN_FAL_ANPVS4", 10];};
_this addWeaponCargo ["LeeEnfield", 10];
_this addWeaponCargo ["Sa58P_EP1", 10];
_this addWeaponCargo ["Sa58V_EP1", 10];
_this addWeaponCargo ["Sa58V_RCO_EP1", 10];
_this addWeaponCargo ["Sa58V_CCO_EP1", 10];

// Light Machineguns (LMG);
_this addWeaponCargo ["PK", 10];
_this addWeaponCargo ["RPK_74", 10];

// Sniper rifles
_this addWeaponCargo ["KSVK", 10];
_this addWeaponCargo ["SVD_des_EP1", 10];
_this addWeaponCargo ["SVD", 10];
if (paramsArray select 7 == 1) then {_this addWeaponCargo ["SVD_NSPU_EP1", 10];};

// Sidearm
_this addWeaponCargo ["glock17_EP1", 10];
_this addWeaponCargo ["Colt1911", 10];
_this addWeaponCargo ["revolver_EP1", 10];
_this addWeaponCargo ["revolver_gold_EP1", 10];
_this addWeaponCargo ["UZI_EP1", 10];
_this addWeaponCargo ["UZI_SD_EP1", 10];
_this addWeaponCargo ["m9",10];
_this addWeaponCargo ["m9sd",10];
_this addWeaponCargo ["Makarov", 10];
_this addWeaponCargo ["MakarovSD", 10];
_this addWeaponCargo ["Sa61_EP1", 10];

_this addWeaponCargo ["M79_EP1", 10];

/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////

// Rifle ammo
_this addMagazineCargo ["30Rnd_545x39_AK", 100];
_this addMagazineCargo ["30Rnd_762x39_AK47", 100];
_this addMagazineCargo ["30Rnd_762x39_SA58", 100];
_this addMagazineCargo ["20Rnd_762x51_FNFAL", 100];
_this addMagazineCargo ["10x_303", 100];
_this addMagazineCargo ["30Rnd_762x39_SA58", 100];

// LMG ammo
_this addMagazineCargo ["100Rnd_762x54_PK", 100];
_this addMagazineCargo ["75Rnd_545x39_RPK", 100];

// Sniper Rifle ammo
_this addMagazineCargo ["5Rnd_127x108_KSVK", 100];
_this addMagazineCargo ["10Rnd_762x54_SVD", 100];

// Sidearm ammo
_this addMagazineCargo ["8Rnd_9x18_Makarov", 100];
_this addMagazineCargo ["8Rnd_9x18_MakarovSD", 100];
_this addMagazineCargo ["6Rnd_45ACP", 100];
_this addMagazineCargo ["20Rnd_B_765x17_Ball", 100];
_this addMagazineCargo ["30Rnd_9x19_UZI", 100];
_this addMagazineCargo ["30Rnd_9x19_UZI_SD", 100];
_this addMagazineCargo ["15Rnd_9x19_M9", 100];
_this addMagazineCargo ["15Rnd_9x19_M9SD", 100];
_this addMagazineCargo ["7Rnd_45ACP_1911", 100];
_this addMagazineCargo ["17Rnd_9x19_glock17", 100];

// M203 ammo
_this addMagazineCargo ["1Rnd_HE_GP25", 100];
_this addMagazineCargo ["1Rnd_Smoke_GP25", 100];
_this addMagazineCargo ["1Rnd_SmokeGreen_GP25", 100];
_this addMagazineCargo ["1Rnd_SmokeRed_GP25", 100];
_this addMagazineCargo ["1Rnd_SmokeYellow_GP25", 100];
_this addMagazineCargo ["FlareGreen_GP25", 100];
_this addMagazineCargo ["FlareRed_GP25", 100];
_this addMagazineCargo ["FlareWhite_GP25", 100];
_this addMagazineCargo ["FlareYellow_GP25", 100];

// Items
_this addWeaponCargo ["Binocular", 10];
if (paramsArray select 7 == 1) then {_this addWeaponCargo ["Binocular_Vector", 10];};
_this addWeaponCargo ["ItemGPS", 10];

// Grenades & Satchels
_this addMagazineCargo ["HandGrenade_East", 100];
_this addMagazineCargo ["SmokeShell", 100];
_this addMagazineCargo ["SmokeShellGreen", 100];
_this addMagazineCargo ["SmokeShellRed", 100];
_this addMagazineCargo ["SmokeShellYellow", 100];
_this addMagazineCargo ["SmokeShellBlue", 100];
_this addMagazineCargo ["SmokeShellPurple", 100];
_this addMagazineCargo ["SmokeShellOrange", 100];
_this addMagazineCargo ["IR_Strobe_Target", 100];
_this addMagazineCargo ["IR_Strobe_Marker", 100];

// Restock time.
sleep 1800;
}; 