if(isServer) then
{
	_point = _this select 0;
	_amount = _this select 1;
	_forestGroup = [getMarkerPos _point, EAST, ["GUE_Commander", "GUE_Soldier_GL", "GUE_Soldier_2"],[],[],[0.8, 0.65, 0.5],[],[],0] call BIS_fnc_spawnGroup;
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