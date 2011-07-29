// by Bon_Inf*

if(isDedicated) exitWith{};

player disableConversation true;

[] execVM "scripts\intro.sqf";
[] execVM "scripts\notes.sqf";

[player,tfor_markersystem] execFSM "fsm\markersystem.fsm";
if(tfor_rallypoints > 0) then{[] execVM "bon_rallypoints\init.sqf"};

//Разделить разрузку коробок
//_ammo = tfor_ammobox createVehicleLocal getMarkerPos "ammoboxes";
//_ammo allowDamage false;
//[_ammo] execVM "scripts\ammocrate_filler.sqf";

// Кнопка respawn
	sleep 0.1;
	
	waitUntil {!isNull (findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["KeyDown","_this call func_keyspressed"];
	(findDisplay 46) displayAddEventHandler ["KeyUp","_this call func_keysreleased"];



/**
* if(typeof player in tfor_commanders) then {
*	tfor_sidechat = format["Командир %1 добро пожаловать.",name player];
*	publicVariable "tfor_sidechat";
*
*	if(isNil "tfor_HCLogic") then {
*		tfor_HC_GroupLogic = createGroup sideLogic;
*		tfor_HCLogic = tfor_HC_GroupLogic createUnit ["Logic",[0,0,0],[],0,"NONE"];
*		publicVariable "tfor_HCLogic";
*	};
*
*	tfor_HCLogic setVariable ["HC_commander",player,true];
*	tfor_HCLogic setVehicleInit "_n = [this,ObjNull] execVM 'hc\init.sqf'"; processInitCommands;
*};
**/


[] execVM "scripts\player_respawn.sqf";



"tfor_commandchat" addPublicVariableEventHandler {player commandChat (_this select 1)};
"tfor_sidechat" addPublicVariableEventHandler {[playerSide,"HQ"] sideChat (_this select 1)};

"tfor_deathcount" addPublicVariableEventHandler {
	_livesleft = tfor_max_death_per_mission - (_this select 1);
	if(_livesleft <= 5 && _livesleft >= 0) then {
		hintSilent parseText format["<t size='1.25' font='Zeppelin33' color='#ff0000'>%1 жизней осталось.</t>",floor (tfor_max_death_per_mission - (_this select 1))];
	};
};


if(not isServer) then {
	WaitUntil{not isNil "tfor_currentmission"};
	tfor_currentmission execVM "scripts\missions\tasks.sqf";
	"tfor_currentmission" addPublicVariableEventHandler {(_this select 1) execVM "scripts\missions\tasks.sqf"};
};