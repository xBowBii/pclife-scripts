if (isServer) then {
	_point = _this select 0;
	ammoCrate2 = createVehicle ["ACE_WeaponBox_BIS_US", getMarkerPos _point, [], 0, "FORM"];
	twovalue_stanag = random 50;
	twovalue_stanag_sd = random 50;
	twovalue_g36 = random 30;
	twovalue_g36sd = random 30;
	twovalue_mk48 = random 20;
	twovalue_m14 = random 40;
	twovalue_hk417 = random 30;
	twovalue_grenade = random 10;
	twovalue_smoke = random 10;
	publicVariable "twovalue_smoke";
	publicVariable "twovalue_grenade";
	publicVariable "twovalue_hk417";
	publicVariable "twovalue_m14";
	publicVariable "twovalue_mk48";
	publicVariable "twovalue_g36sd";
	publicVariable "twovalue_g36";
	publicVariable "twovalue_stanag_sd";
	publicVariable "twovalue_stanag";
	publicVariable "ammoCrate2";
};

clearWeaponCargo ammoCrate2;
clearMagazineCargo ammoCrate2;

ammoCrate2 addWeaponCargo ["M14_EP1",1];
ammoCrate2 addWeaponCargo ["ACE_M16A4_Iron",2];
ammoCrate2 addWeaponCargo ["m16a4",2];
ammoCrate2 addWeaponCargo ["G36K",1];
ammoCrate2 addWeaponCargo ["ACE_G36A2_Bipod_D",1];
ammoCrate2 addWeaponCargo ["ACE_HK416_D10_COMPM3_SD",2];
ammoCrate2 addWeaponCargo ["ACE_HK416_D10_Holo",2];
ammoCrate2 addWeaponCargo ["ACE_HK416_D10_M320_UP",2];
ammoCrate2 addWeaponCargo ["ACE_HK416_D14_COMPM3",2];
ammoCrate2 addWeaponCargo ["M16A4_ACG",1];
ammoCrate2 addWeaponCargo ["ACE_M27_IAR",2];
ammoCrate2 addWeaponCargo ["ACE_M27_IAR_ACOG",1];
ammoCrate2 addWeaponCargo ["Mk_48_DES_EP1",1];
ammoCrate2 addWeaponCargo ["ACE_HK417_micro",2];
ammoCrate2 addWeaponCargo ["M136",2];

ammoCrate2 addMagazineCargo ["ACE_30Rnd_556x45_S_Stanag",ceil twovalue_stanag];
ammoCrate2 addMagazineCargo ["30Rnd_556x45_StanagSD",ceil twovalue_stanag_sd];
ammoCrate2 addMagazineCargo ["ACE_30Rnd_556x45_S_G36",ceil twovalue_g36];
ammoCrate2 addMagazineCargo ["30Rnd_556x45_G36SD",ceil twovalue_g36sd];
ammoCrate2 addMagazineCargo ["100Rnd_762x51_M240", ceil twovalue_mk48];
ammoCrate2 addMagazineCargo ["20Rnd_762x51_DMR", ceil twovalue_m14];
ammoCrate2 addMagazineCargo ["ACE_20Rnd_762x51_SB_HK417", ceil twovalue_hk417];
ammoCrate2 addWeaponCargo ["ACE_Rucksack_MOLLE_ACU",3];

ammoCrate2 addWeaponCargo ["Binocular",3];
ammoCrate2 addWeaponCargo ["ACE_Earplugs",3];
ammoCrate2 addWeaponCargo ["ACE_GlassesLHD_glasses",3];
ammoCrate2 addWeaponCargo ["ACE_GlassesSpecial",3];
ammoCrate2 addWeaponCargo ["ACE_GlassesTactical",3];

ammoCrate2 addMagazineCargo ["HandGrenade_West", ceil twovalue_grenade];
ammoCrate2 addMagazineCargo ["SmokeShell", ceil twovalue_smoke];
