//sniper_filler.sqf

if (isServer) then {
  sniperBox = _this select 0;
  publicVariable "sniperBox";  
};


_weapons = [
        "ACE_AS50",
        "ACE_M109",
        "ACE_M110",
        "ACE_M110_SD",
        "ACE_SVD_Bipod",
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
        "KSVK",
        "SVD_des_EP1",
        "VSS_vintorez",
        "M40A3",
        "DMR"
];

_magazines = [
        "20Rnd_9x39_SP5_VSS",
        "20Rnd_556x45_Stanag",
        "ACE_30Rnd_556x45_SB_Stanag",
        "20Rnd_762x51_DMR",
        "ACE_20Rnd_762x51_T_DMR",
        "20Rnd_762x51_B_SCAR",
        "ACE_20Rnd_762x51_S_SCAR",
        "ACE_20Rnd_762x51_SB_SCAR",
        "ACE_20Rnd_762x51_SB_S_SCAR",
        "ACE_20Rnd_762x51_T_SCAR",
        "5Rnd_762x51_M24",
        "ACE_5Rnd_762x51_T_M24",
        "5Rnd_127x108_KSVK",
        "ACE_5Rnd_127x108_T_KSVK",
        "10Rnd_762x54_SVD",
        "ACE_10Rnd_762x54_T_SVD",
        "ACE_5Rnd_127x99_B_TAC50",
        "ACE_5Rnd_127x99_T_TAC50",
        "ACE_5Rnd_25x59_HEDP_Barrett",
        "ACE_20Rnd_762x51_SB_M110",
        "ACE_20Rnd_762x51_T_M110",
        "10Rnd_127x99_m107",
        "ACE_10Rnd_127x99_Raufoss_m107",
        "ACE_10Rnd_127x99_T_m107",
        "ACE_20Rnd_762x51_B_G3",
        "ACE_20Rnd_762x51_T_G3"
];

tfor_loadable_magazines = _magazines;

while {alive sniperBox} do {

    {deleteVehicle _x} foreach nearestObjects [position sniperBox,["WeaponHolder"],30];

    clearMagazineCargo sniperBox;
    clearWeaponCargo sniperBox;

    {
      sniperBox addWeaponCargo [_x, 1];
    } foreach _weapons;

    {
      sniperBox addMagazineCargo [_x, 50];
    } foreach _magazines;

    // restock time.
    sleep 3600;
}; 
