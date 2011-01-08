while {(count (waypoints chase1)) > 0} do {
	deleteWaypoint ((waypoints chase1) select 0);
	player globalchat "wp removed";
};
while {(count (waypoints chase2)) > 0} do {
	deleteWaypoint ((waypoints chase2) select 0);
};
while {(count (waypoints chase3)) > 0} do {
	deleteWaypoint ((waypoints chase3) select 0);
};

while {((not isnull stingerTruck) and (isEngineOn stingerTruck))} do {
	if (not (getPos stingerTruck in enemyFob)) then {
		player sidechat "waypoint updated";
/*		_wp = chase1 addWaypoint [getPos stingerTruck,0];
		_wp setWaypointType "SAD";
		_wp setWaypointBehaviour "AWARE";
		_wp setWaypointCombatMode "RED";
		_wp setWaypointSpeed "FULL";
	
		_wp = chase2 addWaypoint [getPos stingerTruck,0];
		_wp setWaypointType "SAD";
		_wp setWaypointBehaviour "AWARE";
		_wp setWaypointCombatMode "RED";
		_wp setWaypointSpeed "FULL";
		_wp = chase3 addWaypoint [getPos stingerTruck,0];
		_wp setWaypointType "SAD";
		_wp setWaypointBehaviour "AWARE";
		_wp setWaypointCombatMode "RED";
		_wp setWaypointSpeed "FULL";
*/
		[chase1, 1] setWaypointPosition [getPos stingerTruck,0];
		[chase2, 1] setWaypointPosition [getPos stingerTruck,0];
		[chase3, 1] setWaypointPosition [getPos stingerTruck,0];
		sleep 30;
};