if(isServer) then
{
	_point = _this select 0;

	_myGrouptwo = createGroup west;
	_tempSoldier9 = _myGrouptwo createUnit ["CDF_Soldier_Crew",getMarkerPos _point,[],0.8,"Sergeant"];
	_tempSoldier10 = _myGrouptwo createUnit ["CDF_Soldier_Crew",getMarkerPos _point,[],0.8,"Private"];
	_brdm = "BRDM2_CDF" createVehicle (getMarkerPos _point);
	_tempSoldier9 moveInDriver _brdm;
	_tempSoldier10 moveInGunner _brdm;

	_myGroup = createGroup west;
	_tempSoldier = _myGroup createUnit ["CDF_Commander",getMarkerPos _point,[],0.8,"Sergeant"];
	_tempSoldier2 = _myGroup createUnit ["CDF_Soldier_MG",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier3 = _myGroup createUnit ["CDF_Soldier_RPG",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier4 = _myGroup createUnit ["CDF_Soldier_GL",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier5 = _myGroup createUnit ["CDF_Soldier",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier6 = _myGroup createUnit ["CDF_Soldier_MG",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier7 = _myGroup createUnit ["CDF_Soldier_GL",getMarkerPos _point,[],0.6,"Private"];
	_tempSoldier8 = _myGroup createUnit ["CDF_Soldier_RPG",getMarkerPos _point,[],0.6,"Private"];
	_null = [leader _myGroup, _point,"random"] execVM "UPS.sqf";
};
