_point = _this select 0;
// init BIS funcs
waitUntil {!isNil "bis_fnc_init"};
swapWeapon = compile loadFile "swapWeapons.sqf";
swapWeapon = compile preprocessFile "swapWeapons.sqf";

_menCount = west countSide list baseTrigger;
player globalchat format ["%1", west countSide list baseTrigger];
_vehicleGroup = createGroup east;
_rand = (ceil random 3);
switch (_rand) do
	{
		case 1:
		{
			_tempSoldier1 = _vehicleGroup createUnit ["GUE_Soldier_Crew",getMarkerPos _point,[],0.6,"Sergeant"];
			_tempSoldier2 = _vehicleGroup createUnit ["GUE_Soldier_Crew",getMarkerPos _point,[],0.6,"Private"];
			_pwnmachine  = createVehicle ["BRDM2_Gue", getMarkerPos _point, [], 50, "FORM"];
			_tempSoldier1 moveInDriver _pwnmachine;
			_tempSoldier2 moveInGunner _pwnmachine;
			
			if (_menCount > 6) then {
				_myGroup = [getMarkerPos _point, EAST, ["GUE_Commander", "GUE_Soldier_Medic", "GUE_Soldier_MG", "GUE_Soldier_AR", "GUE_Soldier_AT", "GUE_Soldier_GL"],[],[],[0.8, 0.75, 0.6, 0.5, 0.7, 0.55],[],[],0] call BIS_fnc_spawnGroup;
				_myGroup2 = [getMarkerPos _point, EAST, ["GUE_Commander", "GUE_Soldier_2", "GUE_Soldier_3", "GUE_Soldier_AT", "GUE_Soldier_GL", "GUE_Soldier_2"],[],[],[0.8, 0.7, 0.65, 0.5, 0.55, 0.7],[],[],0] call BIS_fnc_spawnGroup;

				[_myGroup] spawn swapWeapon;
				[_myGroup2] spawn swapWeapon;
			
				_null = [leader _myGroup, _point,"random"] execVM "UPS.sqf";
				_null = [leader _myGroup2, _point,"random"] execVM "UPS.sqf";
			};
			if (_menCount <= 6) then {
				player globalchat "small group spawned!";
				_myGroup = [getMarkerPos _point, EAST, ["GUE_Commander", "GUE_Soldier_Medic", "GUE_Soldier_AR"],[],[],[0.8, 0.75, 0.5],[],[],0] call BIS_fnc_spawnGroup;
				_myGroup2 = [getMarkerPos _point, EAST, ["GUE_Commander", "GUE_Soldier_2", "GUE_Soldier_GL"],[],[],[0.8, 0.7, 0.55],[],[],0] call BIS_fnc_spawnGroup;

				[_myGroup] spawn swapWeapon;
				[_myGroup2] spawn swapWeapon;
			
				_null = [leader _myGroup, _point,"random"] execVM "UPS.sqf";
				_null = [leader _myGroup2, _point,"random"] execVM "UPS.sqf";
			};			
		};
		case 2:
		{
			_tempSoldier1 = _vehicleGroup createUnit ["GUE_Soldier_3",getMarkerPos _point,[],0.6,"Sergeant"];
			_tempSoldier2 = _vehicleGroup createUnit ["GUE_Soldier_1",getMarkerPos _point,[],0.6,"Private"];
			_pwnmachine  = createVehicle ["Offroad_SPG9_Gue", getMarkerPos _point, [], 50, "FORM"];
			_tempSoldier1 moveInDriver _pwnmachine;
			_tempSoldier2 moveInGunner _pwnmachine;

			if (_menCount > 6) then {
				_myGroup = [getMarkerPos _point, EAST, ["GUE_Commander", "GUE_Soldier_Medic", "GUE_Soldier_AT", "GUE_Soldier_AR", "GUE_Soldier_AA", "GUE_Soldier_GL"],[],[],[0.8, 0.76, 0.6, 0.5, 0.72, 0.7],[],[],0] call BIS_fnc_spawnGroup;
				_myGroup2 = [getMarkerPos _point, EAST, ["GUE_Commander", "GUE_Soldier_2", "GUE_Soldier_3", "GUE_Soldier_AT", "GUE_Soldier_GL", "GUE_Soldier_2"],[],[],[0.8, 0.7, 0.6, 0.65, 0.7, 0.55],[],[],0] call BIS_fnc_spawnGroup;
				[_myGroup] spawn swapWeapon;
				[_myGroup2] spawn swapWeapon;

				_null = [leader _myGroup, _point,"random"] execVM "UPS.sqf";
				_null = [leader _myGroup2, _point,"random"] execVM "UPS.sqf";
			};
			if (_menCount <= 6) then {
				player globalchat "small group spawned!";
				_myGroup = [getMarkerPos _point, EAST, ["GUE_Commander", "GUE_Soldier_AT", "GUE_Soldier_AA"],[],[],[0.8, 0.6, 0.72],[],[],0] call BIS_fnc_spawnGroup;
				_myGroup2 = [getMarkerPos _point, EAST, ["GUE_Soldier_2", "GUE_Soldier_3", "GUE_Soldier_GL"],[],[],[0.8, 0.7, 0.6, 0.65, 0.7, 0.55],[],[],0] call BIS_fnc_spawnGroup;

				[_myGroup] spawn swapWeapon;
				[_myGroup2] spawn swapWeapon;

				_null = [leader _myGroup, _point,"random"] execVM "UPS.sqf";
				_null = [leader _myGroup2, _point,"random"] execVM "UPS.sqf";
			};
		};
		case 3:
		{
			_tempSoldier1 = _vehicleGroup createUnit ["GUE_Soldier_3",getMarkerPos _point,[],0.6,"Sergeant"];
			_tempSoldier2 = _vehicleGroup createUnit ["GUE_Soldier_1",getMarkerPos _point,[],0.6,"Private"];
			_pwnmachine  = createVehicle ["Offroad_DSHKM_Gue", getMarkerPos _point, [], 50, "FORM"];
			_tempSoldier1 moveInDriver _pwnmachine;
			_tempSoldier2 moveInGunner _pwnmachine;

			if (_menCount > 6) then {
				_myGroup = [getMarkerPos _point, EAST, ["GUE_Commander", "GUE_Soldier_Sniper", "GUE_Soldier_MG", "GUE_Soldier_2", "GUE_Soldier_AT", "GUE_Soldier_GL"],[],[],[0.8, 0.75, 0.6, 0.5, 0.65, 0.7],[],[],0] call BIS_fnc_spawnGroup;
				_myGroup2 = [getMarkerPos _point, EAST, ["GUE_Commander", "GUE_Soldier_GL", "GUE_Soldier_3", "GUE_Soldier_AT", "GUE_Soldier_GL", "GUE_Soldier_2"],[],[],[0.82, 0.7, 0.6, 0.6, 0.65, 0.7],[],[],0] call BIS_fnc_spawnGroup;

				[_myGroup] spawn swapWeapon;
				[_myGroup2] spawn swapWeapon;

				_null = [leader _myGroup, _point,"random"] execVM "UPS.sqf";
				_null = [leader _myGroup2, _point,"random"] execVM "UPS.sqf";
			};
			if (_menCount <= 6) then {
				player globalchat "small group spawned!";
				_myGroup = [getMarkerPos _point, EAST, ["GUE_Commander", "GUE_Soldier_Sniper", "GUE_Soldier_MG"],[],[],[0.8, 0.7, 0.65],[],[],0] call BIS_fnc_spawnGroup;
				_myGroup2 = [getMarkerPos _point, EAST, ["GUE_Soldier_GL", "GUE_Soldier_3", "GUE_Soldier_AT"],[],[],[0.80, 0.6, 0.65],[],[],0] call BIS_fnc_spawnGroup;

				[_myGroup] spawn swapWeapon;
				[_myGroup2] spawn swapWeapon;

				_null = [leader _myGroup, _point,"random"] execVM "UPS.sqf";
				_null = [leader _myGroup2, _point,"random"] execVM "UPS.sqf";
			};			
		};
	};