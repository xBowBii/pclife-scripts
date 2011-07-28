

_logic = _this select 0;
_leader = _this select 1;



//--- HC main is laready running
_isMain = true; //if (_logic == BIS_HC_mainscope) then {true} else {false};

//--- Code executed only on first HC scope
if (_isMain) then {
	//SPACE selects last unit that reported, variables:
	HC_lastUnitReporting	 = []; //hc unit - array of groups
	HC_lastUnitReportingTime = 0;
	HC_lastUnitReportingMarkerName = "";
	HC_lastUnitReportingTimeMax = 45; //no older reports than this from teams are considered
	_logic setvariable ["sound",false];

	//--- Execute MARTA
	if (isNil "BIS_MARTA_mainScope") then
	{//create MARTA only once, avoid creating too much groups
		activateaddons ["CA_Modules_Marta"];	  
		_logicMARTA =(group _logic) createunit ["MartaManager",position player,[],0,"none"];
		//BIS_MARTA_mainScope = _logicMARTA; //TODO: look at this (it is here because init handler of marta (setting BIS_MARTA_mainScope) runs maybe too late (after initialization of whole WF)
	};

	//waituntil {count (BIS_marta_mainscope getvariable "allgroups") > 0};
	//_logicMARTA = BIS_marta_mainscope;
};

//--- Scope name
for "_i" from 0 to 1000 do {
	_name = format ["BIS_HC_%1",_i];
	if (isnil _name) exitwith {call compile format ["%1 = _logic",_name]};
};


_leader setvariable ["BIS_HC_scope",_logic,true];
_logic setVariable ["HC_commander",_leader,true];

player setvariable ["BIS_HC_scope",_logic,false];


//--- Functions are loaded
waituntil {!isnil "BIS_fnc_init"};


//--- Get custom params ----------------------------------------------------------------------------------


// obsolete. still used. great BIS!
_logic setvariable ["addAllGroups",true];

//--- Radio activations
_radios = if (isnil {_logic getvariable "radios"}) then {[]} else {_logic getvariable "radios"};
_logic setvariable ["radios",_radios];

//--- Chain of Command
_coc = if (isnil {_logic getvariable "chainofcommand"}) then {false} else {_logic getvariable "chainofcommand"};
_logic setvariable ["chainofcommand",_coc];

//--- Task created
_onTaskCreated = if (isnil {_logic getvariable "onTaskCreated"}) then {{}} else {_logic getvariable "onTaskCreated"};
_logic setvariable ["onTaskCreated",_onTaskCreated];

//--- Task assigned
_onTaskAssigned = if (isnil {_logic getvariable "onTaskAssigned"}) then {{}} else {_logic getvariable "onTaskAssigned"};
_logic setvariable ["onTaskAssigned",_onTaskAssigned];




//--- group assigning
_groups = allgroups - [group _leader];
{
	//--- No HCO defined yet
	_grp = _x;
	if (
		   isnull hcleader _grp
		&& side _leader == side _grp
		&& count units _grp > 0
		&& not(_grp in bon_hc_blacklist)
	) then {
		[_leader,"MARTA_REVEAL",[_grp],false,true] call BIS_fnc_variableSpaceAdd;
		_leader HCsetgroup [_grp,""];
	};
} foreach _groups;


//--- Local script ---------------------------------------------------------------------------------------
waitUntil{!isNil {BIS_MPF_initDone}};
  
if (_isMain) then {[] execVM (BON_HC_PATH+"HC_local.sqf")};