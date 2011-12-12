_weapons = [
        "ACE_AS50",
        "ACE_M109",
        "ACE_M110",
        "ACE_M110_SD",
        "ACE_TAC50",
        "ACE_TAC50_SD",
        "ACE_Mk12mod1",
        "ACE_Mk12mod1_SD",
        "ACE_G3SG1",
        "ACE_M4SPR_SD", 
        "SCAR_H_LNG_Sniper",
        "SCAR_H_LNG_Sniper_SD",
        "m107",
        "m107_TWS_EP1",
        "M24_des_EP1",
        "M40A3",
        "DMR",
        "ACE_G36A2_Bipod",
        "ACE_HK417_leupold",
        "ACE_M14_ACOG",
        "m16a4_acg",
        "ACE_m16a2_scope",
        "ACE_Earplugs",
        "Binocular_Vector",
        "Binocular",
        "ACE_Kestrel4500"
];

_magazines = [
        "20Rnd_9x39_SP5_VSS",
        "20Rnd_556x45_Stanag",
        "ACE_30Rnd_556x45_SB_Stanag",
        "30Rnd_556x45_Stanag",
        "ACE_30Rnd_556x45_T_Stanag",
        "20Rnd_762x51_DMR",
        "ACE_20Rnd_762x51_T_DMR",
        "20Rnd_762x51_B_SCAR",
        "ACE_20Rnd_762x51_S_SCAR",
        "ACE_20Rnd_762x51_SB_SCAR",
        "ACE_20Rnd_762x51_SB_S_SCAR",
        "ACE_20Rnd_762x51_T_SCAR",
        "5Rnd_762x51_M24",
        "ACE_5Rnd_762x51_T_M24",
        "ACE_5Rnd_127x99_B_TAC50",
        "ACE_5Rnd_127x99_T_TAC50",
        "ACE_5Rnd_25x59_HEDP_Barrett",
        "ACE_20Rnd_762x51_SB_M110",
        "ACE_20Rnd_762x51_T_M110",
        "10Rnd_127x99_m107",
        "ACE_10Rnd_127x99_Raufoss_m107",
        "ACE_10Rnd_127x99_T_m107",
        "ACE_20Rnd_762x51_B_G3",
        "ACE_20Rnd_762x51_T_G3",
        "ACE_20Rnd_762x51_SB_HK417",
        "ACE_20Rnd_762x51_B_HK417",
        "ACE_20Rnd_762x51_T_HK417",
        "30Rnd_556x45_G36",
        "ACE_30Rnd_556x45_T_G36",
        "ACE_30Rnd_556x45_AP_G36",
        "ACE_Battery_Rangefinder"
];

while {alive ammocrate_us} do {
    clearMagazineCargo ammocrate_us;
    clearWeaponCargo ammocrate_us;
    {deleteVehicle _x} foreach nearestObjects [position ammocrate_us,["WeaponHolder"],30];

    {ammocrate_us addWeaponCargo [_x, 3];} foreach _weapons;
    {ammocrate_us addMagazineCargo [_x, 36];} foreach _magazines;

    sleep 600;
}; 