if(isServer) then
{
	_point = _this select 0;
	_rand = random 1;
	if (_rand <= 0.6) then {
		_myGroup = createGroup west;
		_tempSoldier = _myGroup createUnit ["CDF_Commander",getMarkerPos _point,[],0.8,"Sergeant"];
		_tempSoldier2 = _myGroup createUnit ["CDF_Soldier_MG",getMarkerPos _point,[],0.6,"Private"];
		_tempSoldier3 = _myGroup createUnit ["CDF_Soldier_RPG",getMarkerPos _point,[],0.6,"Private"];
		_tempSoldier4 = _myGroup createUnit ["CDF_Soldier_GL",getMarkerPos _point,[],0.6,"Private"];
		_tempSoldier5 = _myGroup createUnit ["CDF_Soldier",getMarkerPos _point,[],0.6,"Private"];
		_tempSoldier6 = _myGroup createUnit ["CDF_Soldier_GL",getMarkerPos _point,[],0.6,"Private"];
		_tempSoldier7 = _myGroup createUnit ["CDF_Soldier",getMarkerPos _point,[],0.6,"Private"];
		_tempSoldier8 = _myGroup createUnit ["CDF_Soldier_GL",getMarkerPos _point,[],0.6,"Private"];

		sleep 0.1;

		_truck = "UralOpen_CDF" createVehicle (getMarkerPos _point);
		_tempSoldier moveInDriver _truck;
		_tempSoldier2 moveInCargo _truck;
		_tempSoldier3 moveInCargo _truck;
		_tempSoldier4 moveInCargo _truck;
		_tempSoldier5 moveInCargo _truck;
		_tempSoldier6 moveInCargo _truck;
		_tempSoldier7 moveInCargo _truck;
		_tempSoldier8 moveInCargo _truck;

		wp = _myGroup addwaypoint [position player];
		wp setWaypointType "SAD";
		wp setWaypointSpeed "FULL";
	};
};
