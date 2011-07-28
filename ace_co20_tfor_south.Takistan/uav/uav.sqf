/*
	File: uav.sqf
	Author: Karel Moricky

	edited by Bon_Inf* to keep everything locally


	Description:
	Init script - UAV

	Parameter(s):
	_this: the UAV logic unit which triggered this script.
*/
_logic = _this select 0;
//_logic setpos [1000,10,0];

//--- Logic ID
if (isnil "BIS_uav_lastID") then {BIS_uav_lastID = -1};
BIS_uav_lastID = BIS_uav_lastID + 1;
_id = BIS_uav_lastID;
_varname = "";

call compile format ["BIS_uav_%1 = _logic; _logic setvehiclevarname 'BIS_uav_%1'; _varname = 'BIS_uav_%1'",BIS_uav_lastID];
_logic setVariable ["ID",BIS_uav_lastID, false];

//--- First call
if (BIS_uav_lastID == 0) then {

	private ["_logicgroup"];

	//--- Execute Functions
	if (isnil "bis_fnc_init") then {
		_logicgroup = createGroup sideLogic;
		_logicFnc = _logicgroup createunit ["FunctionsManager",position player,[],0,"none"];
	};

	//--- Execute MARTA
	if (isnil "bis_marta_mainscope") then {
		if(isNil "_logicgroup") then {_logicgroup = createGroup sideLogic};
		_logicMARTA = _logicgroup createunit ["MartaManager",position player,[],0,"none"];
	};
	
};

waituntil {BIS_fnc_init};


//--- Wrong arguments - EXIT -----------------------------------------------------------------------------
_logic spawn {
	_logic = _this;

	_logic setVariable ["uavList",[],false];
	_logic setVariable ["rules",[],false];
	_logic setVariable ["terminals",[],false];

	while {!isnull _logic} do {

		_linked = (_logic getVariable "uav_uavs") + (_logic getVariable "uav_terminals") + (_logic getVariable "uav_units");
		{
			if (vehicle _x iskindof "uav") then {
				_logic setVariable ["uavList",(_logic getVariable "uavList")+[_x],false];
			} else {
				if !(isnull leader _x) then {
					_logic setVariable ["rules",(_logic getVariable "rules")+[_x],false];
				} else {
					_logic setVariable ["terminals",(_logic getVariable "terminals")+[_x],false];
				};
			};
			sleep 0.01;
		} foreach _linked;

		sleep 5;
	};
};

_uavs = [];
_units = [];
_terminals = [];
_linked = (_logic getVariable "uav_uavs") + (_logic getVariable "uav_terminals") + (_logic getVariable "uav_units");
{
	if (vehicle _x iskindof "uav") then {
		_uavs = _uavs + [_x]
	} else {
		if !(isnull leader _x) then {
			_units = _units + [_x];
		} else {
			_terminals = _terminals + [_x];
		};
	};
} foreach _linked;


if (count _uavs > 1) then {textLogFormat ["Log: [UAV] WARNING! Too many UAV's linked to %1 - %2",_logic,_uavs]};
if (count _uavs < 1) then {textLogFormat ["Log: [UAV] WARNING! No UAV linked to %1",_logic]};
if (count _units < 1) then {textLogFormat ["Log: [UAV] WARNING! No units linked to %1",_logic]};
if (count _terminals < 1) then {textLogFormat ["Log: [UAV] WARNING! No terminals linked to %1",_logic]};


//--- Get custom params ----------------------------------------------------------------------------------

//--- Name of UAV
_name = if (isnil {_logic getvariable "name"}) then {""} else {_logic getvariable "name"};
_logic setvariable ["name",_name,false];

//--- Units with access
_rules = if (isnil {_logic getvariable "rules"}) then {_units} else {(_logic getvariable "rules") + _units};
_logic setvariable ["rules",_rules,false];

//--- Terminals
_terminals = if (isnil {_logic getvariable "terminals"}) then {_terminals} else {(_logic getvariable "terminals") + _terminals};
_logic setvariable ["terminals",_terminals,false];

//--- UAVs
_uavList = if (isnil {_logic getvariable "uavList"}) then {_uavs} else {(_logic getvariable "uavList") + _uavs};
_logic setvariable ["uavList",_uavList,false];

//--- Area size
_areasize = if (isnil {_logic getvariable "areasize"}) then {10} else {_logic getvariable "areasize"};
_logic setvariable ["areasize",_areasize,false];


//--- Local script ---------------------------------------------------------------------------------------
[_logic,_varname] execVM (BON_UAV_PATH+"uav_action.sqf");


sleep 0.01;
//--- UAV waypoints --------------------------------------------------------------------------------------
_uav = _uavs select 0;

if ((count units _uav) > 1) then
{//UAV should not have leader
  [driver _uav] join grpnull;
};

_radius = 1500;
_wpcount = 8;
_step = 360 / _wpcount;
_add = 0;
_cw = true;
_dir = 0;
deletewaypoint _lastWP;

/*
group _uav addGroupIcon ["b_uav"];
group _uav setGroupIconParams [[0,0,1,1],"",1,true,true,[0,0,1,1]];
setgroupiconsvisible [true,false];
*/

_spawn = [] spawn {}; //--- Empty spawn
while {alive _uav} do {
	waituntil {waypointdescription [group _uav,currentwaypoint group _uav] != ' ' || !alive _uav};
	terminate _spawn; //--- Terminate spawn from previous loop
	if !(alive _uav) exitwith {};

	_waypoints = waypoints _uav;
	_lastWP = _waypoints select (count _waypoints - 1);
	_lastWPpos = waypointposition _lastWP;
	deletewaypoint _lastWP;
	for "_d" from 0 to (360-_step) step _step do
	{
		_add = _d;
		if !(_cw) then {_add = -_d};
		_pos = [_lastWPpos, _radius, _dir+_add] call bis_fnc_relPos;
		_wp = (group _uav) addwaypoint [_pos,0];
		_wp setWaypointType "MOVE";
		_wp setwaypointdescription ' ';
		_wp setwaypointcompletionradius (1000/_wpcount);
	};

	_spawn = [_uav,_add,_step,_lastWPpos,_radius,_dir] spawn {
		scriptname "UAV Route planning";
		_uav = _this select 0;
		_add = _this select 1;
		_step = _this select 2;
		_lastWPpos = _this select 3;
		_radius = _this select 4;
		_dir = _this select 5;
		_currentWP = currentwaypoint group _uav;
		while {alive _uav} do {
			waituntil {_currentWP != currentwaypoint group _uav};
			sleep .01;
			//waituntil {waypointdescription [group _uav,currentwaypoint group _uav] != " "};hint str [time,_currentWp,currentwaypoint group _uav];
			_add = _add + _step;
			if !(_cw) then {_add = -_add};
			_pos = [_lastWPpos, _radius, _dir+_add] call bis_fnc_relPos;
			_wp = (group _uav) addwaypoint [_pos,0];
			_wp setWaypointType "MOVE";
			_wp setwaypointdescription ' ';
			_wp setwaypointcompletionradius (1000/_wpcount);
			_currentWP = currentwaypoint group _uav;
		};
	};

	_wpcount = count waypoints _uav;
	waituntil {waypointdescription [group _uav,currentwaypoint group _uav] == ' ' || _wpcount != count waypoints _uav || !alive _uav};
	if !(alive _uav) exitwith {};
};



