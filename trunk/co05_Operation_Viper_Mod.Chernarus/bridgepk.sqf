if(isServer) then
{
	_point = _this select 0;
	_dgun = _this select 1;
	_myGroup = createGroup west;
	_tempSoldier = _myGroup createUnit ["CDF_Soldier_Militia",getMarkerPos _point,[],0.8,"Sergeant"];
	_gun = "CDF_WarfareBMGNest_PK" createVehicle (getMarkerPos _point);
	_gun setDir _dgun;
	_tempSoldier moveInGunner _gun;
};
