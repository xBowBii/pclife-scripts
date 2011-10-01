/////////////////////////////////////////////////////
// Called from an ammocrate's init field via:
// null = this execVM "ammo_a2w.sqf";
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
_this addWeaponCargo ["M1014", 10];
_this addWeaponCargo ["M16A2", 10];
_this addWeaponCargo ["M16A2GL", 10];
_this addWeaponCargo ["M16A4", 10];
_this addWeaponCargo ["M16A4_GL", 10];
_this addWeaponCargo ["M16A4_ACG_GL", 10];
_this addWeaponCargo ["M16A4_ACG", 10];
_this addWeaponCargo ["M4A1", 10];
_this addWeaponCargo ["M4A1_HWS_GL", 10];
_this addWeaponCargo ["M4A1_HWS_GL_camo", 10];
_this addWeaponCargo ["M4A1_HWS_GL_SD_Camo", 10];
_this addWeaponCargo ["M4A1_RCO_GL", 10];
_this addWeaponCargo ["M4A1_Aim", 10];
_this addWeaponCargo ["M4A1_Aim_camo", 10];
_this addWeaponCargo ["M4A1_AIM_SD_camo", 10];
_this addWeaponCargo ["MP5A5", 10];
_this addWeaponCargo ["MP5SD", 10];
_this addWeaponCargo ["M8_carbine", 10];
_this addWeaponCargo ["M8_carbineGL", 10];
_this addWeaponCargo ["M8_compact", 10];
_this addWeaponCargo ["G36A", 10];
_this addWeaponCargo ["G36C", 10];
_this addWeaponCargo ["G36_C_SD_eotech", 10];
_this addWeaponCargo ["G36K", 10];

// Light Machineguns (LMG);
_this addWeaponCargo ["m240", 10];
_this addWeaponCargo ["M249", 10];
_this addWeaponCargo ["M8_SAW", 10];
_this addWeaponCargo ["Mk_48", 10];
_this addWeaponCargo ["MG36", 10];

// Sniper rifles
_this addWeaponCargo ["m107", 10];
_this addWeaponCargo ["m40A3", 10];
_this addWeaponCargo ["M4SPR", 10];
_this addWeaponCargo ["M8_sharpshooter", 10];
_this addWeaponCargo ["M24", 10];
_this addWeaponCargo ["DMR", 10];

// Sidearm
_this addWeaponCargo ["Colt1911", 10];
_this addWeaponCargo ["m9",10];
_this addWeaponCargo ["m9sd",10];


/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////

// Rifle ammo
_this addMagazineCargo ["20Rnd_762x51_DMR", 100];
_this addMagazineCargo ["30Rnd_556x45_Stanag", 100];
_this addMagazineCargo ["30Rnd_556x45_StanagSD", 100];
_this addMagazineCargo ["30Rnd_556x45_G36", 100];
_this addMagazineCargo ["30Rnd_556x45_G36SD", 100];
_this addMagazineCargo ["30Rnd_9x19_MP5SD", 100];
_this addMagazineCargo ["30Rnd_9x19_MP5", 100];
_this addMagazineCargo ["8Rnd_B_Beneli_74Slug", 100];
_this addMagazineCargo ["20Rnd_556x45_Stanag", 100];

// LMG ammo
_this addMagazineCargo ["100Rnd_762x51_M240", 100];
_this addMagazineCargo ["200Rnd_556x45_M249", 100];
_this addMagazineCargo ["100Rnd_556x45_BetaCMag", 100];

// Sniper Rifle ammo
_this addMagazineCargo ["10Rnd_127x99_m107", 100];
_this addMagazineCargo ["5Rnd_762x51_M24", 100];

// Sidearm ammo
_this addMagazineCargo ["15Rnd_9x19_M9", 100];
_this addMagazineCargo ["15Rnd_9x19_M9SD", 100];
_this addMagazineCargo ["7Rnd_45ACP_1911", 100];

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

// Items
_this addWeaponCargo ["Binocular", 100];
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


// Restock time.
sleep 1800;
}; 