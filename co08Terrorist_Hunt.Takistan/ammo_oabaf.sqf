// null = this execVM "ammo-oabaf.sqf";

while {alive _this} do
{

// Remove the stock items from the crate
clearMagazineCargo _this;
clearWeaponCargo _this;

// WEAPONS

_this addWeaponCargo ["BAF_AS50_scoped", 10];
_this addWeaponCargo ["BAF_AS50_TWS", 10];
_this addWeaponCargo ["BAF_L110A1_Aim", 10];
_this addWeaponCargo ["BAF_L7A2_GPMG", 10];
_this addWeaponCargo ["BAF_L85A2_RIS_ACOG", 10];
if (paramsArray select 7 == 1) then {_this addWeaponCargo ["BAF_L85A2_RIS_CWS", 10];};
_this addWeaponCargo ["BAF_L85A2_RIS_Holo", 10];
_this addWeaponCargo ["BAF_L85A2_RIS_SUSAT", 10];
_this addWeaponCargo ["BAF_L85A2_UGL_ACOG", 10];
_this addWeaponCargo ["BAF_L85A2_UGL_Holo", 10];
_this addWeaponCargo ["BAF_L85A2_UGL_SUSAT", 10];
_this addWeaponCargo ["BAF_L86A2_ACOG", 10];
_this addWeaponCargo ["BAF_LRR_scoped", 10];
_this addWeaponCargo ["BAF_LRR_scoped_W", 10];
_this addWeaponCargo ["M16A2", 10];
_this addWeaponCargo ["M16A2GL", 10];
_this addWeaponCargo ["M4A1", 10];

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

// AMMO

_this addMagazineCargo ["5Rnd_127x99_as50", 100];
_this addMagazineCargo ["5Rnd_127x99_as50", 100];
_this addMagazineCargo ["200Rnd_556x45_L110A1", 100];
_this addMagazineCargo ["100Rnd_762x51_M240", 100];
_this addMagazineCargo ["30Rnd_556x45_Stanag", 100];
_this addMagazineCargo ["5Rnd_86x70_L115A1", 100];
_this addMagazineCargo ["1Rnd_HE_M203", 100];
_this addMagazineCargo ["FlareWhite_M203", 100];
_this addMagazineCargo ["FlareGreen_M203", 100];
_this addMagazineCargo ["FlareRed_M203", 100];
_this addMagazineCargo ["FlareYellow_M203", 100];
_this addMagazineCargo ["1Rnd_Smoke_M203", 100];
_this addMagazineCargo ["1Rnd_SmokeRed_M203", 100];
_this addMagazineCargo ["1Rnd_SmokeGreen_M203", 100];
_this addMagazineCargo ["1Rnd_SmokeYellow_M203", 100];
_this addMagazineCargo ["BAF_L109A1_HE",100];
_this addMagazineCargo ["SmokeShell",100];

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
// Items
_this addWeaponCargo ["Binocular", 10];
if (paramsArray select 7 == 1) then {_this addWeaponCargo ["Binocular_Vector", 10];};
_this addWeaponCargo ["ItemGPS", 10];

// Restock time.
sleep 1800;
}; 