player createDiaryRecord ["Diary", ["Respawn note", "No fucking respawn.<br/><br/> Maximum hardcore."]];
player createDiaryRecord ["Diary", ["Objective", "Some fanatics kidnapped Oscar, our resident Bill Cosby imitator. They are threatening to kill him if he won't stop telling Bill Cosby quotes, and knowing Oscar, he won't stop.<br/><br/>So your team was dispatched to rescue Oscar. He is believed to be held as a hostage somewhere in <marker name='markerHostage'>this village</marker>.<br/><br/>Once you have found him, bring him <marker name='markerEnd'>to safety</marker>."]];


tskT = player createSimpleTask ["Rescue Oscar"];
tskT setSimpleTaskDescription ["Rescue oscar and bring him <marker name='markerEnd'>to safety</marker>.", "Rescue Oscar", "Rescue Oscar"];
tskT setSimpleTaskDestination (getMarkerPos "markerHostage");

if (isNil "paramsArray") then {paramsArray = [0,1200]};

skiptime (paramsArray select 0);

titletext [" ","Black in", 1];

//Loadout
    clearweaponcargo Abox;
    clearmagazinecargo Abox;
    {Abox addweaponcargo [_x,2];} foreach ["M110_TWS_EP1","M4A3_CCO_EP1",
    "ACE_MP5SD",
    "ACE_MP5A5",
    "ACE_UMP45_AIM_SD",
    "ACE_M1014_Eotech",
    "ACE_Val_Kobra",
    "ACE_AKMS_SD",
    "bizon_silenced",
    "ACE_AK74M_SD",
    "ACE_AK74M_SD_Kobra",
    "ACE_AK74M_SD_TWS",
    "ACE_AKS74_UN",
    "ACE_M4A1_Aim_SD",
    "ACE_SOC_M4A1_SD_9",
    "ACE_SOC_M4A1_AIM_SD",
    "G36_C_SD_eotech",
    "M4A1_AIM_SD_camo"];
    
    {Abox addmagazinecargo[_x,30];} foreach ["8Rnd_B_Beneli_Pellets",
    "ACE_30Rnd_762x39_SD_AK47",
    "30Rnd_556x45_G36SD",
    "30Rnd_545x39_AK",
    "ACE_20Rnd_9x39_SP6_VSS",
    "64Rnd_9x19_SD_Bizon",
    "30Rnd_556x45_Stanag",
    "30Rnd_556x45_StanagSD",
    "30Rnd_9x19_MP5",
    "30Rnd_9x19_MP5SD",
    "ACE_25Rnd_1143x23_B_UMP45",
    "20Rnd_762x51_B_SCAR"];

ClearedSectors = 0;
sleep 1;
HostageRescued = false;
[] execVM "hidehostage.sqf";

"HostageRescued" addPublicVariableEventHandler {hostage groupchat "Thanks for rescuing me."};


_timelimit = paramsArray select 1;

while {time < (_timelimit - 1)} do {
        sleep 1;
};

Player sidechat "It took you too long, idiots!";
sleep 5;
endMission "LOSER";
