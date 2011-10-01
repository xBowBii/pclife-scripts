                                                /////////////////////////////////////////////////////
// Called from an ammocrate's init field via:
// null = this execVM "ammo-oaw.sqf";
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
_this addWeaponCargo ["M14_EP1", 10];
_this addWeaponCargo ["M16A2", 10];
_this addWeaponCargo ["M16A2GL", 10];
_this addWeaponCargo ["M4A1", 10];
_this addWeaponCargo ["M4A3_RCO_GL_EP1", 10];
_this addWeaponCargo ["M4A3_CCO_EP1", 10];
_this addWeaponCargo ["SCAR_L_CQC_CCO_SD", 10];
_this addWeaponCargo ["SCAR_L_CQC", 10];
_this addWeaponCargo ["SCAR_L_CQC_Holo", 10];
_this addWeaponCargo ["SCAR_L_CQC_EGLM_Holo", 10];
_this addWeaponCargo ["SCAR_L_STD_EGLM_RCO", 10];
_this addWeaponCargo ["SCAR_L_STD_EGLM_TWS", 10];
_this addWeaponCargo ["SCAR_L_STD_HOLO", 10];
_this addWeaponCargo ["SCAR_L_STD_Mk4CQT", 10];
_this addWeaponCargo ["SCAR_H_CQC_CCO", 10];
_this addWeaponCargo ["SCAR_H_CQC_CCO_SD", 10];
_this addWeaponCargo ["SCAR_H_STD_EGLM_Spect", 10];
_this addWeaponCargo ["SCAR_H_LNG_Sniper", 10];
_this addWeaponCargo ["SCAR_H_LNG_Sniper_SD", 10];
_this addWeaponCargo ["SCAR_H_STD_TWS_SD", 10];
_this addWeaponCargo ["G36A_camo", 10];
_this addWeaponCargo ["G36C_camo", 10];
_this addWeaponCargo ["G36_C_SD_camo", 10];
_this addWeaponCargo ["G36K_camo", 10];

// Light Machineguns (LMG);
_this addWeaponCargo ["m240_scoped_EP1", 10];
_this addWeaponCargo ["M249_EP1", 10];
_this addWeaponCargo ["M249_m145_EP1", 10];
_this addWeaponCargo ["M249_TWS_EP1", 10];
_this addWeaponCargo ["M60A4_EP1", 10];
_this addWeaponCargo ["Mk_48_DES_EP1", 10];
_this addWeaponCargo ["MG36_camo", 10];

// Sniper rifles
_this addWeaponCargo ["m107", 10];
_this addWeaponCargo ["m107_TWS_EP1", 10];
if (paramsArray select 7 == 1) then {_this addWeaponCargo ["M110_NVG_EP1", 10];};
_this addWeaponCargo ["M110_TWS_EP1", 10];
_this addWeaponCargo ["M24_des_EP1", 10];

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

_this addWeaponCargo ["M32_EP1", 10];
_this addWeaponCargo ["Mk13_EP1", 10];


/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////

// Rifle ammo
_this addMagazineCargo ["20Rnd_762x51_DMR", 100];
_this addMagazineCargo ["20Rnd_762x51_B_SCAR", 100];
_this addMagazineCargo ["20Rnd_762x51_SB_SCAR", 100];
_this addMagazineCargo ["30Rnd_556x45_Stanag", 100];
_this addMagazineCargo ["30Rnd_556x45_StanagSD", 100];
_this addMagazineCargo ["30Rnd_556x45_G36", 100];
_this addMagazineCargo ["30Rnd_556x45_G36SD", 100];

// LMG ammo
_this addMagazineCargo ["100Rnd_762x51_M240", 100];
_this addMagazineCargo ["200Rnd_556x45_M249", 100];
_this addMagazineCargo ["100Rnd_556x45_BetaCMag", 100];

// Sniper Rifle ammo
_this addMagazineCargo ["10Rnd_127x99_m107", 100];
_this addMagazineCargo ["5Rnd_762x51_M24", 100];

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
_this addMagazineCargo ["1Rnd_HE_M203", 100];
_this addMagazineCargo ["1Rnd_Smoke_M203", 100];
_this addMagazineCargo ["1Rnd_SmokeGreen_M203", 100];
_this addMagazineCargo ["1Rnd_SmokeRed_M203", 100];
_this addMagazineCargo ["1Rnd_SmokeYellow_M203", 100];
_this addMagazineCargo ["FlareGreen_M203", 100];
_this addMagazineCargo ["FlareRed_M203", 100];
_this addMagazineCargo ["FlareWhite_M203", 100];
_this addMagazineCargo ["FlareYellow_M203", 100];
_this addMagazineCargo ["6Rnd_HE_M203", 100];

// Items
_this addWeaponCargo ["Binocular", 100];
if (paramsArray select 7 == 1) then {_this addWeaponCargo ["Binocular_Vector", 100];};
_this addWeaponCargo ["ItemGPS", 100];


// Grenades & Satchels
_this addMagazineCargo ["HandGrenade_West", 100];
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