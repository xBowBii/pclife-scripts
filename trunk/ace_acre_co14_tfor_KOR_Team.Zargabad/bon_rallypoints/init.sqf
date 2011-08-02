// by Bon_Inf*


BON_SPAWN_PATH = "bon_rallypoints\";


bon_rallytype = tfor_rallypoint_type;

spawnDialogUpdate = compile (preprocessFileLineNumbers (BON_SPAWN_PATH+"func_spawndlgUpdate.sqf"));
sleep 0.1;
bon_rallypoint = ObjNull;
if(isNil "tfor_mash") then{tfor_mash = ObjNull};

if(tfor_rallypoints == 2) then {bon_rallypoint_action = player addAction ["Deploy Rallypoint",BON_SPAWN_PATH+"deployrally.sqf",[],-1,false,true,"",""]};

player addEventHandler ["Killed",{
	[] spawn {
		WaitUntil{alive player};
		player removeAction bon_rallypoint_action;
		if(isNull bon_rallypoint && tfor_rallypoints == 2) then {
			bon_rallypoint_action = player addAction ["Deploy Rallypoint",BON_SPAWN_PATH+"deployrally.sqf",[],-1,false,true,"",""];
		};
		if(not isNull bon_rallypoint || count (getMarkerPos "tfor_fop_marker" - [0]) != 0 || not isNull tfor_mash) then {[] execVM (BON_SPAWN_PATH+"opendialog.sqf")};
	};
}];