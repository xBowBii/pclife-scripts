if(isServer) then
{
	_point = _this select 0;
	_amount = _this select 1;
	_forestGroup = createGroup east;
	_forestSoldier1 = _forestGroup createUnit ["GUE_Commander",getMarkerPos _point,[],0.8,"Sergeant"];
	_forestSoldier2 = _forestGroup createUnit ["GUE_Soldier_GL",getMarkerPos _point,[],0.6,"Private"];
	_forestSoldier2 = _forestGroup createUnit ["GUE_Soldier_2",getMarkerPos _point,[],0.6,"Private"];
	for "_x" from 1 to _amount do {
		_wp = _forestGroup addwaypoint [getMarkerPos format ["%1w%2",_point,_x],1];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointBehaviour "AWARE";
		_wp setWaypointCombatMode "RED";
	};
	_wpadd = _forestGroup addwaypoint [getMarkerPos _point, 0];
	_wpCycle = _forestGroup addwaypoint [getMarkerPos _point, 0];
	_wpCycle setWaypointType "CYCLE";
};