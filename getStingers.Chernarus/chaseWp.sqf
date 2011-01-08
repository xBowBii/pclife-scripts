while {((not isnull stingerTruck) and (isEngineOn stingerTruck))} do {
	if (not (getPos stingerTruck in enemyFob)) then {
		player sidechat "waypoint updated";
		[chase1, 1] setWaypointPosition [getPos stingerTruck,0];
		[chase2, 1] setWaypointPosition [getPos stingerTruck,0];
		[chase3, 1] setWaypointPosition [getPos stingerTruck,0];
		sleep 30;
};