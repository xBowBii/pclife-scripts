while {((not isnull stingerTruck) and (isEngineOn stingerTruck))} do {

		player sidechat "reinforcements waypoint updated";
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
	
		if ((leader chase6) distance stingerTruck < 200) then {
			while {(count (waypoints chase6)) > 0} do {
					 deleteWaypoint ((waypoints chase6) select 0);
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