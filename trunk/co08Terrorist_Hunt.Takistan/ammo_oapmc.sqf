while {alive _this} do
{

// Remove the stock items from the crate
clearMagazineCargo _this;
clearWeaponCargo _this;

// WEAPONS

_this addWeaponCargo ["AA12_PMC", 10];
_this addWeaponCargo ["m8_carbine_pmc", 10];
_this addWeaponCargo ["m8_carbine", 10];
_this addWeaponCargo ["m8_carbineGL", 10];
_this addWeaponCargo ["m8_compact", 10];
_this addWeaponCargo ["m8_compact_pmc", 10];
_this addWeaponCargo ["m8_holo_sd", 10];
_this addWeaponCargo ["m8_SAW", 10];
_this addWeaponCargo ["m8_sharpshooter", 10];
_this addWeaponCargo ["m8_tws", 10];
_this addWeaponCargo ["m8_tws_sd", 10];
_this addWeaponCargo ["m4a1",10];
_this addWeaponCargo ["M4A3_CCO_EP1",10];
_this addWeaponCargo ["M4A3_RCO_GL_EP1",10];
_this addWeaponCargo ["PK", 10];
_this addWeaponCargo ["KSVK", 10];

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

_this addMagazineCargo ["20Rnd_B_AA12_74Slug", 100];
_this addMagazineCargo ["20Rnd_B_AA12_HE", 100];
_this addMagazineCargo ["20Rnd_B_AA12_Pellets", 100];
_this addMagazineCargo ["30Rnd_556x45_StanagSD", 100];
_this addMagazineCargo ["30Rnd_556x45_Stanag", 100];
_this addMagazineCargo ["100Rnd_556x45_BetaCMag", 100];
_this addMagazineCargo ["100Rnd_762x54_PK", 100];
_this addMagazineCargo ["5Rnd_127x108_KSVK", 100];

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
_this addMagazineCargo ["HandGrenade_West",100];
_this addMagazineCargo ["Smokeshell",100];



// Items

_this addWeaponCargo ["Binocular", 10];
if (paramsArray select 7 == 1) then {_this addWeaponCargo ["Binocular_Vector", 10];};
_this addWeaponCargo ["ItemGPS", 10];


// Restock time.
sleep 1800;
}; 