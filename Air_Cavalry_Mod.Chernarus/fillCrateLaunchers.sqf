if (isServer) then {
	_laupoint = _this select 0;
	ammoCrateLaunchers = createVehicle ["USVehicleBox", getMarkerPos _laupoint, [], 0, "FORM"];
	publicVariable "ammoCrateLaunchers";
};

clearWeaponCargo ammoCrateLaunchers;
clearMagazineCargo ammoCrateLaunchers;


ammoCrateLaunchers addWeaponCargo ["RPG7V",5];
ammoCrateLaunchers addWeaponCargo ["ACE_RPG7V_PGO7",5];
ammoCrateLaunchers addWeaponCargo ["ACE_RPG27",10];

ammoCrateLaunchers addWeaponCargo ["ACE_RPOM",10];
ammoCrateLaunchers addWeaponCargo ["SMAW",5];
ammoCrateLaunchers addWeaponCargo ["M136",10];
ammoCrateLaunchers addWeaponCargo ["ACE_M136_CSRS",10];

ammoCrateLaunchers addMagazineCargo ["ACE_SMAW_NE",10];
ammoCrateLaunchers addMagazineCargo ["SMAW_HEDP",10];
ammoCrateLaunchers addMagazineCargo ["SMAW_HEAA",10];
ammoCrateLaunchers addMagazineCargo ["ACE_OG7_PGO7",10];
ammoCrateLaunchers addMagazineCargo ["ACE_PG7V_PGO7",10];
ammoCrateLaunchers addMagazineCargo ["ACE_PG7VL_PGO7",10];
ammoCrateLaunchers addMagazineCargo ["ACE_PG7VR_PGO7",10];
ammoCrateLaunchers addMagazineCargo ["ACE_TBG7V_PGO7",10];

ammoCrateLaunchers addMagazineCargo ["OG7",10];
ammoCrateLaunchers addMagazineCargo ["PG7V",10];
ammoCrateLaunchers addMagazineCargo ["PG7VL",10];
ammoCrateLaunchers addMagazineCargo ["PG7VR",10];
ammoCrateLaunchers addMagazineCargo ["ACE_TBG7V",10];