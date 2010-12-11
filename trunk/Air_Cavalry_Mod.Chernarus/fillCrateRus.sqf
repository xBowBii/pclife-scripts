if (isServer) then {
	_ruspoint = _this select 0;
	rusEra = random 3;
	rusEra = ceil rusEra;
	ammoCrateRus = createVehicle ["RUVehicleBox", getMarkerPos _ruspoint, [], 0, "FORM"];
	publicVariable "ammoCrateRus";
	publicVariable "rusEra";
	player sidechat format["Rus era = %1",rusEra];
};

clearWeaponCargo ammoCrateRus;
clearMagazineCargo ammoCrateRus;

switch (rusEra) do
{
	case 1:
	{
		ammoCrateRus addWeaponCargo ["ACE_AKM",5];
		ammoCrateRus addWeaponCargo ["ACE_AKMS",5];
		ammoCrateRus addWeaponCargo ["ACE_AKM_GL",5];
		ammoCrateRus addWeaponCargo ["AK_74",5];
		ammoCrateRus addWeaponCargo ["AKS_74",5];
		ammoCrateRus addWeaponCargo ["AKS_74_U",5];
		ammoCrateRus addWeaponCargo ["AKS_74_pso",5];
		ammoCrateRus addWeaponCargo ["AKS_74_kobra",5];
		ammoCrateRus addWeaponCargo ["AK_74_GL",5];
		ammoCrateRus addWeaponCargo ["PK",2];
		ammoCrateRus addWeaponCargo ["ACE_RPK",5];
		ammoCrateRus addWeaponCargo ["RPK_74",5];
		ammoCrateRus addWeaponCargo ["SVD",2];
	};
	case 2:
	{
		ammoCrateRus addWeaponCargo ["ACE_Val_Kobra",5];
		ammoCrateRus addWeaponCargo ["VSS_vintorez",2];
		ammoCrateRus addWeaponCargo ["ACE_AK74M",5];
		ammoCrateRus addWeaponCargo ["ACE_AK74M_GL",5];
		ammoCrateRus addWeaponCargo ["ACE_AK74M_GL_PSO",5];
		ammoCrateRus addWeaponCargo ["ACE_AKS74P_PSO",5];
		ammoCrateRus addWeaponCargo ["ACE_AKS74P_GL_Kobra",5];
		ammoCrateRus addWeaponCargo ["ACE_AKS74P_1P29",5];
		ammoCrateRus addWeaponCargo ["ACE_AK74M_Kobra",5];
		ammoCrateRus addWeaponCargo ["ACE_oc14gl",5];
		ammoCrateRus addWeaponCargo ["ACE_gr1",5];
		ammoCrateRus addWeaponCargo ["ACE_AK74M_GL_1P29",5];
		ammoCrateRus addWeaponCargo ["ACE_SVD_Bipod",2];
		ammoCrateRus addWeaponCargo ["ACE_RPK74M_1P29",2];
		ammoCrateRus addWeaponCargo ["ACE_RPK74M",2];
		ammoCrateRus addWeaponCargo ["Saiga12K", 5];

		ammoCrateRus addMagazineCargo ["20Rnd_9x39_SP5_VSS",30];
		ammoCrateRus addMagazineCargo ["ACE_20Rnd_9x39_B_OC14",50];
		ammoCrateRus addMagazineCargo ["8Rnd_B_Saiga12_74Slug",60];
	};
	case 3:
	{
		ammoCrateRus addWeaponCargo ["ACE_Val_PSO",5];
		ammoCrateRus addWeaponCargo ["KSVK",2];
		ammoCrateRus addWeaponCargo ["Pecheneg",2];
		ammoCrateRus addWeaponCargo ["ACE_oc14sp",5];
		ammoCrateRus addWeaponCargo ["ACE_gr1sp",5];
		ammoCrateRus addWeaponCargo ["ACE_AK104",5];
		ammoCrateRus addWeaponCargo ["ACE_AK104_1P29",5];
		ammoCrateRus addWeaponCargo ["ACE_AK105_Kobra",5];
		ammoCrateRus addWeaponCargo ["ACE_AK105",5];
		ammoCrateRus addWeaponCargo ["ACE_AK105_1P29",5];
		ammoCrateRus addWeaponCargo ["ACE_AK104_Kobra",5];
		ammoCrateRus addWeaponCargo ["ACE_AK103",5];
		ammoCrateRus addWeaponCargo ["ACE_AK103_1P29",5];
		ammoCrateRus addWeaponCargo ["ACE_AK103_GL_Kobra",5];
		ammoCrateRus addWeaponCargo ["ACE_AK103_GL_PSO",5];
		ammoCrateRus addWeaponCargo ["ACE_AK103_Kobra",5];
		ammoCrateRus addWeaponCargo ["AK_107_GL_kobra",5];
		ammoCrateRus addWeaponCargo ["AK_107_GL_pso",5];
		ammoCrateRus addWeaponCargo ["AK_107_pso",5];
		ammoCrateRus addWeaponCargo ["ACE_AK103_PSO",5];
		ammoCrateRus addWeaponCargo ["ACE_SVD_Bipod",2];
		ammoCrateRus addWeaponCargo ["ACE_RPK74M_1P29",2];
		ammoCrateRus addWeaponCargo ["Saiga12K", 5];

		ammoCrateRus addMagazineCargo ["8Rnd_B_Saiga12_Pellets",60];
		ammoCrateRus addMagazineCargo ["20Rnd_9x39_SP5_VSS",40];
		ammoCrateRus addMagazineCargo ["5Rnd_127x108_KSVK",20];
		ammoCrateRus addMagazineCargo ["ACE_20Rnd_9x39_B_OC14",60];
	};
};

ammoCrateRus addWeaponCargo ["ACE_APS",5];
ammoCrateRus addWeaponCargo ["ACE_TT",5];

ammoCrateRus addWeaponCargo ["Binocular",10];
ammoCrateRus addWeaponCargo ["ACE_Earplugs",10];
ammoCrateRus addWeaponCargo ["ACE_GlassesLHD_glasses",10];
ammoCrateRus addWeaponCargo ["ACE_GlassesTactical",10];
ammoCrateRus addWeaponCargo ["ACE_Rucksack_RD90",10];

ammoCrateRus addMagazineCargo ["ACE_20Rnd_9x18_APS",60];
ammoCrateRus addMagazineCargo ["ACE_8Rnd_762x25_B_Tokarev",60];

ammoCrateRus addMagazineCargo ["ACE_30Rnd_762x39_S_AK47",60];
ammoCrateRus addMagazineCargo ["ACE_75Rnd_762x39_B_AK47",60];
ammoCrateRus addMagazineCargo ["ACE_30Rnd_762x39_T_AK47",60];
ammoCrateRus addMagazineCargo ["ACE_30Rnd_545x39_S_AK",60];
ammoCrateRus addMagazineCargo ["ACE_30Rnd_545x39_T_AK",60];
ammoCrateRus addMagazineCargo ["ACE_75Rnd_545x39_S_RPK",60];
ammoCrateRus addMagazineCargo ["ACE_75Rnd_545x39_T_RPK",60];
ammoCrateRus addMagazineCargo ["10Rnd_762x54_SVD",30];
ammoCrateRus addMagazineCargo ["ACE_10Rnd_762x54_T_SVD",30];
ammoCrateRus addMagazineCargo ["100Rnd_762x54_PK",40];

ammoCrateRus addMagazineCargo ["ACE_1Rnd_HE_GP25P",20];
ammoCrateRus addMagazineCargo ["1Rnd_HE_GP25",20];
ammoCrateRus addMagazineCargo ["1Rnd_SmokeRed_GP25",20];
ammoCrateRus addMagazineCargo ["HandGrenade_West", 50];
ammoCrateRus addMagazinecargo ["SmokeShell", 10];
ammoCrateRus addMagazinecargo ["SmokeShellBlue", 10];
ammoCrateRus addMagazinecargo ["SmokeShellGreen", 10];
ammoCrateRus addMagazinecargo ["SmokeShellOrange", 10];
ammoCrateRus addMagazinecargo ["SmokeShellPurple", 10];
ammoCrateRus addMagazinecargo ["SmokeShellRed", 10];
ammoCrateRus addMagazinecargo ["SmokeShellYellow", 10];