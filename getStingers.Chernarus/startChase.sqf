player globalchat "chase incoming!";
if (!isServer) exitWith{};
sleep 6;

chase1 = createGroup west;
_tempSoldier11 = chase1 createUnit ["USMC_Soldier_TL",getMarkerPos "chase_start",[],0.8,"Sergeant"];
_tempSoldier12 = chase1 createUnit ["USMC_Soldier_MG",getMarkerPos "chase_start",[],0.7,"Private"];
_tempSoldier13 = chase1 createUnit ["US_Soldier_LAT_EP1",getMarkerPos "chase_start",[],0.6,"Private"];
_tempSoldier14 = chase1 createUnit ["US_Soldier_EP1",getMarkerPos "chase_start",[],0.6,"Private"];
_killedEH = _tempSoldier11 addEventHandler ["killed", {_nil = [] execVM "startChase2.sqf";}];

_hmmv1 = createVehicle ["HMMWV_MK19_DES_EP1", getMarkerPos "chase_start", [], 10, "FORM"];
sleep 0.5;
_tempSoldier11 moveInDriver _hmmv1;
_tempSoldier12 moveInGunner _hmmv1;
_tempSoldier13 moveInCargo _hmmv1;
_tempSoldier14 moveInCargo _hmmv1;

chase2 = createGroup west;
_tempSoldier21 = chase2 createUnit ["USMC_Soldier_TL",getMarkerPos "chase_start2",[],0.8,"Sergeant"];
_tempSoldier22 = chase2 createUnit ["USMC_Soldier_Medic",getMarkerPos "chase_start2",[],0.7,"Private"];
_tempSoldier23 = chase2 createUnit ["US_Soldier_LAT_EP1",getMarkerPos "chase_start2",[],0.6,"Private"];
_tempSoldier24 = chase2 createUnit ["US_Soldier_EP1",getMarkerPos "chase_start2",[],0.6,"Private"];

_hmmv2 = createVehicle ["HMMWV_M1151_M2_DES_EP1", getMarkerPos "chase_start2", [], 10, "FORM"];
sleep 0.5;
_tempSoldier21 moveInDriver _hmmv2;
_tempSoldier22 moveInGunner _hmmv2;
_tempSoldier23 moveInCargo _hmmv2;
_tempSoldier24 moveInCargo _hmmv2;
_killedEH = _tempSoldier21 addEventHandler ["killed", {_nil = [] execVM "startChase2.sqf";}];

chase3 = createGroup west;
_tempSoldier31 = chase3 createUnit ["USMC_Soldier_TL",getMarkerPos "chase_start",[],0.8,"Sergeant"];
_tempSoldier32 = chase3 createUnit ["USMC_Soldier_MG",getMarkerPos "chase_start",[],0.7,"Private"];
_tempSoldier33 = chase3 createUnit ["US_Soldier_LAT_EP1",getMarkerPos "chase_start",[],0.6,"Private"];
_tempSoldier34 = chase3 createUnit ["US_Soldier_EP1",getMarkerPos "chase_start",[],0.6,"Private"];
_tempSoldier35 = chase3 createUnit ["US_Soldier_AAR_EP1",getMarkerPos "chase_start",[],0.7,"Private"];
_tempSoldier36 = chase3 createUnit ["US_Soldier_AR_EP1",getMarkerPos "chase_start",[],0.6,"Private"];
_tempSoldier37 = chase3 createUnit ["US_Soldier_EP1",getMarkerPos "chase_start",[],0.6,"Private"];
_tempSoldier38 = chase3 createUnit ["USMC_Soldier_GL",getMarkerPos "chase_start",[],0.7,"Private"];
_tempSoldier39 = chase3 createUnit ["USMC_Soldier_GL",getMarkerPos "chase_start",[],0.6,"Private"];
_tempSoldier310 = chase3 createUnit ["USMC_Soldier_Medic",getMarkerPos "chase_start",[],0.6,"Private"];
_killedEH = _tempSoldier31 addEventHandler ["killed", {_nil = [] execVM "startChase2.sqf";}];

_hmmv3 = createVehicle ["ACE_Truck5tMG", getMarkerPos "chase_start", [], 10, "FORM"];
sleep 0.5;
_tempSoldier31 moveInDriver _hmmv3;
_tempSoldier32 moveInGunner _hmmv3;
_tempSoldier33 moveInCargo _hmmv3;
_tempSoldier34 moveInCargo _hmmv3;
_tempSoldier35 moveInCargo _hmmv3;
_tempSoldier36 moveInCargo _hmmv3;
_tempSoldier37 moveInCargo _hmmv3;
_tempSoldier38 moveInCargo _hmmv3;
_tempSoldier39 moveInCargo _hmmv3;
_tempSoldier310 moveInCargo _hmmv3;

chase4 = createGroup west;
_tempSoldier41 = chase4 createUnit ["USMC_Soldier_TL",getMarkerPos "chase_start2",[],0.8,"Sergeant"];
_tempSoldier42 = chase4 createUnit ["USMC_Soldier_MG",getMarkerPos "chase_start2",[],0.7,"Private"];
_tempSoldier43 = chase4 createUnit ["US_Soldier_LAT_EP1",getMarkerPos "chase_start2",[],0.6,"Private"];
_tempSoldier44 = chase4 createUnit ["US_Soldier_EP1",getMarkerPos "chase_start2",[],0.6,"Private"];
_killedEH = _tempSoldier41 addEventHandler ["killed", {_nil = [] execVM "startChase2.sqf";}];

_hmmv4 = createVehicle ["HMMWV_MK19_DES_EP1", getMarkerPos "chase_start2", [], 10, "FORM"];
sleep 0.5;
_tempSoldier41 moveInDriver _hmmv4;
_tempSoldier42 moveInGunner _hmmv4;
_tempSoldier43 moveInCargo _hmmv4;
_tempSoldier44 moveInCargo _hmmv4;

_wp = chase1 addWaypoint [getMarkerPos "theBaseEntry", 0];
_wp setWaypointStatements ["getPos stingerTruck in enemyFobInside", "player globalchat 'troops moving to base!';_wp2 = chase1 addWaypoint [getMarkerPos 'theBaseEntry', 0]; _wp2 setWaypointType 'GETOUT'; _wp3 = chase1 addWaypoint [getMarkerPos 'theBase', 0]; _wp3 setWaypointType 'SAD'; _wp3 setWaypointCombatMode 'RED';"];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointCombatMode "RED";
_wp setWaypointSpeed "FULL";

_wp = chase2 addWaypoint [getMarkerPos "theBaseEntry", 0];
_wp setWaypointStatements ["getPos stingerTruck in enemyFobInside", "player globalchat 'troops moving to base!';_wp2 = chase2 addWaypoint [getMarkerPos 'theBaseEntry', 0]; _wp2 setWaypointType 'GETOUT'; _wp3 = chase2 addWaypoint [getMarkerPos 'theBase', 0]; _wp3 setWaypointType 'SAD'; _wp3 setWaypointCombatMode 'RED';"];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointCombatMode "RED";
_wp setWaypointSpeed "FULL";

_wp = chase3 addWaypoint [getMarkerPos "theBaseEntry", 0];
_wp setWaypointStatements ["getPos stingerTruck in enemyFobInside", "player globalchat 'troops moving to base!';_wp2 = chase3 addWaypoint [getMarkerPos 'theBaseEntry', 0]; _wp2 setWaypointType 'GETOUT'; _wp3 = chase3 addWaypoint [getMarkerPos 'theBase', 0]; _wp3 setWaypointType 'SAD'; _wp3 setWaypointCombatMode 'RED';"];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointCombatMode "RED";
_wp setWaypointSpeed "FULL";

_wp = chase4 addWaypoint [getMarkerPos "theBaseEntry", 0];
_wp setWaypointStatements ["getPos stingerTruck in enemyFobInside", "player globalchat 'troops moving to base!';_wp2 = chase4 addWaypoint [getMarkerPos 'theBaseEntry', 0]; _wp2 setWaypointType 'GETOUT'; _wp3 = chase4 addWaypoint [getMarkerPos 'theBase', 0]; _wp3 setWaypointType 'SAD'; _wp3 setWaypointCombatMode 'RED';"];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointCombatMode "RED";
_wp setWaypointSpeed "FULL";