if(isServer) then
{
_point = _this select 0;
_myGroup = createGroup east;
_vehicleGroup = createGroup east;
_rand = random 3;
_rand = ceil _rand;
switch (_rand) do
	{
		case 1:
		{
			_tempSoldier1 = _myGroup createUnit ["GUE_Commander",getMarkerPos _point,[],0.8,"Sergeant"];
			_tempSoldier2 = _myGroup createUnit ["GUE_Soldier_Medic",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier3 = _myGroup createUnit ["GUE_Soldier_MG",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier4 = _myGroup createUnit ["GUE_Soldier_AR",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier5 = _myGroup createUnit ["GUE_Soldier_AT",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier6 = _myGroup createUnit ["GUE_Soldier_GL",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier7 = _myGroup createUnit ["GUE_Soldier_2",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier8 = _myGroup createUnit ["GUE_Soldier_3",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier9 = _myGroup createUnit ["GUE_Soldier_AT",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier10 = _myGroup createUnit ["GUE_Soldier_GL",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier11 = _myGroup createUnit ["GUE_Soldier_2",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier12 = _myGroup createUnit ["GUE_Soldier_3",getMarkerPos _point,[],0.6,"Private"];

			_tempSoldier13 = _vehicleGroup createUnit ["GUE_Soldier_Crew",getMarkerPos _point,[],0.6,"Sergeant"];
			_tempSoldier14 = _vehicleGroup createUnit ["GUE_Soldier_Crew",getMarkerPos _point,[],0.6,"Private"];
			_pwnmachine  = createVehicle ["BRDM2_Gue", getMarkerPos _point, [], 50, "FORM"];
			_tempSoldier13 moveInDriver _pwnmachine;
			_tempSoldier14 moveInGunner _pwnmachine;

			removeAllWeapons _tempSoldier7;
			for "_x" from 1 to 6 do {_tempSoldier7 addMagazine "30Rnd_762x39_AK47"};
			_tempSoldier7 addWeapon "ACE_AKM";
			_tempSoldier7 addMagazine "HandGrenade_West";

			removeAllWeapons _tempSoldier8;
			for "_x" from 1 to 6 do {_tempSoldier8 addMagazine "30Rnd_762x39_AK47"};
			_tempSoldier8 addWeapon "ACE_AKM";
			_tempSoldier8 addMagazine "HandGrenade_West";
		};
		case 2:
		{
			_tempSoldier1 = _myGroup createUnit ["GUE_Commander",getMarkerPos _point,[],0.8,"Sergeant"];
			_tempSoldier2 = _myGroup createUnit ["GUE_Soldier_Medic",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier3 = _myGroup createUnit ["GUE_Soldier_AT",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier4 = _myGroup createUnit ["GUE_Soldier_AR",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier5 = _myGroup createUnit ["GUE_Soldier_AA",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier6 = _myGroup createUnit ["GUE_Soldier_GL",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier7 = _myGroup createUnit ["GUE_Soldier_2",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier8 = _myGroup createUnit ["GUE_Soldier_3",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier9 = _myGroup createUnit ["GUE_Soldier_AT",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier10 = _myGroup createUnit ["GUE_Soldier_GL",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier11 = _myGroup createUnit ["GUE_Soldier_2",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier12 = _myGroup createUnit ["GUE_Soldier_3",getMarkerPos _point,[],0.6,"Private"];

			_tempSoldier13 = _vehicleGroup createUnit ["GUE_Soldier_3",getMarkerPos _point,[],0.6,"Sergeant"];
			_tempSoldier14 = _vehicleGroup createUnit ["GUE_Soldier_1",getMarkerPos _point,[],0.6,"Private"];
			_pwnmachine  = createVehicle ["Offroad_SPG9_Gue", getMarkerPos _point, [], 50, "FORM"];
			_tempSoldier13 moveInDriver _pwnmachine;
			_tempSoldier14 moveInGunner _pwnmachine;

			removeAllWeapons _tempSoldier7;
			for "_x" from 1 to 6 do {_tempSoldier7 addMagazine "30Rnd_762x39_AK47"};
			_tempSoldier7 addWeapon "ACE_AKM";
			_tempSoldier7 addMagazine "HandGrenade_West";

			removeAllWeapons _tempSoldier8;
			for "_x" from 1 to 6 do {_tempSoldier8 addMagazine "30Rnd_762x39_AK47"};
			_tempSoldier8 addWeapon "ACE_AKM";
			_tempSoldier8 addMagazine "HandGrenade_West";
		};
		case 3:
		{
			_tempSoldier1 = _myGroup createUnit ["GUE_Commander",getMarkerPos _point,[],0.8,"Sergeant"];
			_tempSoldier2 = _myGroup createUnit ["GUE_Soldier_Sniper",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier3 = _myGroup createUnit ["GUE_Soldier_MG",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier4 = _myGroup createUnit ["GUE_Soldier_2",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier5 = _myGroup createUnit ["GUE_Soldier_AT",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier6 = _myGroup createUnit ["GUE_Soldier_GL",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier7 = _myGroup createUnit ["GUE_Soldier_GL",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier8 = _myGroup createUnit ["GUE_Soldier_3",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier9 = _myGroup createUnit ["GUE_Soldier_AT",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier10 = _myGroup createUnit ["GUE_Soldier_GL",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier11 = _myGroup createUnit ["GUE_Soldier_2",getMarkerPos _point,[],0.6,"Private"];
			_tempSoldier12 = _myGroup createUnit ["GUE_Soldier_3",getMarkerPos _point,[],0.6,"Private"];

			_tempSoldier13 = _vehicleGroup createUnit ["GUE_Soldier_3",getMarkerPos _point,[],0.6,"Sergeant"];
			_tempSoldier14 = _vehicleGroup createUnit ["GUE_Soldier_1",getMarkerPos _point,[],0.6,"Private"];
			_pwnmachine  = createVehicle ["Pickup_PK_GUE", getMarkerPos _point, [], 50, "FORM"];
			_tempSoldier13 moveInDriver _pwnmachine;
			_tempSoldier14 moveInGunner _pwnmachine;

			removeAllWeapons _tempSoldier4;
			for "_x" from 1 to 6 do {_tempSoldier4 addMagazine "30Rnd_762x39_AK47"};
			_tempSoldier4 addWeapon "ACE_AKM";
			_tempSoldier4 addMagazine "HandGrenade_West";

			removeAllWeapons _tempSoldier8;
			for "_x" from 1 to 6 do {_tempSoldier8 addMagazine "30Rnd_762x39_AK47"};
			_tempSoldier8 addWeapon "ACE_AKM";
			_tempSoldier8 addMagazine "HandGrenade_West";
		};
	};
_null = [leader _myGroup, _point,"random"] execVM "UPS.sqf";
};