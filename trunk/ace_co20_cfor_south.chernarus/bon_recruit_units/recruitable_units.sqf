_us_squadleader = "US_Soldier_SL_EP1";
_cz_squadleader = "CZ_Soldier_SL_DES_EP1";
_ger_squadleader = "GER_Soldier_TL_EP1";
_us_specforces = "US_Delta_Force_TL_EP1";
_us_sniper = "US_Soldier_Sniper_EP1";
_cz_sniper = "CZ_Soldier_Sniper_EP1";
_us_crewman = "US_Soldier_Crew_EP1";
_us_pilot = "US_Soldier_Pilot_EP1";
_us_commander = "US_Soldier_Officer_EP1";
_baf_commander = "BAF_Soldier_Officer_MTP";
_baf_squadleader = "BAF_Soldier_TL_MTP";
_baf_pilot = "BAF_Pilot_MTP";
_baf_crewman = "BAF_crewman_MTP";
_baf_sniper = "BAF_Soldier_Sniper_MTP";
_afr_squadleader = "AFR_Officer";
_afr_crewman = "AFR_Soldier_Crew";


switch (typeOf player) do{
	case _us_squadleader : {
		bon_recruit_recruitableunits = [
			"US_Soldier_AA_EP1",
			"US_Soldier_AAT_EP1",
			"US_Soldier_AHAT_EP1",
			"US_Soldier_AAR_EP1",
			"US_Soldier_AMG_EP1",
			"US_Soldier_AT_EP1",
			"US_Soldier_HAT_EP1",
			"US_Soldier_AR_EP1",
			"US_Soldier_Engineer_EP1",
			"US_Soldier_GL_EP1",
			"US_Soldier_MG_EP1",
			"US_Soldier_Marksman_EP1",
			"US_Soldier_Medic_EP1",
			"US_Soldier_EP1",
			"US_Soldier_LAT_EP1",
			"US_Soldier_B_EP1",
			"US_Soldier_SL_EP1"
		];
	};

	case _us_specforces : {
		bon_recruit_recruitableunits = [
			"US_Delta_Force_AR_EP1",
			"US_Delta_Force_Air_Controller_EP1",
			"US_Delta_Force_MG_EP1",
			"US_Delta_Force_Marksman_EP1",
			"US_Delta_Force_Medic_EP1",
			"US_Delta_Force_EP1",
			"US_Delta_Force_Assault_EP1",
			"US_Delta_Force_M14_EP1",
			"US_Delta_Force_Night_EP1",
			"US_Delta_Force_SD_EP1"
		];
	};

	case _us_sniper : {
		bon_recruit_recruitableunits = [
			"US_Soldier_Sniper_EP1",
			"US_Soldier_SniperH_EP1",
			"US_Soldier_Sniper_NV_EP1",
			"US_Soldier_Spotter_EP1"
		];
	};

	case _cz_squadleader : {
		bon_recruit_recruitableunits = [
			"CZ_Soldier_AMG_DES_EP1",
			"CZ_Soldier_MG_DES_EP1",
			"CZ_Soldier_DES_EP1",
			"CZ_Soldier_AT_DES_EP1",
			"CZ_Soldier_B_DES_EP1",
			"CZ_Special_Forces_GL_DES_EP1",
			"CZ_Special_Forces_MG_DES_EP1",
			"CZ_Special_Forces_DES_EP1",
			"CZ_Special_Forces_Scout_DES_EP1",
			"US_Soldier_Medic_EP1"
		];
	};

	case _cz_sniper : {
		bon_recruit_recruitableunits = [
			"CZ_Soldier_Sniper_EP1",
			"US_Soldier_Spotter_EP1"
		]
	};

	case _ger_squadleader : {
		bon_recruit_recruitableunits = [
			"GER_Soldier_EP1",
			"GER_Soldier_Medic_EP1",
			"GER_Soldier_MG_EP1",
			"GER_Soldier_Scout_EP1"
		];
	};

	case _us_pilot : {
		bon_recruit_recruitableunits = [
			"US_Soldier_Pilot_EP1",
			"CZ_Soldier_Pilot_EP1"
		];
	};

	case _us_crewman : {
		bon_recruit_recruitableunits = [
			"US_Soldier_Crew_EP1"
		];
	};

	case _baf_squadleader : {
		bon_recruit_recruitableunits = [
			"BAF_Soldier_AAA_MTP",
			"BAF_Soldier_AA_MTP",
			"BAF_Soldier_AAT_MTP",
			"BAF_Soldier_AHAT_MTP",
			"BAF_Soldier_AAR_MTP",
			"BAF_Soldier_AMG_MTP",
			"BAF_Soldier_AT_MTP",
			"BAF_Soldier_HAT_MTP",
			"BAF_Soldier_AR_MTP",
			"BAF_Soldier_EN_MTP",
			"BAF_Soldier_GL_MTP",
			"BAF_Soldier_FAC_MTP",
			"BAF_Soldier_MG_MTP",
			"BAF_Soldier_scout_MTP",
			"BAF_Soldier_Marksman_MTP",
			"BAF_Soldier_Medic_MTP",
			"BAF_Soldier_MTP",
			"BAF_ASoldier_MTP",
			"BAF_Soldier_L_MTP",
			"BAF_Soldier_N_MTP",
			"BAF_Soldier_SL_MTP"
		];
	};

	case _baf_pilot : {
		bon_recruit_recruitableunits = [
			"BAF_Pilot_MTP"
		];
	};

	case _baf_crewman : {
		bon_recruit_recruitableunits = [
			"BAF_crewman_MTP"
		];
	};

	case _baf_sniper : {
		bon_recruit_recruitableunits = [
			"BAF_Soldier_spotterN_MTP",
			"BAF_Soldier_spotter_MTP",
			"BAF_Soldier_SniperN_MTP",
			"BAF_Soldier_Sniper_MTP",
			"BAF_Soldier_SniperH_MTP"
		];
	};

	case _us_commander : {
		bon_recruit_recruitableunits = [
			"US_Soldier_Engineer_EP1",
			"US_Soldier_Crew_EP1",
			"US_Soldier_Pilot_EP1"
		];
	};

	case _baf_commander : {
		bon_recruit_recruitableunits = [
			"BAF_Soldier_EN_MTP",
			"BAF_Pilot_MTP",
			"BAF_crewman_MTP"
		];
	};

	case _afr_squadleader : {
		bon_recruit_recruitableunits = [
			"AFR_Soldier_Medic",
			"AFR_Soldier_Engineer",
			"AFR_Soldier_Rifleman",
			"AFR_Soldier_GL",
			"AFR_Soldier_MG",
			"AFR_Soldier_AT",
			"AFR_Soldier_LAT",
			"AFR_Soldier_HAT",
			"AFR_Rifleman",
			"AFR_Soldier_Igla",
			"AFR_Soldier_Stinger",
			"AFR_Medic"
		];
	};

	case _afr_crewman : {
		bon_recruit_recruitableunits = [
			"AFR_Soldier_Crew"
		];
	};

	default {bon_recruit_recruitableunits = []};
};