
player createDiaryRecord ["Diary", ["Respawn note", "Side respawn<br/><br/>Once you die, you will respawn into a free AI slot. If there is none, you don't respawn."]];
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
{Abox addweaponcargo [_x,2];} foreach ["M110_TWS_EP1","M4A3_CCO_EP1"];
Abox addmagazinecargo ["8Rnd_B_Beneli_Pellets",40];
Abox addmagazinecargo ["20Rnd_762x51_B_SCAR",20];


{
	_x removeweapon "M4A1_Aim_camo";
	_x removemagazine "30Rnd_556x45_Stanag";
	_x removemagazine "30Rnd_556x45_Stanag";
	_x removemagazine "30Rnd_556x45_Stanag";
	_x removemagazine "30Rnd_556x45_Stanag";
	_x removemagazine "30Rnd_556x45_Stanag";
	_x removemagazine "30Rnd_556x45_Stanag";
	
	_x addmagazine "8Rnd_B_Beneli_Pellets";
	_x addmagazine "8Rnd_B_Beneli_Pellets";
	_x addmagazine "8Rnd_B_Beneli_Pellets";
	_x addmagazine "8Rnd_B_Beneli_Pellets";
	_x addmagazine "8Rnd_B_Beneli_Pellets";
	_x addmagazine "8Rnd_B_Beneli_Pellets";
	_x addweapon "m1014";
	_x selectweapon (Primaryweapon _x);
} foreach [S2, S6];

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