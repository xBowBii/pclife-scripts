if (!isServer) exitWith{};
_array = _this select 0;

if (ins1 in _array) then {
	if (count _array > 1) then {
		[-2, {traitor globalChat _this}, "Stop. I have to meet Nikolai, he will take the truck, only he can go inside. Follow me."] call CBA_fnc_globalExecute;
//		[ins1] joinSilent traitor;
		traitor enableAI "MOVE";
		_wp = group traitor addWaypoint [getMarkerPos "tr_wp1",0];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointBehaviour "CARELESS";
		_wp setWaypointCombatMode "BLUE";
		_wp2 = group traitor addWaypoint [getMarkerPos "tr_wp2",0];
		_wp2 setWaypointType "MOVE";
		_wp2 setWaypointSpeed "LIMITED";
		_wp2 setWaypointBehaviour "CARELESS";
		_wp2 setWaypointCombatMode "BLUE";
		_wp3 = group traitor addWaypoint [getMarkerPos "tr_wp3",0];
		_wp3 setWaypointType "MOVE";
		_wp3 setWaypointSpeed "LIMITED";
		_wp3 setWaypointBehaviour "CARELESS";
		_wp3 setWaypointCombatMode "BLUE";
		_wp4 = group traitor addWaypoint [getMarkerPos "tr_wp4",0];
		_wp4 setWaypointType "MOVE";
		_wp4 setWaypointSpeed "LIMITED";
		_wp4 setWaypointBehaviour "CARELESS";
		_wp4 setWaypointCombatMode "BLUE";
		_wp5 = group traitor addWaypoint [getMarkerPos "tr_wp5",0];
		_wp5 setWaypointType "MOVE";
		_wp5 setWaypointSpeed "LIMITED";
		_wp5 setWaypointBehaviour "CARELESS";
		_wp5 setWaypointCombatMode "BLUE";
		_wp6 = group traitor addWaypoint [getMarkerPos "tr_wp6",0];
		_wp6 setWaypointType "MOVE";
		_wp6 setWaypointSpeed "LIMITED";
		_wp6 setWaypointBehaviour "CARELESS";
		_wp6 setWaypointCombatMode "BLUE";
		deleteVehicle traitorTrigger;
	}
	else
	{
		[-2, {traitor globalChat _this}, "Truck inside. Let's make it quick. Follow me."] call CBA_fnc_globalExecute;
//		[ins1] joinSilent (group traitor);
		traitor enableAI "MOVE";
		_wp = group traitor addWaypoint [getMarkerPos "tr_wp1",0];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointBehaviour "CARELESS";
		_wp setWaypointCombatMode "BLUE";
		_wp2 = group traitor addWaypoint [getMarkerPos "tr_wp2",0];
		_wp2 setWaypointType "MOVE";
		_wp2 setWaypointSpeed "LIMITED";
		_wp2 setWaypointBehaviour "CARELESS";
		_wp2 setWaypointCombatMode "BLUE";
		_wp3 = group traitor addWaypoint [getMarkerPos "tr_wp3",0];
		_wp3 setWaypointType "MOVE";
		_wp3 setWaypointSpeed "LIMITED";
		_wp3 setWaypointBehaviour "CARELESS";
		_wp3 setWaypointCombatMode "BLUE";
		_wp4 = group traitor addWaypoint [getMarkerPos "tr_wp4",0];
		_wp4 setWaypointType "MOVE";
		_wp4 setWaypointSpeed "LIMITED";
		_wp4 setWaypointBehaviour "CARELESS";
		_wp4 setWaypointCombatMode "BLUE";
		_wp5 = group traitor addWaypoint [getMarkerPos "tr_wp5",0];
		_wp5 setWaypointType "MOVE";
		_wp5 setWaypointSpeed "LIMITED";
		_wp5 setWaypointBehaviour "CARELESS";
		_wp5 setWaypointCombatMode "BLUE";
		_wp6 = group traitor addWaypoint [getMarkerPos "tr_wp6",0];
		_wp6 setWaypointType "MOVE";
		_wp6 setWaypointSpeed "LIMITED";
		_wp6 setWaypointBehaviour "CARELESS";
		_wp6 setWaypointCombatMode "BLUE";
		deleteVehicle traitorTrigger;
	};
}
else
{
	[-2, {traitor globalChat _this}, "Stop. I should meet Nikolai, not you."] call CBA_fnc_globalExecute;
};