execVM "briefing.sqf";

ace_wounds_prevtime = 60;
refreshCounter = compile loadFile "scripts\counter.sqf";
groupSpawner = compile preprocessFileLineNumbers "scripts\grpSpawner.sqf";
//squadSpawner = compile preprocessFileLineNumbers "scripts\spawnSquad.sqf";
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";

skiptime (((paramsArray select 0) - daytime + 24) % 24);

switch (paramsArray select 1) do {
  case 0: { 0 setOvercast 0; 0 setRain 0; };
  case 1: { 0 setOvercast 0.8; 0 setRain 0.3; };
  case 2: { 0 setOvercast 0.9; 0 setRain 0.6; };
  case 3: { 0 setOvercast 1; 0 setRain 1; };
};

switch (paramsArray select 2) do {
  case 0: { 0 setFog 0; };
  case 1: { 0 setFog 0.3; };
  case 2: { 0 setFog 0.6; };
  case 3: { 0 setFog 1; };
};

viewparam = (paramsArray select 3);
setViewDistance viewparam;

if (isServer) then {
_terroristCount = paramsArray select 5;
_groupCount = _terroristCount/10;
_groupsPerZone = ceil _groupCount/5;
  for "_i" from 0 to 4 do
  {
    _point = format ["patrol_%1", _i];
    for "_j" from 1 to _groupsPerZone do {
      _myGroup = [5,_point, ["ACE_TK_INS_Soldier_AKM_EP1", "TK_INS_Bonesetter_EP1", "TK_INS_Soldier_MG_EP1", "TK_INS_Soldier_AR_EP1", "ACE_TK_INS_Soldier_AKMS_EP1"]] call groupSpawner;
      sleep 0.3;
      _myGroup2 = [5,_point, ["TK_INS_Warlord_EP1", "TK_INS_Soldier_4_EP1", "TK_INS_Soldier_AAT_EP1", "TK_INS_Soldier_AT_EP1", "TK_INS_Soldier_2_EP1"]] call groupSpawner;
//      _null = [_point] call squadSpawner;
      sleep 0.3;
      _null = [leader _myGroup, _point,"random"] execVM "scripts\UPSMON.sqf";
			_null = [leader _myGroup2, _point,"random"] execVM "scripts\UPSMON.sqf";
    };
/*    _vehicleGroup = createGroup east;
    _tempSoldier1 = _vehicleGroup createUnit ["GUE_Soldier_Crew",getMarkerPos _point,[],0.995,"Sergeant"];
		_tempSoldier2 = _vehicleGroup createUnit ["GUE_Soldier_Crew",getMarkerPos _point,[],0.995,"Private"];
		_pwnmachine  = createVehicle ["BTR40_MG_TK_INS_EP1", getMarkerPos _point, [], 50, "FORM"];
		_tempSoldier1 moveInDriver _pwnmachine;
		_tempSoldier2 moveInGunner _pwnmachine;
*/
   };
};

if isserver then { 
_aiskill = paramsarray select 4;
  {
    call compile format ["_x setskill 0.%1",_aiskill];
  } foreach allunits;
};

lastCountedTime = time;
gTerroristCount = (paramsArray select 5) + 6;

//if (paramsArray select 8 == 4) then {player addEventHandler ["HIT",{(_this select 0) setDamage (0 * damage (_this select 0));}];};

[300,60] execVM "cly_removedead.sqf";

processInitCommands;
finishMissionInit;