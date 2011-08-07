// by Bon_Inf*


_cache = _this select 0;



_weapons = [
        "ACE_SKS",
        "ACE_AKM",
        "ACE_AKM_GL",
        "ACE_AKMS",
        "ACE_AKMS_SD",
        
        "ACE_AK74M",
        "ACE_AK74M_1P29",
        "ACE_AK74M_GL",
        "ACE_AK74M_GL_1P29",
        "ACE_AK74M_GL_Kobra",
        "ACE_AK74M_PSO",
        "ACE_AK74M_Kobra",
        "ACE_AK74M_TWS",
        "ACE_AK74M_NSPU",
        "ACE_AK74M_GL_PSO",
        "ACE_AK74M_GL_TWS",
        "ACE_AK74M_GL_NSPU",
        "ACE_AK74M_SD",
        "ACE_AK74M_SD_Kobra",
        "ACE_AK74M_SD_PSO",
        "ACE_AK74M_SD_TWS",
        "ACE_AK74M_SD_NSPU",
        "AKS_74_U",
                
        "ACE_AKS74_GP25",
        "ACE_AKS74P",
        "ACE_AKS74P_1P29",
        "ACE_AKS74P_GL",
        "ACE_AKS74P_GL_1P29",
        "ACE_AKS74P_GL_Kobra",
        "ACE_AKS74P_GL_PSO",
        "ACE_AKS74P_Kobra",
        "ACE_AKS74P_PSO",
        "ACE_AK103",
        "ACE_AK103_1P29",
        "ACE_AK103_GL",
        "ACE_AK103_GL_1P29",
        "ACE_AK103_GL_Kobra",
        "ACE_AK103_GL_PSO",
        "ACE_AK103_Kobra",
        "ACE_AK103_PSO",
        "ACE_AK104",
        "ACE_AK104_1P29",
        "ACE_AK104_Kobra",
        "ACE_AK104_PSO",
        "ACE_AK105",
        "ACE_AK105_1P29",
        "ACE_AK105_Kobra",
        "ACE_AK105_PSO",
        
        "AK_107_GL_kobra",
        "AK_107_GL_pso",
        "AK_107_kobra",
        "AK_107_pso",
        
        "ACE_gr1",
        "ACE_gr1sd",
        "ACE_gr1sdsp",
        "ACE_gr1sp",        
        "ACE_oc14",
        "ACE_oc14gl",
        "ACE_oc14glsp",
        "ACE_oc14sd",
        "ACE_oc14sdsp",
        "ACE_oc14sp",
        "ACE_Val_Kobra",
        "ACE_Val_PSO",
//WEST
        "ACE_G36A1_AG36A1_D_UP",
        "ACE_G36A1_AG36A1_UP",
        "ACE_G36A2",
        "ACE_G36A2_Bipod",
        "ACE_G36A2_Bipod_D",
        "ACE_G36A2_D",
        "ACE_G36K_EOTech",
        "ACE_G36K_EOTech_D",
        "G36C_camo",
        "G36_C_SD_eotech",
 
        "ACE_G3A3",
        "ACE_G3A3_RSAS",
        
        "Sa58V_EP1",
        "Sa58V_RCO_EP1",
        "Sa58V_CCO_EP1",
        "ACE_HK416_D10",
        "ACE_HK416_D10_AIM",
        "ACE_HK416_D10_COMPM3",
        "ACE_HK416_D10_COMPM3_SD",
        "ACE_HK416_D10_Holo",
        "ACE_HK416_D10_M320",
        "ACE_HK416_D10_M320_UP",
        "ACE_HK416_D10_SD",
        "ACE_HK416_D14",
        "ACE_HK416_D14_ACOG_PVS14",
        "ACE_HK416_D14_COMPM3",
        "ACE_HK416_D14_COMPM3_M320",
        "ACE_HK416_D14_COMPM3_M320_UP",
        "ACE_HK416_D14_SD",
        "ACE_HK416_D14_TWS",
        "ACE_HK417_Eotech_4x",
        "ACE_HK417_leupold",
        "ACE_HK417_micro",
        "ACE_HK417_Shortdot",
        "M14_EP1",
        "ACE_M14_ACOG",
        
        "Saiga12K",
        "ACE_M1014_Eotech",
        "ACE_SPAS12",
        "ACE_m16a2_scope",
        "ACE_m16a2gl_scope_UP",
        "ACE_M16A2GL_UP",
        "ACE_M16A4_ACG_GL_UP",
        "ACE_M16A4_CCO_GL_UP",        
        "ACE_M16A4_GL_UP",
        "ACE_M16A4_Iron",
        "ACE_M27_IAR",
        "ACE_M27_IAR_ACOG",
        "ACE_M4",
        "ACE_M4_ACOG",
        "ACE_M4_Aim",
        "ACE_M4_AIM_GL_UP",
        "ACE_M4_Eotech",
        "ACE_M4_GL_UP",
        "ACE_M4_RCO_GL_UP",
        "ACE_M4A1_ACOG",
        "ACE_M4A1_ACOG_SD",
        "ACE_M4A1_AIM_GL_SD_UP",
        "ACE_M4A1_AIM_GL_UP",
        "ACE_M4A1_Aim_SD",
        "ACE_M4A1_Eotech",
        "ACE_M4A1_GL_SD_UP",
        "ACE_M4A1_GL_UP",
        "ACE_M4A1_RCO2_GL_UP",
        "ACE_M4A1_RCO_GL",
        
        "M4A3_RCO_GL_EP1",
        "M4A3_CCO_EP1",
        "ACE_SOC_M4A1_Aim",
        "ACE_SOC_M4A1_AIM_SD",
        "ACE_SOC_M4A1_Eotech",
        "ACE_SOC_M4A1_Eotech_4x",
        "ACE_SOC_M4A1_GL",
        "ACE_SOC_M4A1_GL_13",
        "ACE_SOC_M4A1_GL_AIMPOINT",
        "ACE_SOC_M4A1_GL_EOTECH",
        "ACE_SOC_M4A1_GL_SD_UP",
        "ACE_SOC_M4A1_GL_UP",
        "ACE_SOC_M4A1_RCO_GL_UP",
        "ACE_SOC_M4A1_SD_9",
        "ACE_SOC_M4A1_SHORTDOT",
        "ACE_SOC_M4A1_SHORTDOT_SD",
        "ACE_SOC_M4A1_TWS",
        "ACE_SCAR_H_STD_Spect",
        "SCAR_L_CQC_CCO_SD",
        "SCAR_L_CQC",
        "SCAR_L_CQC_Holo",
        "SCAR_L_CQC_EGLM_Holo",
        "SCAR_L_STD_EGLM_RCO",
        "SCAR_L_STD_EGLM_TWS",
        "SCAR_L_STD_HOLO",
        "SCAR_L_STD_Mk4CQT",
        "SCAR_H_CQC_CCO",
        "SCAR_H_CQC_CCO_SD",
        "SCAR_H_STD_EGLM_Spect",
        "SCAR_H_STD_TWS_SD"
];


_magazines = [
        "8Rnd_B_Beneli_74Slug",
        "8Rnd_B_Saiga12_74Slug",
        "8Rnd_B_Saiga12_Pellets",
        
        //east
        "20Rnd_9x39_SP5_VSS",
        "30Rnd_545x39_AK",
        "30Rnd_545x39_AKSD",
        "ACE_30Rnd_545x39_T_AK",
        "30Rnd_762x39_AK47",
        "ACE_30Rnd_762x39_T_AK47",
        "ACE_30Rnd_762x39_SD_AK47",
        "ACE_10Rnd_762x39_B_SKS",
        "ACE_20Rnd_9x39_B_OC14",
        "1Rnd_SMOKE_GP25",
        "1Rnd_HE_GP25",
        "ACE_1Rnd_HE_GP25P",
        "1Rnd_Smoke_GP25",
        "1Rnd_SmokeRed_GP25",
        "ACE_SSRed_GP25",
        "ACE_SSWhite_GP25",
        
        //west
        "20Rnd_556x45_Stanag",
        "30Rnd_556x45_Stanag",
        "ACE_30Rnd_556x45_T_Stanag",
        "30Rnd_556x45_StanagSD",
        "ACE_30Rnd_556x45_SB_Stanag",
        "100Rnd_556x45_BetaCMag",
        "30Rnd_556x45_G36",
        "ACE_30Rnd_556x45_T_G36",
        "30Rnd_556x45_G36SD",
        "30Rnd_762x39_SA58",
        "20Rnd_762x51_B_SCAR",
        "ACE_20Rnd_762x51_S_SCAR",
        "ACE_20Rnd_762x51_SB_SCAR",
        "ACE_20Rnd_762x51_SB_S_SCAR",
        "ACE_20Rnd_762x51_B_G3",
        "20Rnd_762x51_DMR",
        "ACE_20Rnd_762x51_T_DMR",
        "ACE_20Rnd_762x51_B_HK417",
        "ACE_20Rnd_762x51_SB_HK417",
        "ACE_20Rnd_762x51_T_HK417",
        "ACE_1Rnd_HE_M203",
        "1Rnd_Smoke_M203",
        "1Rnd_SmokeRed_M203",
        "ACE_SSRed_M203",
        "ACE_SSWhite_M203"
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