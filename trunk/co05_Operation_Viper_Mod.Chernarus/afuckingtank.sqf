if(isServer) then
{
	_AFuckingTankPoint = _this select 0;
        _AndAFuckingTankCrewPointBecauseDerp = _this select 1;
	_AFuckingDirOfFuckingTank = _this select 2;
	_AFuckingGroupForFuckingTank = createGroup west;
	_FuckingCrewOfTank = _AFuckingGroupForFuckingTank createUnit ["CDF_Soldier_Crew",getMarkerPos _AndAFuckingTankCrewPointBecauseDerp,[],0.8,"Sergeant"];
	_FuckingCrewOfTank2 = _AFuckingGroupForFuckingTank createUnit ["CDF_Soldier_Crew",getMarkerPos _AndAFuckingTankCrewPointBecauseDerp,[],0.8,"Private"];
	_FuckingTank = "ACE_T72B_CDF" createVehicle (getMarkerPos _AFuckingTankPoint);
	_FuckingTank setDir _AFuckingDirOfFuckingTank;
	_FuckingTank setFuel 0;
	_FuckingCrewOfTank moveInDriver _FuckingTank;
	_FuckingCrewOfTank2 moveInGunner _FuckingTank;
};