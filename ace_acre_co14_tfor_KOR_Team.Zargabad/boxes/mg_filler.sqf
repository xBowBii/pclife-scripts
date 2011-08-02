//mg_filler.sqf

if (isServer) then {
  mgBox = _this select 0;
  publicVariable "mgBox";
};


_weapons = [
        "ACE_M249_PIP_ACOG",
        "BAF_L110A1_Aim",
        "ACE_RPK",
        "ACE_RPK74M",
        "ACE_RPK74M_1P29",
        "ACE_M60",
        "M240",
        "m240_scoped_EP1",
        "M249_EP1",
        "M249_m145_EP1",
        "M249_TWS_EP1",
        "Mk_48",
        "Mk_48_DES_EP1",
        "Pecheneg",
        "m8_SAW",
        "M60A4_EP1",
        "MG36",
        "MG36_camo",
        "PK",
        "m240_scoped_EP1",
        "M249_EP1",
        "M249_m145_EP1",
        "M249_TWS_EP1",
        "M60A4_EP1",
        "Mk_48_DES_EP1"
];

_magazines = [
        "100Rnd_762x51_M240",
        "200Rnd_556x45_M249",
        "ACE_100Rnd_556x45_T_M249",
        "ACE_200Rnd_556x45_T_M249",
        "200Rnd_556x45_L110A1",
        "100Rnd_762x54_PK",
        "75Rnd_545x39_RPK",
        "100Rnd_556x45_BetaCMag",
        "ACE_40Rnd_762x39_B_AK47",
        "ACE_40Rnd_762x39_T_AK47",
        "ACE_45Rnd_545x39_B_AK",
        "ACE_75Rnd_545x39_T_RPK",
        "ACE_75Rnd_762x39_B_AK47"
];

tfor_loadable_magazines = _magazines;

while {alive mgBox} do {

    {deleteVehicle _x} foreach nearestObjects [position mgBox,["WeaponHolder"],100];

    clearMagazineCargo mgBox;
    clearWeaponCargo mgBox;

    {
      mgBox addWeaponCargo [_x, 1];
    } foreach _weapons;

    {
      mgBox addMagazineCargo [_x, 20];
    } foreach _magazines;

    // restock time.
    sleep 1800;
}; 
