_weapons = [
        "ACE_SVD_Bipod",
        "ACE_AK74M_1P78",
        "ACE_AK74M_PSO",
        "ACE_AKS74P_1P29",
        "ACE_AKS74P_PSO",
        "ACE_AK103_1P29",
        "ACE_AK103_PSO",
        "AK_107_pso",
        "KSVK",
        "SVD_des_EP1",
        "VSS_vintorez",
        "ACE_Earplugs",
        "Binocular_Vector",
        "Binocular",
        "ACE_Kestrel4500"
];

_magazines = [
        "20Rnd_9x39_SP5_VSS",
        "5Rnd_127x108_KSVK",
        "ACE_5Rnd_127x108_T_KSVK",
        "10Rnd_762x54_SVD",
        "ACE_10Rnd_762x54_T_SVD",
        "30Rnd_545x39_AK",
        "ACE_30Rnd_545x39_T_AK",
        "ACE_30Rnd_545x39_EP_AK",
        "ACE_30Rnd_545x39_AP_AK",
        "30Rnd_762x39_AK47",
        "ACE_30Rnd_762x39_T_AK47",
        "ACE_30Rnd_762x39_AP_AK47",
        "ACE_Battery_Rangefinder"
];

while {alive ammocrate_ru} do {
    clearMagazineCargo ammocrate_ru;
    clearWeaponCargo ammocrate_ru;
    {deleteVehicle _x} foreach nearestObjects [position ammocrate_ru,["WeaponHolder"],30];

    {ammocrate_ru addWeaponCargo [_x, 3];} foreach _weapons;
    {ammocrate_ru addMagazineCargo [_x, 36];} foreach _magazines;

    sleep 600;
}; 