if(isServer) then
{
	_afuckingtankpoint = _this select 0;
        _andafuckingtankcrewpointbecausederp = _this select 1;
	_afuckingdiroffuckingtank = _this select 2;
	_myGroup = createGroup west;
	_fuckingcrewoftank = _myGroup createUnit ["CDF_Soldier_Crew",getMarkerPos _andafuckingtankcrewpointbecausederp,[],0.8,"Sergeant"];
	_fuckingcrewoftank2 = _myGroup createUnit ["CDF_Soldier_Crew",getMarkerPos _andafuckingtankcrewpointbecausederp,[],0.8,"Private"];
	_fuckingtank = "ACE_T72B_CDF" createVehicle (getMarkerPos _afuckingtankpoint);
	_fuckingtank setDir _afuckingdiroffuckingtank;
	_fuckingtank setFuel 0;
	_fuckingcrewoftank moveInDriver _fuckingtank;
	_fuckingcrewoftank2 moveInGunner _fuckingtank;
};