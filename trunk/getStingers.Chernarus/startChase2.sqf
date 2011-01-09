if (!isServer) exitWith{};
if (reinforced == 0) then {
	player globalchat "Reinforcements on the way!";
	chase5 = createGroup west;
	_tempSoldier51 = chase5 createUnit ["USMC_Soldier_TL",getMarkerPos "reiforcement_start",[],0.8,"Sergeant"];
	_tempSoldier52 = chase5 createUnit ["USMC_Soldier_MG",getMarkerPos "reiforcement_start",[],0.7,"Private"];
	_tempSoldier53 = chase5 createUnit ["US_Soldier_LAT_EP1",getMarkerPos "reiforcement_start",[],0.6,"Private"];
	_tempSoldier54 = chase5 createUnit ["US_Soldier_EP1",getMarkerPos "reiforcement_start",[],0.6,"Private"];

	_hmmv1 = createVehicle ["HMMWV_MK19_DES_EP1", getMarkerPos "reiforcement_start", [], 10, "FORM"];
	_tempSoldier51 moveInDriver _hmmv1;
	_tempSoldier52 moveInGunner _hmmv1;
	_tempSoldier53 moveInCargo _hmmv1;
	_tempSoldier54 moveInCargo _hmmv1;

	chase6 = createGroup west;
	_tempSoldier61 = chase6 createUnit ["USMC_Soldier_TL",getMarkerPos "reiforcement_start",[],0.8,"Sergeant"];
	_tempSoldier62 = chase6 createUnit ["USMC_Soldier_Medic",getMarkerPos "reiforcement_start",[],0.7,"Private"];
	_tempSoldier63 = chase6 createUnit ["US_Soldier_LAT_EP1",getMarkerPos "reiforcement_start",[],0.6,"Private"];
	_tempSoldier64 = chase6 createUnit ["US_Soldier_EP1",getMarkerPos "reiforcement_start",[],0.6,"Private"];

	_hmmv2 = createVehicle ["HMMWV_M1151_M2_DES_EP1", getMarkerPos "reiforcement_start", [], 10, "FORM"];
	_tempSoldier61 moveInDriver _hmmv2;
	_tempSoldier62 moveInGunner _hmmv2;
	_tempSoldier63 moveInCargo _hmmv2;
	_tempSoldier64 moveInCargo _hmmv2;

	chase7 = createGroup west;
	_tempSoldier71 = chase7 createUnit ["USMC_Soldier_TL",getMarkerPos "reiforcement_start",[],0.8,"Sergeant"];
	_tempSoldier72 = chase7 createUnit ["USMC_Soldier_Medic",getMarkerPos "reiforcement_start",[],0.7,"Private"];
	_tempSoldier73 = chase7 createUnit ["US_Soldier_LAT_EP1",getMarkerPos "reiforcement_start",[],0.6,"Private"];
	_tempSoldier74 = chase7 createUnit ["US_Soldier_EP1",getMarkerPos "reiforcement_start",[],0.6,"Private"];

	_heli1 = createVehicle ["UH60M_EP1", getMarkerPos "reiforcement_start", [], 10, "FLY"];
	_tempSoldier71 moveInDriver _heli1;
	_tempSoldier72 moveInTurret [_heli1,[0,0]];
	_tempSoldier73 moveInTurret [_heli1,[1]];
	_tempSoldier74 moveInCargo _heli1;

	_wp = chase7 addWaypoint [getPos stingerTruck, 0];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointSpeed "FULL";

//	_nil = [] call compile preprocessFileLineNumbers "chase2Route.sqf";
	_nil = [] execVM "chase2Route.sqf";
	reinforced = 1;
};