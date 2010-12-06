if(isServer) then
{
	_point = _this select 0;
	_pointtwo = _this select 1;
	_dir = _this select 2;
	_dirtwo = _this select 3;
	_myGroup = createGroup west;
	_tempSoldier = _myGroup createUnit ["CDF_Soldier_Crew",getMarkerPos _point,[],0.8,"Sergeant"];
	_tempSoldier2 = _myGroup createUnit ["CDF_Soldier_Crew",getMarkerPos _point,[],0.8,"Private"];
	_myGrouptwo = createGroup west;
	_tempSoldier3 = _myGrouptwo createUnit ["CDF_Soldier_Crew",getMarkerPos _pointtwo,[],0.8,"Sergeant"];
	_tempSoldier4 = _myGrouptwo createUnit ["CDF_Soldier_Crew",getMarkerPos _pointtwo,[],0.8,"Private"];
	_tank = "M1A1" createVehicle (getMarkerPos _point);
	_tank setDir _dir;
	_tempSoldier moveInDriver _tank;
	_tempSoldier2 moveInGunner _tank;
	_tanktwo = "M1A1" createVehicle (getMarkerPos _pointtwo);
	_tanktwo setDir _dirtwo;
	_tempSoldier3 moveInDriver _tanktwo;
	_tempSoldier4 moveInGunner _tanktwo;
};
