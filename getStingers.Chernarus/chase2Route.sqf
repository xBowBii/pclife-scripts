while {((not isnull stingerTruck) and (isEngineOn stingerTruck))} do {
	if (not (getPos stingerTruck in enemyFob)) then {
		player sidechat "reinforcements waypoint updated";
		if ((leader chase4) distance stingerTruck < 200) then {
			while {(count (waypoints chase4)) > 0} do {
					 deleteWaypoint ((waypoints chase4) select 0);
			};				
		};
			_wp = chase4 addWaypoint [getPos stingerTruck,0];
			_wp setWaypointType "MOVE";
			_wp setWaypointBehaviour "AWARE";
			_wp setWaypointCombatMode "RED";
			_wp setWaypointSpeed "FULL";
	
		if ((leader chase5) distance stingerTruck < 200) then {
			while {(count (waypoints chase5)) > 0} do {
					 deleteWaypoint ((waypoints chase5) select 0);
			};
		};
			_wp = chase5 addWaypoint [getPos stingerTruck,0];
			_wp setWaypointType "MOVE";
			_wp setWaypointBehaviour "AWARE";
			_wp setWaypointCombatMode "RED";
			_wp setWaypointSpeed "FULL";
		
			[chase6, 1] setWaypointPosition [getPos stingerTruck,0];
			
		sleep 25;
	};
};