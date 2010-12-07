if(isServer) then
{
	_point = _this select 0;
	_amount = _this select 1;	
	
	for "_x" from 2 to _amount+1 do {
		_forestGroup = createGroup east;
		_forestSoldier = _forestGroup createUnit ["GUE_Soldier_1",getMarkerPos _point,[],0.6,"Sergeant"];
		_fortification = "GUE_WarfareBMGNest_PK" createVehicle (getMarkerPos format ["%1d%2",_point,_x]);
		_fortification setDir (_this select _x);
		_forestSoldier moveInGunner _fortification;
	};
};