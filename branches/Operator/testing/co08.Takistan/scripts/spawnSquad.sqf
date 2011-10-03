_point = _this select 0;
// init BIS funcs
waitUntil {!isNil "bis_fnc_init"};

//_rand = (ceil random 3);
_rand = 1;
switch (_rand) do
	{
		case 1:
		{
//				_myGroup = [getMarkerPos _point, EAST, ["ACE_TK_INS_Soldier_AKM_EP1", "TK_INS_Bonesetter_EP1", "TK_INS_Soldier_MG_EP1", "TK_INS_Soldier_AR_EP1", "ACE_TK_INS_Soldier_AKMS_EP1"],[],[],[0.995, 0.75, 0.7, 0.7, 0.8],[],[],0] call BIS_fnc_spawnGroup;
//				_myGroup2 = [getMarkerPos _point, EAST, ["TK_INS_Warlord_EP1", "TK_INS_Soldier_4_EP1", "TK_INS_Soldier_AAT_EP1", "TK_INS_Soldier_AT_EP1", "TK_INS_Soldier_2_EP1"],[],[],[0.995, 0.7, 0.75, 0.7, 0.75],[],[],0] call BIS_fnc_spawnGroup;

        _myGroup = [5,_point, ["ACE_TK_INS_Soldier_AKM_EP1", "TK_INS_Bonesetter_EP1", "TK_INS_Soldier_MG_EP1", "TK_INS_Soldier_AR_EP1", "ACE_TK_INS_Soldier_AKMS_EP1"]] call groupSpawner;
				_myGroup2 = [5,_point, ["TK_INS_Warlord_EP1", "TK_INS_Soldier_4_EP1", "TK_INS_Soldier_AAT_EP1", "TK_INS_Soldier_AT_EP1", "TK_INS_Soldier_2_EP1"]] call groupSpawner;
				
//				_null = [leader _myGroup, _point,"random"] execVM "scripts\UPS.sqf";
//				_null = [leader _myGroup2, _point,"random"] execVM "scripts\UPS.sqf";

//				_null = [leader _myGroup, _point,"random"] execVM "scripts\UPSMON.sqf";
//				_null = [leader _myGroup2, _point,"random"] execVM "scripts\UPSMON.sqf";
		};
		case 2:
		{
				_myGroup = [getMarkerPos _point, EAST, ["TK_INS_Warlord_EP1", "TK_INS_Soldier_EP1", "TK_INS_Bonesetter_EP1", "TK_INS_Soldier_Sniper_EP1", "TK_INS_Soldier_AR_EP1"],[],[],[0.995, 0.76, 0.8, 0.5, 0.72],[],[],0] call BIS_fnc_spawnGroup;
				_myGroup2 = [getMarkerPos _point, EAST, ["TK_INS_Soldier_TL_EP1", "TK_INS_Soldier_AT_EP1", "TK_INS_Soldier_AR_EP1", "TK_INS_Soldier_4_EP1", "ACE_TK_INS_Soldier_AKMS_EP1"],[],[],[0.995, 0.7, 0.7, 0.75, 0.7],[],[],0] call BIS_fnc_spawnGroup;
//				[_myGroup] spawn addEH;
//				[_myGroup2] spawn addEH;

				_null = [leader _myGroup, _point,"random"] execVM "UPS.sqf";
				_null = [leader _myGroup2, _point,"random"] execVM "UPS.sqf";
		};
		case 3:
		{
				_myGroup = [getMarkerPos _point, EAST, ["TK_INS_Warlord_EP1", "TK_INS_Soldier_2_EP1", "ACE_TK_INS_Soldier_AKM_EP1", "TK_INS_Soldier_MG_EP1", "TK_INS_Soldier_Sniper_EP1"],[],[],[0.995, 0.75, 0.8, 0.7, 0.75],[],[],0] call BIS_fnc_spawnGroup;
				_myGroup2 = [getMarkerPos _point, EAST, ["TK_INS_Soldier_TL_EP1", "TK_INS_Soldier_MG_EP1", "TK_INS_Soldier_4_EP1", "TK_INS_Soldier_AT_EP1", "TK_INS_Soldier_EP1"],[],[],[0.995, 0.7, 0.8, 0.7, 0.75],[],[],0] call BIS_fnc_spawnGroup;

//				[_myGroup] spawn addEH;
//				[_myGroup2] spawn addEH;

				_null = [leader _myGroup, _point,"random"] execVM "UPS.sqf";
				_null = [leader _myGroup2, _point,"random"] execVM "UPS.sqf";
		};
	};