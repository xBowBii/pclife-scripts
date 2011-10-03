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
_this addWeaponCargo ["AK_47_M", 10];
_this addWeaponCargo ["AK_47_S", 10];
_this addWeaponCargo ["AKS_74_kobra", 10];
_this addWeaponCargo ["AKS_74_pso", 10];
_this addWeaponCargo ["AKS_74_U", 10];
_this addWeaponCargo ["AKS_74_UN_kobra", 10];
_this addWeaponCargo ["Bizon", 10];
_this addWeaponCargo ["bizon_silenced", 10];
_this addWeaponCargo ["Saiga12K", 10];
_this addWeaponCargo ["AK_107_kobra", 10];
_this addWeaponCargo ["AK_107_GL_kobra", 10];
_this addWeaponCargo ["AK_107_GL_pso", 10];
_this addWeaponCargo ["AK_107_pso", 10];
_this addWeaponCargo ["VSS_vintorez", 10];

// Light Machineguns (LMG);
_this addWeaponCargo ["PK", 10];
_this addWeaponCargo ["RPK_74", 10];
_this addWeaponCargo ["Pecheneg", 10];

// Sniper rifles
_this addWeaponCargo ["KSVK", 10];
_this addWeaponCargo ["Huntingrifle", 10];
_this addWeaponCargo ["SVD", 10];
_this addWeaponCargo ["SVD_CAMO", 10];

// Sidearm
_this addWeaponCargo ["Colt1911", 10];
_this addWeaponCargo ["Makarov", 10];
_this addWeaponCargo ["MakarovSD", 10];


/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////

// Rifle ammo
_this addMagazineCargo ["30Rnd_545x39_AK", 100];
_this addMagazineCargo ["30Rnd_762x39_AK47", 100];
_this addMagazineCargo ["30Rnd_545x39_AKSD", 100];
_this addMagazineCargo ["8Rnd_B_Saiga12_74Slug", 100];
_this addMagazineCargo ["20Rnd_9x39_SP5_VSS", 100];
_this addMagazineCargo ["10Rnd_9x39_SP5_VSS", 100];
_this addMagazineCargo ["64Rnd_9x19_SD_Bizon", 100];
_this addMagazineCargo ["64Rnd_9x19_Bizon", 100];

// LMG ammo
_this addMagazineCargo ["100Rnd_762x54_PK", 100];
_this addMagazineCargo ["75Rnd_545x39_RPK", 100];

// Sniper Rifle ammo
_this addMagazineCargo ["5Rnd_127x108_KSVK", 100];
_this addMagazineCargo ["10Rnd_762x54_SVD", 100];
_this addMagazineCargo ["5x_22_LR_17_HMR", 100];

// Sidearm ammo
_this addMagazineCargo ["8Rnd_9x18_Makarov", 100];
_this addMagazineCargo ["8Rnd_9x18_MakarovSD", 100];
_this addMagazineCargo ["7Rnd_45ACP_1911", 100];

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

// Restock time.
sleep 1800;
}; 