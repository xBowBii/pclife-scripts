//Spawns random attacking groups of enemies. Groups spawning at relative to _point markers with "a" suffix.
//i.e. for _point = "city1", script needs "city1a1", "city1a2" and so on markers.
//Syntax: [marker_where_attackers_should_go:string, amount_of_squads:int] execVM "spawnAttackers.sqf";

if(isServer) then
{
_point = _this select 0;
_spawn = _this select 1;

//_vehGroup = createGroup east;
//call compile format["_mygroup%1 createGroup east",_x];
//call compile format["_mygroup%1 createGroup east",_x];
_rand = (ceil random 3);
switch (_rand) do
	{
		case 1:
		{
			_myGroup = [getMarkerPos _spawn, EAST, ["GUE_Commander", "GUE_Soldier_Medic", "GUE_Soldier_MG", "GUE_Soldier_AR", "GUE_Soldier_AT", "GUE_Soldier_GL", "GUE_Soldier_2", "GUE_Soldier_3", "GUE_Soldier_AT", "GUE_Soldier_2", "GUE_Soldier_3"],[],[],[0.8, 0.7, 0.6, 0.50, 0.65, 0.55],[],[],0] call BIS_fnc_spawnGroup;
			[getMarkerPos _spawn, 180, "BRDM2_Gue", _myGroup] call bis_fnc_spawnvehicle;

//			_tempSoldier1 = _vehGroup createUnit ["GUE_Soldier_Crew",getMarkerPos _spawn,[],0.7,"Sergeant"];
//			_tempSoldier2 = _vehGroup createUnit ["GUE_Soldier_Crew",getMarkerPos _spawn,[],0.6,"Private"];
//			_pwnmachine = createVehicle ["BRDM2_Gue", getMarkerPos _spawn, [], 0, "FORM"];
//			_tempSoldier1 moveInDriver _pwnmachine;
//			_tempSoldier2 moveInGunner _pwnmachine;

			_wp = _myGroup addwaypoint [getMarkerPos _point,10];
			_wp setWaypointType "SAD";
//			_wp = _vehGroup addwaypoint [getMarkerPos _point,10];
//			_wp setWaypointType "SAD";
		};
		case 2:
		{
			_myGroup = [getMarkerPos _spawn, EAST, ["GUE_Commander", "GUE_Soldier_Medic", "GUE_Soldier_AT", "GUE_Soldier_AR", "GUE_Soldier_AA", "GUE_Soldier_GL", "GUE_Soldier_2", "GUE_Soldier_3", "GUE_Soldier_AT", "GUE_Soldier_GL", "GUE_Soldier_2", "GUE_Soldier_3"],[],[],[0.8, 0.7, 0.6, 0.50, 0.65, 0.6],[],[],0] call BIS_fnc_spawnGroup;
			[getMarkerPos _spawn, 180, "Offroad_SPG9_Gue", _myGroup] call bis_fnc_spawnvehicle;

			_wp = _myGroup addwaypoint [getMarkerPos _point,10];
			_wp setWaypointType "SAD";
		};
		case 3:
		{
			_myGroup = [getMarkerPos _spawn, EAST, ["GUE_Commander", "GUE_Soldier_Sniper", "GUE_Soldier_MG", "GUE_Soldier_2", "GUE_Soldier_AT", "GUE_Soldier_GL", "GUE_Soldier_GL", "GUE_Soldier_3", "GUE_Soldier_AT", "GUE_Soldier_GL", "GUE_Soldier_2","GUE_Soldier_3"],[],[],[0.8, 0.7, 0.6, 0.50, 0.65, 0.6],[],[],0] call BIS_fnc_spawnGroup;
			[getMarkerPos _spawn, 180, "Ural_ZU23_Gue", _myGroup] call bis_fnc_spawnvehicle;

			_wp = _myGroup addwaypoint [getMarkerPos _point,10];
			_wp setWaypointType "SAD";
		};
	};
};