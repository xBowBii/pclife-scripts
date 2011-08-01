// by Bon_Inf*
/**
*
* You can easily change this version from BLUFOR to OPFOR by changing the types
* in the SIDES section, but don't forget then to replace the objects placed in
* the editor as well.
*
**/

tfor_arma2 = false; // add ArmA2 equipment
tfor_BAF = false;   // add BAF equipment
tfor_ACE = false;   // add ACE2 equipment
tfor_PMC = false;  // add PMC equipment

tfor_max_players = 14;

//Миссия
tfor_artifunds = 1;
tfor_maxnumber_airpatrols = 2;
tfor_maxnumber_footpatrols = 11;
tfor_maxnumber_camps = 10;
tfor_civilian_deathcosts = 2.0;
tfor_advanced_aircraft_list = ["Plane","AH1Z"];
tfor_advanced_vehicle_list = ["Tank"];

tfor_min_amount_armor = 0; // min amount enemy armor (1 player)
tfor_max_amount_armor = 3; // max amount enemy armor (max players)
tfor_min_amount_apc = 1;   // min amount enemy apc (1 player)
tfor_max_amount_apc = 3;   // max amount enemy apc (max players)
tfor_min_amount_car = 1;   // min amount enemy car (1 player)
tfor_max_amount_car = 4;   // max amount enemy car (max players)
tfor_min_amount_aa = 2;    // min amount enemy aa (1 player)
tfor_max_amount_aa = 4;    // max amount enemy aa (max players)
tfor_min_amount_inf = 3;   // min amount enemy inf (1 player), in groups; NOTE: MUST BE AT LEAST 2
tfor_max_amount_inf = 8;  // max amount enemy inf (max players), in groups
/*****/

/** Стороны **/
tfor_friendly_side = west;
tfor_enemy_side = east;

tfor_east_armor = ["T34_TK_EP1","T55_TK_EP1","T72_TK_EP1"];
tfor_east_apc = ["BMP2_TK_EP1","BRDM2_TK_EP1","BRDM2_ATGM_TK_EP1","BTR60_TK_EP1","M113_TK_EP1"];
tfor_east_aa = ["ZSU_TK_EP1","Ural_ZU23_TK_EP1"];
tfor_east_car = ["GRAD_TK_EP1","LandRover_MG_TK_EP1","LandRover_SPG9_TK_EP1","UAZ_AGS30_TK_EP1","UAZ_MG_TK_EP1"];
tfor_east_air = ["Mi17_TK_EP1","UH1H_TK_EP1","Mi24_D_TK_EP1"];

tfor_west_armor = ["M2A2_EP1","ACE_M1A1HC_TUSK_CSAMM_DESERT"];
tfor_west_apc = ["M1126_ICV_mk19_EP1","M1126_ICV_M2_EP1","M1128_MGS_EP1","M1135_ATGMV_EP1"];
tfor_west_aa = ["HMMWV_Avenger_DES_EP1"];
tfor_west_car = ["HMMWV_M1151_M2_DES_EP1","HMMWV_M998_crows_MK19_DES_EP1","HMMWV_TOW_DES_EP1","HMMWV_M998_crows_M2_DES_EP1","HMMWV_M998A2_SOV_DES_EP1","LandRover_Special_CZ_EP1"];
tfor_west_air = ["AH1Z","UH60M_EP1"];

// TK army
tfor_east_inf = ["TK_Soldier_AA_EP1","TK_Soldier_AAT_EP1","TK_Soldier_AMG_EP1",
		"TK_Soldier_HAT_EP1","TK_Soldier_AR_EP1","TK_Commander_EP1",
		"TK_Soldier_Engineer_EP1","TK_Soldier_GL_EP1","TK_Soldier_MG_EP1",
		"TK_Soldier_Medic_EP1","TK_Soldier_Officer_EP1","TK_Soldier_EP1",
		"TK_Soldier_B_EP1","TK_Soldier_LAT_EP1","TK_Soldier_AT_EP1",
		"TK_Soldier_Sniper_EP1","TK_Soldier_SniperH_EP1","TK_Soldier_Sniper_Night_EP1",
		"TK_Soldier_Night_1_EP1","TK_Soldier_Night_2_EP1","TK_Soldier_TWS_EP1",
		"TK_Soldier_Spotter_EP1","TK_Soldier_SL_EP1","TK_Special_Forces_MG_EP1",
		"TK_Special_Forces_EP1","TK_Special_Forces_TL_EP1"
];
// TK militia
tfor_east_militia = ["TK_INS_Soldier_AA_EP1","TK_INS_Soldier_AR_EP1","TK_INS_Bonesetter_EP1",
		"TK_INS_Soldier_MG_EP1","TK_INS_Soldier_2_EP1","TK_INS_Soldier_EP1",
		"TK_INS_Soldier_4_EP1","TK_INS_Soldier_3_EP1","TK_INS_Soldier_AAT_EP1",
		"TK_INS_Soldier_AT_EP1","TK_INS_Soldier_Sniper_EP1","TK_INS_Soldier_TL_EP1",
		"TK_INS_Warlord_EP1"
];
// US
tfor_west_inf = ["US_Soldier_AA_EP1","US_Soldier_AAT_EP1","US_Soldier_AHAT_EP1",
		"US_Soldier_AAR_EP1","US_Soldier_AMG_EP1","US_Soldier_AT_EP1",
		"US_Soldier_HAT_EP1","US_Soldier_AR_EP1","US_Soldier_Engineer_EP1",
		"US_Soldier_GL_EP1","US_Soldier_MG_EP1","US_Soldier_Marksman_EP1",
		"US_Soldier_Medic_EP1","US_Soldier_EP1","US_Soldier_LAT_EP1",
		"US_Soldier_B_EP1","US_Soldier_SL_EP1"
];
// US Spec Ops
tfor_west_special = ["US_Delta_Force_AR_EP1","US_Delta_Force_Air_Controller_EP1",
		"US_Delta_Force_MG_EP1","US_Delta_Force_Marksman_EP1",
		"US_Delta_Force_Medic_EP1","US_Delta_Force_EP1","US_Delta_Force_Assault_EP1",
		"US_Delta_Force_M14_EP1","US_Delta_Force_Night_EP1","US_Delta_Force_SD_EP1"
];
/****/

/*** Разное ***/
tfor_missiondelay = 600;

//tfor_artitype = "M119_US_EP1";

tfor_ammobox = "USVehicleBox_EP1"; // <- the thing at base

tfor_pilots = ["US_Soldier_Pilot_EP1","US_Pilot_Light_EP1","CZ_Soldier_Pilot_EP1","BAF_Pilot_MTP"];
tfor_crewmen = ["US_Soldier_Crew_EP1","BAF_crewman_MTP"];
tfor_sniper = ["US_Soldier_Sniper_EP1","CZ_Soldier_Sniper_EP1","BAF_Soldier_Sniper_MTP"];
tfor_commanders = ["US_Soldier_Officer_EP1","BAF_Soldier_Officer_MTP"];

tfor_choppers_can_lift = ["CH_47F_EP1","CH_47F_BAF"];
tfor_rallypoint_type = "Misc_Backpackheap_EP1";
tfor_mobileuavterminals = ["HMMWV_M1035_DES_EP1"];
tfor_vehicles_canload_ammo = ["MtvrReammo_DES_EP1","UH60M_EP1","BAF_Merlin_HC3_D"];
tfor_loadable_boxtype = "USBasicWeapons_EP1";

enableEngineArtillery false; // dis/en BIS art comp

// assets the commander can build;
// form: [type,category,costs];
// category can be either: Commandpost,Support,Defense
//tfor_commander_assets = [
	//["US_WarfareBUAVterminal_Base_EP1","Commandpost",1],
	//["US_WarfareBBarracks_Base_EP1","Support",1],
	//["US_WarfareBFieldhHospital_EP1","Support",1],
	//["US_WarfareBVehicleServicePoint_Base_EP1","Support",1],
	//["USVehicleBox_EP1","Support",1],
	//["Stinger_Pod_US_EP1","Defense",1]
//];
//tfor_commanderfunds = 1;

tfor_mhqtype = "M1133_MEV_EP1";
/******/

//// Missions////

/***captureofficer***/
tfor_captureofficer_officer = "TK_Aziz_EP1";
/******/

/***destroyfirebase***/
tfor_destroyfirebase_artitype = "D30_TK_INS_EP1"; // <- note: dyno firebase_0.sqf
/*****/

/***destroyradarscud***/
tfor_destroyradarscud_radartype = "Ins_WarfareBArtilleryRadar";
tfor_destroyradarscud_scudtype = "MAZ_543_SCUD_TK_EP1";
/******/

/***rescuepilot***/
tfor_rescuepilot_heliwreck = "UH60_wreck_EP1";
tfor_rescuepilot_pilottype = "US_Soldier_Pilot_EP1";
/******/

/***searchcache***/
tfor_searchcache_cachetype_outside = "TKBasicWeapons_EP1";
tfor_searchcache_cachetype_inside = "TKBasicAmmunitionBox_EP1";
/******/

/***stopconvoy***/
tfor_stopconvoy_vehicle_1 = "UralRepair_TK_EP1";
tfor_stopconvoy_vehicle_2 = "ZSU_TK_EP1";
/******/

/***bringtruck***/
tfor_bringtruck_truck = "MtvrReammo_DES_EP1";
/******/

/***bringmev***/
tfor_bringmev_ambulance = "HMMWV_Ambulance_DES_EP1";
tfor_bringmev_civiliantypes = ["TK_CIV_Takistani01_EP1","TK_CIV_Takistani03_EP1","TK_CIV_Takistani02_EP1","TK_CIV_Takistani05_EP1","TK_CIV_Takistani04_EP1","TK_CIV_Takistani06_EP1","TK_CIV_Worker02_EP1","TK_CIV_Worker01_EP1","TK_CIV_Woman01_EP1","TK_CIV_Woman02_EP1","TK_CIV_Woman03_EP1"];
/******/

/***mark fueldump***/
tfor_markfueldump_markerobjects = ["IR_Strobe_Target","IR_Strobe_Marker"];
/******/