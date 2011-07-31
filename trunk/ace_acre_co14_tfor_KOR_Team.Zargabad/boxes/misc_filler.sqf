//misc_filler.sqf

if (isServer) then {
  miscBox = _this select 0;
  publicVariable "miscBox";
};


_weapons = [
        "ACE_HuntIR_monitor",
        "ACE_Kestrel4500",
        "ACE_Map",
        "ACE_Map_Tools",
        "ACE_WireCutter",
        "ACE_MX2A",
        "ACE_Rangefinder_OD",
        "ACE_YardAge450",
        "ACE_DAGR",
        "ACE_Earplugs",
        "ACE_GlassesBalaklava",
        "ACE_GlassesBalaklavaOlive",
        "ACE_GlassesBalaklavaGray",
        "ACE_GlassesLHD_glasses",
        "ACE_GlassesSunglasses",
        "ACE_GlassesTactical",
        "ACE_ParachutePack",
        "Binocular",
        "Binocular_Vector",
        "NVGoggles",
        "ItemGPS",
        "LaserDesignator",
        "ACE_KAC_PDW",        
        "ACE_UMP45_AIM",
        "ACE_UMP45_AIM_SD",
        "ACE_MP5A4",
        "ACE_MP5A5",
        "ACE_MP5SD",
        "ACE_MP7",
        "ACE_MP7_RSAS",
        "bizon",
        "bizon_silenced",
        "ACE_Flaregun",
        "ACE_Glock18",
        "ACE_Knicklicht_Proxy",
        "ACE_L9A1",
        "ACE_P226",
        "ACE_P8",
        "ACE_TT",
        "ACE_USP",
        "ACE_USPSD",
        "M9",
        "M9SD",
        "glock17_EP1",
        "Makarov",
        "MakarovSD",
        "Colt1911",
        "Sa61_EP1",
        "UZI_EP1",
        "UZI_SD_EP1",
        "ACE_MugLite",
        "ACE_GlassesGasMask_RU",
        "ACE_KeyCuffs",
        "ACE_SpottingScope",
        "revolver_gold_EP1"
];

_magazines = [
        "64Rnd_9x19_Bizon",
        "64Rnd_9x19_SD_Bizon",
        "ACE_30Rnd_9x19_S_MP5",
        "30Rnd_9x19_MP5",
        "ACE_30Rnd_6x35_B_PDW",
        "ACE_40Rnd_B_46x30_MP7",
        "ACE_25Rnd_1143x23_B_UMP45",
        "LaserBatteries",
        "8Rnd_9x18_Makarov",
        "8Rnd_9x18_MakarovSD",
        "7Rnd_45ACP_1911",
        "17Rnd_9x19_glock17",
        "20Rnd_B_765x17_Ball",
        "30Rnd_9x19_UZI",
        "30Rnd_9x19_UZI_SD",
        "15Rnd_9x19_M9",
        "15Rnd_9x19_M9SD",
        "ACE_33Rnd_9x19_G18",
        "ACE_13Rnd_9x19_L9A1",
        "ACE_15Rnd_9x19_P226",
        "ACE_15Rnd_9x19_P8",
        "ACE_8Rnd_762x25_B_Tokarev",
        "ACE_12Rnd_45ACP_USP",
        "HandGrenade_West",
        "HandGrenade_East",
        "SmokeShell",
        "SmokeShellGreen",
        "SmokeShellRed",
        "SmokeShellYellow",
        "SmokeShellBlue",
        "SmokeShellOrange",
        "PipeBomb",
        "ACE_M86PDM",
        "Mine",
        "MineE",
        "ACE_Battery_Rangefinder",
        "ACE_HuntIR_M203",
        "ACE_M84",
        "ACE_RDGM",
        "ACE_RDG2",
        "BAF_L109A1_HE",
        "HandGrenade",
        "ACE_M34",
        "ACE_Knicklicht_B",
        "ACE_Knicklicht_IR",
        "ACE_Knicklicht_W",
        "ACE_Rope_M_120",
        "ACE_Rope_M_50",
        "ACE_Rope_M_90",
        "ACE_C4_M",
        "ACE_Claymore_M",
        "ACE_Pomz_M",
        "ACE_MON50_M",
        "ACE_BBetty_M",
        "ACE_DM31_M",
        "ACE_M2SLAM_M",
        "ACE_M4SLAM_M",
        "ACE_OSM4_M",
        "BAF_ied_v4",
        "BAF_ied_v3",
        "BAF_ied_v2",
        "BAF_ied_v1",
        "ACE_TripFlare_M",
        "IR_Strobe_Marker",
        "IR_Strobe_Target",
        "Laserbatteries",
        "6Rnd_45ACP"
];

tfor_loadable_magazines = _magazines;

while {alive miscBox} do {

    {deleteVehicle _x} foreach nearestObjects [position miscBox,["WeaponHolder"],100];

    clearMagazineCargo miscBox;
    clearWeaponCargo miscBox;

    {
      miscBox addWeaponCargo [_x, 20];
    } foreach _weapons;

    {
      miscBox addMagazineCargo [_x, 20];
    } foreach _magazines;

    // restock time.
    sleep 3600;
}; 
