//by Bon_Inf*
// very simple IED script :-P


if(isNull Server) exitWith{
	_error = "BON IEDs: a gamelogic called 'Server' required. Aborting...";
	diag_log _error; hint _error;
};


BON_IED_PATH = "bon_ieds\";



bon_number_ieds = tfor_ieds; //50;

bon_ied_container = [
	"Land_Misc_Garb_Heap_EP1","HMMWVWreck","hiluxWreck","datsun01Wreck",
	"datsun02Wreck","SKODAWreck","T72WreckTurret","UAZWreck","BMP2Wreck",
	"BRDMWreck","T72Wreck","UralWreck",
	"Land_IED_v1_PMC","Land_IED_v2_PMC","Land_IED_v1_PMC","Land_IED_v2_PMC",
	"Land_IED_v1_PMC","Land_IED_v2_PMC","Land_IED_v1_PMC","Land_IED_v2_PMC"
];


bon_ied_boomlist = ["ARTY_Sh_105_HE","Bo_GBU12_LGB","Sh_85_HE"];

bon_ied_greenzone = [getmarkerpos format["respawn_%1",tfor_friendly_side],1500]; // [position,radius] no IED shall spawn


[] execVM (BON_IED_PATH+"ied_creation.sqf");

if(isServer) then{
	"bon_ieds_ied_defused" addPublicVariableEventHandler {(_this select 1) execVM (BON_IED_PATH+"ied_defusion_handler.sqf")};
};