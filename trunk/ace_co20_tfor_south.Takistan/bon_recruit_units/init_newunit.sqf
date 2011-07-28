_unit = _this select 0;

/*****************************************************************
	following section to run only on server.
	Note: duplicate respective code in the pve in the init.sqf
******************************************************************/
if(isServer) then{
	[_unit] execFSM (BON_RECRUIT_PATH+"unit_lifecycle.fsm");
} else {
	bon_recruit_newunit = _unit;
	publicVariable "bon_recruit_newunit";
};




/*****************************************************************
	Client Stuff
******************************************************************/
_unit addAction ["<t color='#949494'>Dismiss</t>",BON_RECRUIT_PATH+"dismiss.sqf",[],-10,false,true,""];

_unit disableConversation true;

[_unit] execFSM "fsm\vehicledrivercheck.fsm";
//[_unit] execVM "bon_ais\init_ais.sqf";

// remove sidearm because of this stupid stuck bug
{
	if (getNumber(configFile >> "CfgWeapons" >> _x >> "type") == 2) then {
		_unit removeWeapon _x;
	};
} foreach weapons _unit;


While{alive _unit && tfor_markersystem > 0} do{
	_marker = createMarkerLocal [name _unit,position _unit];
	_marker setMarkerTypeLocal "mil_dot";
	_marker setMarkerColorLocal "ColorOrange";
	_marker setMarkerSizeLocal [0.75,0.75];
	sleep 2;
	deleteMarkerLocal _marker;
};