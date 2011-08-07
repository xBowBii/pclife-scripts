_cache = _this select 0;

_weapons = [
        "ACE_M249_PIP_ACOG",
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

while {alive _cache} do {

	{deleteVehicle _x} foreach nearestObjects [position _cache,["WeaponHolder"],30];

	clearMagazineCargo _cache;
	clearWeaponCargo _cache;

	{
      _cache addWeaponCargo [_x, 2];
	} foreach _weapons;

	{
		_cache addMagazineCargo [_x, 100];
	} foreach _magazines;


	// restock time.
	sleep 1800;
}; 