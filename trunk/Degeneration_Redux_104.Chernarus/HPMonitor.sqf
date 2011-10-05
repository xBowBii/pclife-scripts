disableSerialization;
while {alive player} do 
{
	_unit=player;
	sleep 0.5;
	if (true) then {
		3 cutRsc ["hud2","PLAIN"];
		_ui=uiNamespace getVariable "hud2";
		_hud=_ui displayCtrl 23501;
		_hud ctrlSetPosition [safeZoneX+SafeZoneW-.95,safeZoneY+safeZoneH-0.15];
		_HP="";
		if (damage _unit==0) then {_HP="HealthFull.jpg";};
		if (damage _unit<=0.1) then {_HP="HealthFull.jpg";};
		if (damage _unit>=0.1) then {_HP="Health90.jpg";};
		if (damage _unit>=0.2) then {_HP="Health80.jpg";};
		if (damage _unit>=0.3) then {_HP="Health70.jpg";};
		if (damage _unit>=0.4) then {_HP="Health60.jpg";};
		if (damage _unit>=0.5) then {_HP="Health50.jpg";};
		if (damage _unit>=0.6) then {_HP="Health40.jpg";};
		if (damage _unit>=0.7) then {_HP="Health30.jpg";};
		if (damage _unit>=0.8) then {_HP="Health20.jpg";};
		if (damage _unit>=0.9) then {_HP="Health10.jpg";};
		if !(alive _unit) then {_HP="Health0.jpg";};
		if (damage _unit==1) then {_HP="Health0.jpg";};
		if (damage _unit>=1) then {_HP="Health0.jpg";};
		_hud ctrlSetText _HP;
		_hud ctrlCommit 0;
		sleep 1;
	};
	sleep 1;
};