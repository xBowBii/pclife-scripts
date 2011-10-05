while {alive player} do 
{
	_unit=player;
	if (!isNil {player getVariable "spectating"}) then {_unit=player getVariable "spectating"};
	sleep 0.5;
	waitUntil {!CLY_cutscene};
	if (true) then {
		cutRsc ["hud2","PLAIN"];
		_ui=uiNamespace getVariable "hud2";
		_hud=_ui displayCtrl 23501;
		_hud ctrlSetPosition [safeZoneX+0.4,safeZoneY+safeZoneH-0.08];
		_HP="";
		if (damage _unit<0.1) then {3 cutRsc["HealthFull", "PLAIN"];_HP="HealthFull.jpg";};
		if (damage _unit>0.1) then {3 cutRsc["Health90", "PLAIN"];_HP="Health90.jpg";};
		if (damage _unit>0.2) then {3 cutRsc["Health80", "PLAIN"];_HP="Health80.jpg";};
		if (damage _unit>0.3) then {3 cutRsc["Health70", "PLAIN"];_HP="Health70.jpg";};
		if (damage _unit>0.4) then {3 cutRsc["Health60", "PLAIN"];_HP="Health60.jpg";};
		if (damage _unit>0.5) then {3 cutRsc["Health50", "PLAIN"];_HP="Health50.jpg";};
		if (damage _unit>0.6) then {3 cutRsc["Health40", "PLAIN"];_HP="Health40.jpg";};
		if (damage _unit>0.7) then {3 cutRsc["Health30", "PLAIN"];_HP="Health30.jpg";};
		if (damage _unit>0.8) then {3 cutRsc["Health20", "PLAIN"];_HP="Health20.jpg";};
		if (damage _unit>0.9) then {3 cutRsc["Health10", "PLAIN"];_HP="Health10.jpg";};
		if !(alive _unit) then {3 cutRsc["Health10", "PLAIN"];_HP="Health0.jpg";};
		if (damage _unit==1) then {3 cutRsc["Health0", "PLAIN"];_HP="Health0.jpg";};
		if (damage _unit>1) then {3 cutRsc["Health0", "PLAIN"];_HP="Health0.jpg";};
		_hud ctrlSetText _HP;
		_hud ctrlCommit 0;
		sleep 1.5;
	};
};