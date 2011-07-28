// by Bon_Inf*
/*******************************************************************************
*
* The intention of this config file is to "completely" separate object type
* definitions and all the scripts this mission uses, so that porting this mission
* especially to other mods or game versions becomes as easy as possible.
*
* Exceptions build the script components located in the folders on root level.
* Those exceptions are:
*	- bon_recruit_units :
*		bon_recruit_units/bon_recruitable_units.sqf
*		Definition of lists of recruitable units
*	- dyno :
*		all the dyno compositions include OA objects in this version
*	- bon_ieds :
*		bon_ieds\init.sqf
*		Definition of possible ied container
*	- of course the loadout presets in bon_loadoutpresets
*	- the ammocrate filler in scripts\ammocrate_filler.sqf
*
* all the rest, including all objects being created during missions, are
* defined here.
*
* You can easily change this version from BLUFOR to OPFOR by changing the types
* in the SIDES section, but don't forget then to replace the objects placed in
* the editor as well.
*
*******************************************************************************/


tfor_arma2 = true;  // add ArmA2 equipment
tfor_BAF = false;   // add BAF equipment
tfor_ACE = true;   // add ACE2 equipment
tfor_PMC = false;  // add PMC equipment


tfor_max_players = 20;



/****************************** MISSION ****************************************/
tfor_artifunds = 5;
tfor_maxnumber_airpatrols = 3;
tfor_maxnumber_footpatrols = 4;
tfor_maxnumber_camps = 50;
tfor_civilian_deathcosts = 2.0;
tfor_advanced_aircraft_list = ["Plane","AH64D_EP1","A10_US_EP1"];
tfor_advanced_vehicle_list = ["Tank"];

tfor_min_amount_armor = 0; // min amount enemy armor (1 player)
tfor_max_amount_armor = 2; // max amount enemy armor (max players)
tfor_min_amount_apc = 0;   // min amount enemy apc (1 player)
tfor_max_amount_apc = 3;   // max amount enemy apc (max players)
tfor_min_amount_car = 2;   // min amount enemy car (1 player)
tfor_max_amount_car = 4;   // max amount enemy car (max players)
tfor_min_amount_aa = 0;    // min amount enemy aa (1 player)
tfor_max_amount_aa = 2;    // max amount enemy aa (max players)
tfor_min_amount_inf = 2;   // min amount enemy inf (1 player), in groups; NOTE: MUST BE AT LEAST 2
tfor_max_amount_inf = 10;  // max amount enemy inf (max players), in groups
/*******************************************************************************/





/*******************************  SIDES  **************************************/
tfor_friendly_side = west;
tfor_enemy_side = east;

tfor_east_armor = ["T72_RU","T90"];
tfor_east_apc = ["BMP3","BTR90","GAZ_Vodnik","GAZ_Vodnik_HMG"];
tfor_east_aa = ["2S6M_Tunguska"];
tfor_east_car = ["GRAD_RU","UAZ_AGS30_RU"];
tfor_east_air = ["Ka52","Mi24_P","Mi24_V","Mi17_rockets_RU"];

tfor_west_armor = ["M1A1","M1A2_TUSK_MG"];
tfor_west_apc = ["AAV","LAV25"];
tfor_west_aa = ["HMMWV_Avenger"];
tfor_west_car = ["HMMWV_M2","HMMWV_Armored","HMMWV_MK19","HMMWV_TOW"];
tfor_west_air = ["AH1Z","AH64D","MH60S","UH1Y"];

// TK army
tfor_east_inf = ["RU_Soldier_AA","RU_Soldier_HAT","RU_Soldier_AR","RU_Soldier_GL",
		"RU_Soldier_MG","RU_Soldier_Marksman","RU_Soldier_Medic",
		"RU_Soldier_Officer","RU_Soldier","RU_Soldier_LAT","RU_Soldier_AT",
		"RU_Soldier2","RU_Soldier_Sniper","RU_Soldier_SniperH","RU_Soldier_Spotter",
		"RU_Soldier_SL","RU_Soldier_TL"
];
// TK militia
tfor_east_militia = ["Ins_Soldier_Sniper","Ins_Soldier_Sapper","Ins_Soldier_Sab",
		"Ins_Soldier_2","Ins_Soldier_1","Ins_Soldier_CO","Ins_Soldier_Medic",
		"Ins_Soldier_MG","Ins_Bardak","Ins_Soldier_GL","Ins_Commander",
		"Ins_Lopotev","Ins_Soldier_AR","Ins_Soldier_AT","Ins_Soldier_AA"
];
// US
tfor_west_inf = ["USMC_Soldier_AA","USMC_Soldier_HAT","USMC_Soldier_AT","USMC_Soldier_AR",
		"USMC_Soldier_Medic","USMC_SoldierM_Marksman","USMC_SoldierS_Engineer",
		"USMC_Soldier_TL","USMC_Soldier_GL","USMC_Soldier_MG","USMC_Soldier",
		"USMC_Soldier2","USMC_Soldier_LAT","USMC_SoldierS","USMC_SoldierS_Sniper",
		"USMC_SoldierS_SniperH","USMC_SoldierS_Spotter","USMC_Soldier_SL"
];
// US Spec Ops
tfor_west_special = ["FR_Assault_GL","FR_Assault_R","FR_Corpsman","FR_Sapper","FR_Cooper",
		"FR_AC","FR_GL","FR_AR","FR_Marksman","FR_Miles","FR_OHara","FR_Rodriguez",
		"FR_R","FR_Sykes","FR_TL"
];
/******************************************************************************/





/*******************************  MISC ***************************************/
tfor_missiondelay = 120; // time in secs between tasks

tfor_artitype = "M119";

tfor_ammobox = "USVehicleBox"; // <- the thing at base

tfor_pilots = ["US_Soldier_Pilot_EP1","US_Pilot_Light_EP1","CZ_Soldier_Pilot_EP1","BAF_Pilot_MTP"];
tfor_crewmen = ["US_Soldier_Crew_EP1","BAF_crewman_MTP"];
tfor_sniper = ["US_Soldier_Sniper_EP1","CZ_Soldier_Sniper_EP1","BAF_Soldier_Sniper_MTP"];
tfor_commanders = ["US_Soldier_Officer_EP1","BAF_Soldier_Officer_MTP"];

tfor_choppers_can_lift = ["CH_47F_EP1","CH_47F_BAF"];
tfor_rallypoint_type = "Misc_Backpackheap";
tfor_mobileuavterminals = ["HMMWV_M1035_DES_EP1"]; // enter one of these vehicles and dismount again to access UAV
tfor_vehicles_canload_ammo = ["MtvrReammo_DES_EP1","UH60M_EP1","BAF_Merlin_HC3_D","MtvrReammo"];
tfor_loadable_boxtype = "USBasicWeaponsBox";

enableEngineArtillery false; // disable/enable BIS artillery computer

// assets the commander can build;
// form: [type,category,costs];
// category can be either: Commandpost,Support,Defense
tfor_commander_assets = [
	["USMC_WarfareBUAVterminal","Commandpost",1],
	["USMC_WarfareBBarracks","Support",1],
	["USMC_WarfareBFieldhHospital","Support",1],
	["USMC_WarfareBVehicleServicePoint","Support",1],
	["USVehicleBox_EP1","Support",1],
	["Stinger_Pod_US_EP1","Defense",1]
];
tfor_commanderfunds = 10;

tfor_mhqtype = "M1133_MEV_EP1";
/******************************************************************************/








///////////////////////////////////////////////////////////////////////////////
////////////////////////////////// Missions////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////



/******************************** captureofficer*******************************/
tfor_captureofficer_officer = "RU_Commander";
/******************************************************************************/


/******************************** destroyfirebase *****************************/
tfor_destroyfirebase_artitype = "D30_RU"; // <- note: dyno firebase_0.sqf
/******************************************************************************/


/****************************** destroyradarscud ******************************/
tfor_destroyradarscud_radartype = "TK_WarfareBAntiAirRadar_Base_EP1";
tfor_destroyradarscud_scudtype = "MAZ_543_SCUD_TK_EP1";
/******************************************************************************/


/******************************** rescuepilot *********************************/
tfor_rescuepilot_heliwreck = "UH60_wreck_EP1";
tfor_rescuepilot_pilottype = "US_Soldier_Pilot_EP1";
/******************************************************************************/


/******************************** searchcache *********************************/
tfor_searchcache_cachetype_outside = "TKBasicWeapons_EP1";
tfor_searchcache_cachetype_inside = "TKBasicAmmunitionBox_EP1";
/******************************************************************************/


/******************************** stopconvoy **********************************/
tfor_stopconvoy_vehicle_1 = "KamazRepair";
tfor_stopconvoy_vehicle_2 = "2S6M_Tunguska";
/******************************************************************************/


/******************************** bringtruck***********************************/
tfor_bringtruck_truck = "MtvrReammo";
/******************************************************************************/


/******************************** mark fueldump********************************/
tfor_markfueldump_markerobjects = ["IR_Strobe_Target","IR_Strobe_Marker"];
/******************************************************************************/