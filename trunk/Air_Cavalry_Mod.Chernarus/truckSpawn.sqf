if(isServer) then
{
_point = _this select 1;
_dest = _this select 0;
_rand = random 1;
if (_rand <= 0.7) then {
/*	_myGroup = createGroup resistance;
	_tempSoldier1 = _myGroup createUnit ["GUE_Commander",getMarkerPos _point,[],0.8,"Sergeant"];
	_tempSoldier2 = _myGroup createUnit ["GUE_Soldier_Medic",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier3 = _myGroup createUnit ["GUE_Soldier_MG",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier4 = _myGroup createUnit ["GUE_Soldier_AR",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier5 = _myGroup createUnit ["GUE_Soldier_AT",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier6 = _myGroup createUnit ["GUE_Soldier_GL",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier7 = _myGroup createUnit ["GUE_Soldier_2",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier8 = _myGroup createUnit ["GUE_Soldier_3",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier9 = _myGroup createUnit ["GUE_Soldier_2",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier10 = _myGroup createUnit ["GUE_Soldier_3",getMarkerPos _point,[],0.6,"Private"];
*/
	_myGroup = [getMarkerPos _point, EAST, ["GUE_Commander", "GUE_Soldier_Medic", "GUE_Soldier_MG", "GUE_Soldier_AR", "GUE_Soldier_AT", "GUE_Soldier_GL", "GUE_Soldier_2", "GUE_Soldier_3", "GUE_Soldier_2", "GUE_Soldier_AR", "GUE_Soldier_AT"],[],[],[0.8, 0.75, 0.6, 0.5, 0.7, 0.55, 0.6, 0.65, 0.6, 0.7, 0.64],[],[],0] call BIS_fnc_spawnGroup;

	sleep 0.1;

	_truck = createVehicle ["V3S_Gue", getMarkerPos _point, [], 0, "FORM"];
	_driver = _driverGroup createUnit ["GUE_Soldier_2",getMarkerPos _point,[],0.6,"Private"];
	sleep 0.1;
	_driver moveInDriver _truck;
	{_x moveincargo _truck} foreach units _myGroup;

/*	_tempSoldier1 moveInDriver _truck;
	_tempSoldier2 moveInCargo _truck;
	_tempSoldier3 moveInCargo _truck;
	_tempSoldier4 moveInCargo _truck;
	_tempSoldier5 moveInCargo _truck;
	_tempSoldier6 moveInCargo _truck;
	_tempSoldier7 moveInCargo _truck;
	_tempSoldier8 moveInCargo _truck;
	_tempSoldier9 moveInCargo _truck;
	_tempSoldier10 moveInCargo _truck;
*/
	wp = _driverGroup addwaypoint [getMarkerPos _dest, 0];
	wp setWaypointType "SAD";
	wp setWaypointSpeed "FULL";

	_myGroup2 = createGroup east;
	_tempSoldier01 = _myGroup2 createUnit ["GUE_Commander",getMarkerPos _point,[],0.8,"Sergeant"];
	_tempSoldier02 = _myGroup2 createUnit ["GUE_Soldier_GL",getMarkerPos _point,[],0.6,"Private"];

	_zu = createVehicle ["Ural_ZU23_Gue", getMarkerPos _point, [], 0, "FORM"];
	_tempSoldier01 moveInDriver _zu;
	_tempSoldier02 moveInGunner _zu;

	 wp1 = _myGroup2 addwaypoint [getMarkerPos _dest, 0];
	 wp1 setWaypointType "SAD";
	 wp1 setWaypointSpeed "FULL";
	};
};