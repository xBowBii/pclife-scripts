// by Bon-Inf*, Kol9yN, Operator

if (isServer) then {
  ruckBox = _this select 0;
  publicVariable "ruckBox";
};

_weapons = [
	    "ACE_Rucksack_EAST",
        "ACE_Rucksack_MOLLE_ACU",
        "ACE_Rucksack_MOLLE_ACU_Medic",
        "ACE_Rucksack_MOLLE_Brown",
        "ACE_Rucksack_MOLLE_Brown_Medic",
        "ACE_Rucksack_MOLLE_DMARPAT",
        "ACE_Rucksack_MOLLE_DMARPAT_Medic",
        "ACE_Rucksack_MOLLE_Green",
        "ACE_Rucksack_MOLLE_Green_Medic",
        "ACE_Rucksack_MOLLE_WMARPAT",
        "ACE_Rucksack_MOLLE_WMARPAT_Medic",
        "ACE_Rucksack_MOLLE_Wood",
        "ACE_Rucksack_RD54",
        "ACE_Rucksack_RD90",
        "ACE_Rucksack_RD91",
        "ACE_Rucksack_RD92",
        "ACE_Rucksack_RD99",
        "ACE_Stretcher",
        "ACE_VTAC_RUSH72",
        "ACE_VTAC_RUSH72_ACU",
        "ACE_VTAC_RUSH72_FT_MEDIC",
        "ACE_VTAC_RUSH72_TT_MEDIC",
        "ACE_ALICE_Backpack",
        "ACE_BackPack",
        "ACE_BackPack_ACR",
        "ACE_BackPack_ACR_DDPM",
        "ACE_BackPack_ACR_DPM",
        "ACE_BackPack_ACR_FL",
        "ACE_BackPack_ACR_TT",
        "ACE_Backpack_FL",
        "ACE_Backpack_TT",
        "ACE_Backpack_US",
        "ACE_Combat_Pack",
        "ACE_Coyote_Pack",
        "ACE_Coyote_Pack_Black",
        "ACE_FAST_PackEDC",
        "ACE_FAST_PackEDC_ACU",
        "ACE_CharliePack",
        "ACE_CharliePack_ACU",
        "ACE_CharliePack_ACU_Medic",
        "ACE_CharliePack_WMARPAT"
];

while {alive ruckBox} do {

    {deleteVehicle _x} foreach nearestObjects [position ruckBox,["WeaponHolder"],100];

    clearWeaponCargo ruckBox;

    {
      ruckBox addWeaponCargo [_x, 7];
    } foreach _weapons;
    
    // restock time.
    sleep 3600;
};
