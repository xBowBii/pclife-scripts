//by Bon_Inf*


if(not isServer) exitWith{};


onPlayerDisconnected "
	createMarker [format['marker_%1',_name],[0,1,0]];
	deleteMarker format['marker_%1',_name];
					";

// create ambient civilian life
if(tfor_ambient_civs == 1) then {
	tfor_ALICE_GroupLogic = createGroup sideLogic;
	tfor_ALICE = tfor_ALICE_GroupLogic createUnit ["Alice2Manager",[0,0,0],[],0,"NONE"];

	tfor_ALICE setVariable ["ALICE_civilianinit",[{
		_this addEventHandler ["Killed",{
			if(side (_this select 1) == tfor_friendly_side || isNull (_this select 1)) then{
				tfor_deathcount = tfor_deathcount + tfor_civilian_deathcosts;
				publicVariable "tfor_deathcount";
			};
		}];
	}]];
};

// set Daytime
setDate [2010,7,10,tfor_daytime,0];

if(tfor_adv_aircraft == 0) then {
	{
		deleteVehicle _x;
	} foreach nearestObjects [getMarkerPos "barracks",tfor_advanced_aircraft_list,2000];
};
if(tfor_adv_vehicles == 0) then {
	{
		deleteVehicle _x;
	} foreach nearestObjects [getMarkerPos "barracks",tfor_advanced_vehicle_list,2000];
};

if(tfor_enemy_patrols == 2) then{[] execVM "scripts\enemy_patrols_air.sqf"};
if(tfor_enemy_aa == 1) then{[] execVM "scripts\enemy_aa.sqf"};
if(tfor_enemy_camps == 1) then{[] execVM "scripts\enemy_camps.sqf"};

// use this rarely
"tfor_exec_remotecode" addPublicVariableEventHandler {call compile (_this select 1)};

_gate_r = createVehicle ["Land_Wall_Gate_Ind2Rail_R", getMarkerPos "gate_r", [], 0, "CAN_COLLIDE"];
_gate_r setDir 90;
_gate_l = createVehicle ["Land_Wall_Gate_Ind2Rail_L", getMarkerPos "gate_l", [], 0, "CAN_COLLIDE"];
_gate_l setDir 90;

//Περο obj
respawnObjects = compile loadFile "scripts\respawnObjects.sqf";
respawnObjects = compile preprocessFile "scripts\respawnObjects.sqf";


[] execVM "scripts\missions\missionmanager.sqf";
