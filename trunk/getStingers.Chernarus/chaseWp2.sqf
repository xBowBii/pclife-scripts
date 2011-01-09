if (getWPPos [chase1,1] in enemyFob) then {
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
};

while {((not isnull stingerTruck) and (isEngineOn stingerTruck))} do {
	if (not (getPos stingerTruck in enemyFob)) then {
		player sidechat "waypoint updated";
		if ((leader chase1) distance stingerTruck < 200) then {
			while {(count (waypoints chase1)) > 0} do {
					 deleteWaypoint ((waypoints chase1) select 0);
			};				
		};
			_wp = chase1 addWaypoint [getPos stingerTruck,0];
			_wp setWaypointType "MOVE";
			_wp setWaypointBehaviour "AWARE";
			_wp setWaypointCombatMode "RED";
			_wp setWaypointSpeed "FULL";
	
		if ((leader chase2) distance stingerTruck < 200) then {
			while {(count (waypoints chase2)) > 0} do {
					 deleteWaypoint ((waypoints chase2) select 0);
			};
		};
			_wp = chase2 addWaypoint [getPos stingerTruck,0];
			_wp setWaypointType "MOVE";
			_wp setWaypointBehaviour "AWARE";
			_wp setWaypointCombatMode "RED";
			_wp setWaypointSpeed "FULL";
		
		if ((leader chase3) distance stingerTruck < 200) then {
			while {(count (waypoints chase3)) > 0} do {
					 deleteWaypoint ((waypoints chase3) select 0);
			};
		};
			_wp = chase3 addWaypoint [getPos stingerTruck,0];
			_wp setWaypointType "MOVE";
			_wp setWaypointBehaviour "AWARE";
			_wp setWaypointCombatMode "RED";
			_wp setWaypointSpeed "FULL";

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
			
		sleep 25;
	};
};