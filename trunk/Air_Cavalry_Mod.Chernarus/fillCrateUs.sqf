if (isServer) then {
	_uspoint = _this select 0;
	usEra = random 3;
	usEra = ceil usEra;
	ammoCrateUs = createVehicle ["USVehicleBox", getMarkerPos _uspoint, [], 0, "FORM"];
	publicVariable "ammoCrateUs";
	publicVariable "usEra";
	player sidechat format["Us era = %1",usEra];
};

clearWeaponCargo ammoCrateUs;
clearMagazineCargo ammoCrateUs;

switch (usEra) do
{
	case 1:
	{
		ammoCrateUs addWeaponCargo ["M16A2",5];
		ammoCrateUs addWeaponCargo ["ACE_M16A4_Iron",5];
		ammoCrateUs addWeaponCargo ["ACE_m16a2_scope",5];
		ammoCrateUs addWeaponCargo ["ACE_M16A2GL_UP",5];
		ammoCrateUs addWeaponCargo ["ACE_M16A4_GL_UP",5];
		ammoCrateUs addWeaponCargo ["M24",2];
		ammoCrateUs addWeaponCargo ["M14_EP1",5];
		ammoCrateUs addWeaponCargo ["ACE_M4",5];
		ammoCrateUs addWeaponCargo ["ACE_M4_Aim",5];
		ammoCrateUs addWeaponCargo ["ACE_M4_GL_UP",5];
		ammoCrateUs addWeaponCargo ["M240",2];
		ammoCrateUs addWeaponCargo ["M249",2];
		ammoCrateUs addWeaponCargo ["ACE_M60",2];

		ammoCrateUs addMagazineCargo ["5Rnd_762x51_M24",30];
		ammoCrateUs addMagazineCargo ["ACE_5Rnd_762x51_T_M24",20];
		ammoCrateUs addMagazineCargo ["20Rnd_762x51_DMR",60];
		ammoCrateUs addMagazineCargo ["ACE_20Rnd_762x51_T_DMR",60];
	};
	case 2:
	{

		ammoCrateUs addWeaponCargo ["ACE_m16a2gl_scope_UP",5];
		ammoCrateUs addWeaponCargo ["m16a4",5];
		ammoCrateUs addWeaponCargo ["ACE_M16A4_ACG_GL_UP",5];
		ammoCrateUs addWeaponCargo ["ACE_M16A4_CCO_GL_UP",5];
		ammoCrateUs addWeaponCargo ["M40A3",2];
		ammoCrateUs addWeaponCargo ["ACE_M4_ACOG",5];
		ammoCrateUs addWeaponCargo ["ACE_M4_AIM_GL_UP",5];
		ammoCrateUs addWeaponCargo ["ACE_SOC_M4A1",5];
		ammoCrateUs addWeaponCargo ["ACE_M4_Eotech",5];
		ammoCrateUs addWeaponCargo ["ACE_G36K_EOTech",5];
		ammoCrateUs addWeaponCargo ["ACE_G36K_iron",5];
		ammoCrateUs addWeaponCargo ["ACE_M249Para_M145",2];
		ammoCrateUs addWeaponCargo ["M60A4_EP1",2];
		ammoCrateUs addWeaponCargo ["ACE_M1014_Eotech", 5];
		ammoCrateUs addWeaponCargo ["M4SPR", 2];

		ammoCrateUs addMagazineCargo ["8Rnd_B_Beneli_74Slug",60];
		ammoCrateUs addMagazineCargo ["5Rnd_762x51_M24",20];
		ammoCrateUs addMagazineCargo ["ACE_5Rnd_762x51_T_M24",20];
	};
	case 3:
	{
		ammoCrateUs addWeaponCargo ["ACE_SOC_M4A1_Eotech",5];
		ammoCrateUs addWeaponCargo ["ACE_SOC_M4A1_Eotech_4x",5];
		ammoCrateUs addWeaponCargo ["ACE_SOC_M4A1_RCO_GL_UP",5];
		ammoCrateUs addWeaponCargo ["DMR",2];
		ammoCrateUs addWeaponCargo ["ACE_SOC_M4A1_SHORTDOT",5];
		ammoCrateUs addWeaponCargo ["ACE_TAC50",2];
		ammoCrateUs addWeaponCargo ["ACE_G36A2_Bipod",5];
		ammoCrateUs addWeaponCargo ["ACE_G36K",5];
		ammoCrateUs addWeaponCargo ["M249_m145_EP1",2];
		ammoCrateUs addWeaponCargo ["ACE_M240G_M145",5];
		ammoCrateUs addWeaponCargo ["ACE_HK416_D10",5];
		ammoCrateUs addWeaponCargo ["ACE_HK416_D10_AIM",5];
		ammoCrateUs addWeaponCargo ["ACE_HK416_D14",5];
		ammoCrateUs addWeaponCargo ["ACE_HK416_D14_COMPM3",5];
		ammoCrateUs addWeaponCargo ["ACE_HK416_D14_COMPM3_M320_UP",5];
		ammoCrateUs addWeaponCargo ["ACE_HK417_Shortdot",5];
		ammoCrateUs addWeaponCargo ["ACE_HK417_micro",5];
		ammoCrateUs addWeaponCargo ["ACE_HK417_Eotech_4x",5];
		ammoCrateUs addWeaponCargo ["ACE_M1014_Eotech", 5];

		ammoCrateUs addMagazineCargo ["ACE_5Rnd_127x99_B_TAC50",20];
		ammoCrateUs addMagazineCargo ["ACE_5Rnd_127x99_T_TAC50",20];
		ammoCrateUs addMagazineCargo ["20Rnd_762x51_DMR",30];
		ammoCrateUs addMagazineCargo ["ACE_20Rnd_762x51_T_DMR",60];
		ammoCrateUs addMagazineCargo ["ACE_20Rnd_762x51_B_HK417",60];
		ammoCrateUs addMagazineCargo ["ACE_20Rnd_762x51_SB_HK417",60];
		ammoCrateUs addMagazineCargo ["8Rnd_B_Beneli_Pellets",60];

		ammoCrateUs addWeaponCargo ["ACE_YardAge450",2];
		ammoCrateUs addWeaponCargo ["ACE_Rangefinder_OD",2];
		ammoCrateUs addMagazineCargo ["ACE_Battery_Rangefinder",10];
	};
};

ammoCrateUs addWeaponCargo ["ACE_USP",5];
ammoCrateUs addWeaponCargo ["ACE_P226",5];
ammoCrateUs addWeaponCargo ["ACE_P8",5];
ammoCrateUs addWeaponCargo ["ACE_Glock18",5];
ammoCrateUs addWeaponCargo ["ACE_Glock17",5];
ammoCrateUs addWeaponCargo ["M9",5];
ammoCrateUs addWeaponCargo ["Colt1911",5];


ammoCrateUs addWeaponCargo ["Binocular",10];
ammoCrateUs addWeaponCargo ["ACE_Earplugs",10];
ammoCrateUs addWeaponCargo ["ACE_GlassesLHD_glasses",10];
ammoCrateUs addWeaponCargo ["ACE_GlassesTactical",10];
ammoCrateUs addWeaponCargo ["ACE_Rucksack_MOLLE_Brown",10];
ammoCrateUs addweaponcargo ["ACE_M122TripodProxy", 1];

ammoCrateUs addMagazineCargo ["ACE_12Rnd_45ACP_USP",60];
ammoCrateUs addMagazineCargo ["ACE_15Rnd_9x19_P226",60];
ammoCrateUs addMagazineCargo ["ACE_15Rnd_9x19_P8",60];
ammoCrateUs addMagazineCargo ["17Rnd_9x19_glock17",60];
ammoCrateUs addMagazineCargo ["ACE_33Rnd_9x19_G18",60];
ammoCrateUs addMagazineCargo ["15Rnd_9x19_M9",60];
ammoCrateUs addMagazineCargo ["7Rnd_45ACP_1911",60];

ammoCrateUs addMagazineCargo ["30Rnd_556x45_Stanag",60];
//ammoCrateUs addMagazineCargo ["ACE_30Rnd_556x45_S_Stanag",60];
ammoCrateUs addMagazineCargo ["100Rnd_762x51_M240",60];
ammoCrateUs addMagazineCargo ["ACE_30Rnd_556x45_S_G36",60];
ammoCrateUs addMagazineCargo ["200Rnd_556x45_M249",60];
ammoCrateUs addMagazineCargo ["ACE_200Rnd_556x45_T_M249",60];
ammoCrateUs addMagazineCargo ["ACE_100Rnd_556x45_T_M249",60];

ammoCrateUs addMagazineCargo ["1Rnd_HE_M203",20];
ammoCrateUs addMagazineCargo ["1Rnd_SmokeRed_M203",20];
ammoCrateUs addMagazineCargo ["HandGrenade_West", 50];
ammoCrateUs addMagazinecargo ["SmokeShell", 10];
ammoCrateUs addMagazinecargo ["SmokeShellBlue", 10];
ammoCrateUs addMagazinecargo ["SmokeShellGreen", 10];
ammoCrateUs addMagazinecargo ["SmokeShellOrange", 10];
ammoCrateUs addMagazinecargo ["SmokeShellPurple", 10];
ammoCrateUs addMagazinecargo ["SmokeShellRed", 10];
ammoCrateUs addMagazinecargo ["SmokeShellYellow", 10];