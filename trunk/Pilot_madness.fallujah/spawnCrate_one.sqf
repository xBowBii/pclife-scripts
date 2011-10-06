if (isServer) then {
	_point = _this select 0;
	ammoCrate = createVehicle ["ACE_WeaponBox_BIS_US", getMarkerPos _point, [], 0, "FORM"];
	value_stanag = random 50;
	value_stanag_sd = random 30;
	value_pdw = random 30;
	value_ump45 = random 30;
	value_g36 = random 30;
	value_g36sd = random 30;
	value_uspsd = random 20;
	value_grenade = random 10;
	value_smoke = random 10;
	publicVariable "value_smoke";
	publicVariable "value_grenade";
	publicVariable "value_uspsd";
	publicVariable "value_g36sd";
	publicVariable "value_g36";
	publicVariable "value_ump45";
	publicVariable "value_pdw";
	publicVariable "value_stanag_sd";
	publicVariable "value_stanag";
	publicVariable "ammoCrate";
};

clearWeaponCargo ammoCrate;
clearMagazineCargo ammoCrate;

ammoCrate addWeaponCargo ["M4A1_Aim",2];
ammoCrate addWeaponCargo ["M4A1",2];
ammoCrate addWeaponCargo ["M4A1_AIM_SD_camo",2];
ammoCrate addWeaponCargo ["M4A3_CCO_EP1",2];
ammoCrate addWeaponCargo ["ACE_SOC_M4A1",2];
ammoCrate addWeaponCargo ["ACE_SOC_M4A1_SD_9",2];
ammoCrate addWeaponCargo ["ACE_M4_Eotech",2];
ammoCrate addWeaponCargo ["ACE_KAC_PDW",2];
ammoCrate addWeaponCargo ["ACE_UMP45_SD",1];
ammoCrate addWeaponCargo ["G36C",1];
ammoCrate addWeaponCargo ["G36_C_SD_camo",1];
ammoCrate addWeaponCargo ["ACE_USPSD",2];
ammoCrate addWeaponCargo ["M136",2];

ammoCrate addMagazineCargo ["ACE_30Rnd_556x45_S_Stanag",ceil value_stanag];
ammoCrate addMagazineCargo ["30Rnd_556x45_StanagSD",ceil value_stanag_sd];
ammoCrate addMagazineCargo ["ACE_30Rnd_6x35_B_PDW",ceil value_pdw];
ammoCrate addMagazineCargo ["ACE_25Rnd_1143x23_S_UMP45",ceil value_ump45];
ammoCrate addMagazineCargo ["ACE_30Rnd_556x45_S_G36",ceil value_g36];
ammoCrate addMagazineCargo ["30Rnd_556x45_G36SD",ceil value_g36sd];
ammoCrate addMagazineCargo ["ACE_12Rnd_45ACP_USPSD",ceil value_uspsd];
ammoCrate addWeaponCargo ["ACE_Rucksack_MOLLE_ACU",1];

ammoCrate addWeaponCargo ["Binocular",3];
ammoCrate addWeaponCargo ["ACE_Earplugs",3];
ammoCrate addWeaponCargo ["ACE_GlassesLHD_glasses",3];
ammoCrate addWeaponCargo ["ACE_GlassesSpecial",3];
ammoCrate addWeaponCargo ["ACE_GlassesTactical",3];

ammoCrate addMagazineCargo ["HandGrenade_West", ceil value_grenade];
ammoCrate addMagazineCargo ["SmokeShell", ceil value_smoke];
ammoCrate addMagazineCargo ["ACE_Claymore_M", 2];
