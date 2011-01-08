if (!isServer) exitWith{};
if (reinforced == 0) then {
	chase4 = createGroup west;
	_tempSoldier11 = chase1 createUnit ["USMC_Soldier_TL",getMarkerPos "chase_start",[],0.8,"Sergeant"];
	_tempSoldier12 = chase1 createUnit ["USMC_Soldier_MG",getMarkerPos "chase_start",[],0.7,"Private"];
	_tempSoldier13 = chase1 createUnit ["US_Soldier_LAT_EP1",getMarkerPos "chase_start",[],0.6,"Private"];
	_tempSoldier14 = chase1 createUnit ["US_Soldier_EP1",getMarkerPos "chase_start",[],0.6,"Private"];
	_killedEH = _tempSoldier11 addEventHandler ["killed", {reinforced=1; _this exec "callReinforcements.sqf"}];

	_hmmv1 = createVehicle ["HMMWV_MK19_DES_EP1", getMarkerPos "reiforcement_start", [], 10, "FORM"];
	sleep 0.5;
	_tempSoldier11 moveInDriver _hmmv1;
	_tempSoldier12 moveInGunner _hmmv1;
	_tempSoldier13 moveInCargo _hmmv1;
	_tempSoldier14 moveInCargo _hmmv1;

	chase5 = createGroup west;
	_tempSoldier21 = chase2 createUnit ["USMC_Soldier_TL",getMarkerPos "chase_start",[],0.8,"Sergeant"];
	_tempSoldier22 = chase2 createUnit ["USMC_Soldier_Medic",getMarkerPos "chase_start",[],0.7,"Private"];
	_tempSoldier23 = chase2 createUnit ["US_Soldier_LAT_EP1",getMarkerPos "chase_start",[],0.6,"Private"];
	_tempSoldier24 = chase2 createUnit ["US_Soldier_EP1",getMarkerPos "chase_start",[],0.6,"Private"];

	_hmmv2 = createVehicle ["HMMWV_M1151_M2_DES_EP1", getMarkerPos "reiforcement_start", [], 10, "FORM"];
	sleep 0.5;
	_tempSoldier21 moveInDriver _hmmv2;
	_tempSoldier22 moveInGunner _hmmv2;
	_tempSoldier23 moveInCargo _hmmv2;
	_tempSoldier24 moveInCargo _hmmv2;

	chase6 = createGroup west;
	_tempSoldier21 = chase2 createUnit ["USMC_Soldier_TL",getMarkerPos "chase_start",[],0.8,"Sergeant"];
	_tempSoldier22 = chase2 createUnit ["USMC_Soldier_Medic",getMarkerPos "chase_start",[],0.7,"Private"];
	_tempSoldier23 = chase2 createUnit ["US_Soldier_LAT_EP1",getMarkerPos "chase_start",[],0.6,"Private"];
	_tempSoldier24 = chase2 createUnit ["US_Soldier_EP1",getMarkerPos "chase_start",[],0.6,"Private"];

	_heli1 = createVehicle ["HMMWV_M1151_M2_DES_EP1", getMarkerPos "reiforcement_start", [], 10, "FORM"];
	sleep 0.5;
	_tempSoldier21 moveInDriver _hmmv2;
	_tempSoldier22 moveInGunner _hmmv2;
	_tempSoldier23 moveInCargo _hmmv2;
	_tempSoldier24 moveInCargo _hmmv2;

	_wp = chase6 addWaypoint [getPos stingerTruck, 0];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointSpeed "FULL";

	_nil = [] execVM "chase2Route.sqf";
};