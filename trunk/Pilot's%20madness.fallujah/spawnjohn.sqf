if (isServer) then {
	_point = p;
	_myGroup = createGroup west;
	john = _myGroup createUnit ["USMC_Soldier_MG",getMarkerPos _point,[],0.8,"Private"];
	if (typeOf (getpos john nearestObject "Land_Hangar_2") == "Land_Hangar_2") then {
		_building = getpos john nearestObject "Land_Hangar_2";
		john setPos (_building buildingPos 1);
	} else {
		_building = nearestBuilding john;
		john setPos (_building buildingPos 8);
	};
	john setcaptive true;
	removeallweapons john;
	john removeweapon "ItemRadio";
	john removeweapon "ItemMap";
	john removeweapon "ItemWatch";
	john removeweapon "ItemCompass"; 
	[john, 0.55] call ace_sys_wounds_fnc_addDamage;
	[john] joinSilent (group (leader rescuegrp));
	john disableAI "MOVE";
	tskobj4 setTaskState "Succeeded";
	tskobj3 setTaskState "Succeeded";
	player setCurrentTask tskobj1;
	_trgAlive=createTrigger["EmptyDetector",getMarkerPos "crash"];
	_trgAlive setTriggerArea[4,4,0,false];
	_trgAlive setTriggerActivation["NONE","PRESENT",false];
	_trgAlive setTriggerStatements["!(alive john)", "tskobj2 setTaskState 'Failed'; deleteVehicle john;", ""];
	tongue removeaction intAction;
};
