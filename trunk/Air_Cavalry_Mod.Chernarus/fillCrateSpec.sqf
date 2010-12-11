if (isServer) then {
	_specpoint = _this select 0;
	specEra = random 3;
	specEra = ceil specEra;
	ammoCrateSpec = createVehicle ["USVehicleBox", getMarkerPos _specpoint, [], 0, "FORM"];
	publicVariable "ammoCrateSpec";
	publicVariable "specEra";
	player sidechat format["Spec era = %1",specEra];
};

clearWeaponCargo ammoCrateSpec;
clearMagazineCargo ammoCrateSpec;

waitUntil {specEra != 0};

switch (specEra) do
{
	case 1:
	{
		ammoCrateSpec addWeaponCargo ["ACE_MP5SD",5];
		ammoCrateSpec addWeaponCargo ["ACE_AKMS_SD",5];
		ammoCrateSpec addWeaponCargo ["ACE_M4A1_GL_SD_UP",5];
		ammoCrateSpec addWeaponCargo ["ACE_SOC_M4A1_GL_SD_UP",5];
		ammoCrateSpec addWeaponCargo ["ACE_M4A1_Aim_SD",5];
		ammoCrateSpec addWeaponCargo ["ACE_SOC_M4A1_SD_9",5];
		ammoCrateSpec addWeaponCargo ["M4A1_AIM_SD_camo",5];
		ammoCrateSpec addWeaponCargo ["ACE_M4SPR_SD",2];
		ammoCrateSpec addWeaponCargo ["AKS_74_UN_kobra",5];
	};
	case 2:
	{
		ammoCrateSpec addWeaponCargo ["ACE_Val_Kobra",5];
		ammoCrateSpec addWeaponCargo ["VSS_vintorez",2];
		ammoCrateSpec addWeaponCargo ["G36_C_SD_camo",5];
		ammoCrateSpec addWeaponCargo ["G36_C_SD_eotech",5];		
		ammoCrateSpec addWeaponCargo ["ACE_UMP45_SD",5];
		ammoCrateSpec addWeaponCargo ["ACE_HK416_D10_SD",5];
		ammoCrateSpec addWeaponCargo ["ACE_HK416_D14_SD",5];
		ammoCrateSpec addWeaponCargo ["ACE_M4A1_AIM_GL_SD_UP",5];
		ammoCrateSpec addWeaponCargo ["ACE_M4A1_ACOG_SD",5];
		ammoCrateSpec addWeaponCargo ["ACE_SOC_M4A1_AIM_SD",5];
		ammoCrateSpec addWeaponCargo ["ACE_oc14sd",5];
		ammoCrateSpec addWeaponCargo ["ACE_gr1sd",2];
		ammoCrateSpec addWeaponCargo ["ACE_M4SPR_SD",2];
		ammoCrateSpec addWeaponCargo ["ACE_M4SPR_SD",2];
		ammoCrateSpec addWeaponCargo ["ACE_Mk12mod1_SD",5];

		ammoCrateSpec addMagazineCargo ["20Rnd_9x39_SP5_VSS",40];
		ammoCrateSpec addMagazineCargo ["ACE_20Rnd_9x39_B_OC14",50];
	};
	case 3:
	{
		ammoCrateSpec addWeaponCargo ["ACE_Val_PSO",5];
		ammoCrateSpec addWeaponCargo ["ACE_M110_SD",2];
		ammoCrateSpec addWeaponCargo ["ACE_TAC50_SD",2];
		ammoCrateSpec addWeaponCargo ["ACE_gr1sdsp",5];
		ammoCrateSpec addWeaponCargo ["ACE_oc14sdsp",5];
		ammoCrateSpec addWeaponCargo ["ACE_SOC_M4A1_SHORTDOT_SD",5];
		ammoCrateSpec addWeaponCargo ["ACE_HK416_D10_COMPM3_SD",5];
		ammoCrateSpec addWeaponCargo ["M4A1_HWS_GL_SD_Camo",5];

		ammoCrateSpec addMagazineCargo ["20Rnd_9x39_SP5_VSS",50];
		ammoCrateSpec addMagazineCargo ["ACE_20Rnd_9x39_B_OC14",60];
		ammoCrateSpec addMagazineCargo ["ACE_5Rnd_127x99_S_TAC50",20];
	};
};

ammoCrateSpec addWeaponCargo ["ACE_USPSD",5];
ammoCrateSpec addWeaponCargo ["ACE_APSB",5];
ammoCrateSpec addWeaponCargo ["M9SD",5];

ammoCrateSpec addMagazineCargo ["15Rnd_9x19_M9SD",60];
ammoCrateSpec addMagazineCargo ["ACE_12Rnd_45ACP_USPSD",60];
ammoCrateSpec addMagazineCargo ["ACE_20Rnd_9x18_APSB",60];

ammoCrateSpec addMagazineCargo ["1Rnd_HE_M203",20];
ammoCrateSpec addMagazineCargo ["1Rnd_SmokeRed_M203",20];
ammoCrateSpec addMagazineCargo ["ACE_25Rnd_1143x23_S_UMP45",60];
ammoCrateSpec addMagazineCargo ["30Rnd_556x45_G36SD",60];
ammoCrateSpec addMagazineCargo ["30Rnd_556x45_StanagSD",60];
ammoCrateSpec addMagazineCargo ["ACE_30Rnd_762x39_SD_AK47",60];
ammoCrateSpec addMagazineCargo ["30Rnd_545x39_AKSD",60];
ammoCrateSpec addMagazineCargo ["ACE_20Rnd_762x51_S_M110",60];
ammoCrateSpec addMagazineCargo ["ACE_30Rnd_9x19_S_MP5",60];

sleep 1;