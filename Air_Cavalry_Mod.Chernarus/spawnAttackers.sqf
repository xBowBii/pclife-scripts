//Spawns random attacking groups of enemies. Groups spawning at relative to _point markers with "a" suffix.
//i.e. for _point = "city1", script needs "city1a1", "city1a2" and so on markers.
//Syntax: [marker_where_attackers_should_go:string, amount_of_squads:int] execVM "spawnAttackers.sqf";

if(isServer) then
{
_point = _this select 0;
_spawn = _this select 1;

_myGroup = createGroup east;
//_vehicleGroup = createGroup east;
//call compile format["_mygroup%1 createGroup east",_x];
//call compile format["_mygroup%1 createGroup east",_x];
_rand = random 3;
_rand = ceil _rand;
switch (_rand) do
	{
		case 1:
		{
			_tempSoldier1 = _myGroup createUnit ["GUE_Commander",getMarkerPos _spawn,[],0.8,"Sergeant"];
			_tempSoldier2 = _myGroup createUnit ["GUE_Soldier_Medic",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier3 = _myGroup createUnit ["GUE_Soldier_MG",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier4 = _myGroup createUnit ["GUE_Soldier_AR",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier5 = _myGroup createUnit ["GUE_Soldier_AT",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier6 = _myGroup createUnit ["GUE_Soldier_GL",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier7 = _myGroup createUnit ["GUE_Soldier_2",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier8 = _myGroup createUnit ["GUE_Soldier_3",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier9 = _myGroup createUnit ["GUE_Soldier_AT",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier10 = _myGroup createUnit ["GUE_Soldier_GL",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier11 = _myGroup createUnit ["GUE_Soldier_2",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier12 = _myGroup createUnit ["GUE_Soldier_3",getMarkerPos _spawn,[],0.6,"Private"];

			_tempSoldier13 = _myGroup createUnit ["GUE_Soldier_Crew",getMarkerPos _spawn,[],0.6,"Sergeant"];
			_tempSoldier14 = _myGroup createUnit ["GUE_Soldier_Crew",getMarkerPos _spawn,[],0.6,"Private"];
			_pwnmachine = createVehicle ["BRDM2_Gue", getMarkerPos _spawn, [], 0, "FORM"];
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

			_wp = _myGroup addwaypoint [getMarkerPos _point,10];
			_wp setWaypointType "SAD";
		};
		case 2:
		{
			_tempSoldier1 = _myGroup createUnit ["GUE_Commander",getMarkerPos _spawn,[],0.8,"Sergeant"];
			_tempSoldier2 = _myGroup createUnit ["GUE_Soldier_Medic",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier3 = _myGroup createUnit ["GUE_Soldier_AT",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier4 = _myGroup createUnit ["GUE_Soldier_AR",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier5 = _myGroup createUnit ["GUE_Soldier_AA",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier6 = _myGroup createUnit ["GUE_Soldier_GL",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier7 = _myGroup createUnit ["GUE_Soldier_2",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier8 = _myGroup createUnit ["GUE_Soldier_3",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier9 = _myGroup createUnit ["GUE_Soldier_AT",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier10 = _myGroup createUnit ["GUE_Soldier_GL",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier11 = _myGroup createUnit ["GUE_Soldier_2",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier12 = _myGroup createUnit ["GUE_Soldier_3",getMarkerPos _spawn,[],0.6,"Private"];

			_tempSoldier13 = _myGroup createUnit ["GUE_Soldier_3",getMarkerPos _spawn,[],0.6,"Sergeant"];
			_tempSoldier14 = _myGroup createUnit ["GUE_Soldier_1",getMarkerPos _spawn,[],0.6,"Private"];
			_pwnmachine = createVehicle ["Offroad_SPG9_Gue", getMarkerPos _spawn, [], 0, "FORM"];
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

			_wp = _myGroup addwaypoint [getMarkerPos _point,10];
			_wp setWaypointType "SAD";
		};
		case 3:
		{
			_tempSoldier1 = _myGroup createUnit ["GUE_Commander",getMarkerPos _spawn,[],0.8,"Sergeant"];
			_tempSoldier2 = _myGroup createUnit ["GUE_Soldier_Sniper",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier3 = _myGroup createUnit ["GUE_Soldier_MG",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier4 = _myGroup createUnit ["GUE_Soldier_2",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier5 = _myGroup createUnit ["GUE_Soldier_AT",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier6 = _myGroup createUnit ["GUE_Soldier_GL",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier7 = _myGroup createUnit ["GUE_Soldier_GL",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier8 = _myGroup createUnit ["GUE_Soldier_3",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier9 = _myGroup createUnit ["GUE_Soldier_AT",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier10 = _myGroup createUnit ["GUE_Soldier_GL",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier11 = _myGroup createUnit ["GUE_Soldier_2",getMarkerPos _spawn,[],0.6,"Private"];
			_tempSoldier12 = _myGroup createUnit ["GUE_Soldier_3",getMarkerPos _spawn,[],0.6,"Private"];

			_tempSoldier13 = _myGroup createUnit ["GUE_Soldier_3",getMarkerPos _spawn,[],0.6,"Sergeant"];
			_tempSoldier14 = _myGroup createUnit ["GUE_Soldier_1",getMarkerPos _spawn,[],0.6,"Private"];
			_pwnmachine = createVehicle ["Ural_ZU23_Gue", getMarkerPos _spawn, [], 0, "FORM"];
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
			
			_wp = _myGroup addwaypoint [getMarkerPos _point,10];
			_wp setWaypointType "SAD";
		};
	};
};