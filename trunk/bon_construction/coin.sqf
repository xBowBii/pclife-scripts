/*
	File: coin.sqf
	Author: Karel Moricky

	Edited by Bon_Inf*, so that everything happens only locally.


	Description:
	Init script - Construction Interface

	Parameter(s):
	_this: the Coin logic unit which triggered this script.
*/
_logic = _this select 0;


//--- Logic ID
if (isnil "BIS_coin_lastID") then {BIS_coin_lastID = -1};
BIS_coin_lastID = BIS_coin_lastID + 1;
_varname = "";

call compile format ["BIS_coin_%1 = _logic; _logic setvehiclevarname 'BIS_coin_%1'; _varname = 'BIS_coin_%1'",BIS_coin_lastID];

 

_logic setvariable ["BIS_COIN_ID",BIS_coin_lastID,false];


//--- First call
if (BIS_coin_lastID == 0) then {

	//--- Execute Functions
	if (isnil "bis_fnc_init") then {
		_logicFnc = (group _logic) createunit ["FunctionsManager",position player,[],0,"none"];
	};
	
};
waituntil {BIS_fnc_init};


//--- Get custom params ----------------------------------------------------------------------------------

//---Name of construction site
_name = if (isnil {_logic getvariable "BIS_COIN_name"}) then {""} else {_logic getvariable "BIS_COIN_name"};
_logic setvariable ["BIS_COIN_name",_name,true];

//--- Units with access
_rules = if (isnil {_logic getvariable "BIS_COIN_rules"}) then {synchronizedObjects _logic} else {(_logic getvariable "BIS_COIN_rules") + synchronizedObjects _logic};
if (typename _rules != "ARRAY") then {_rules = [_rules]};
_logic setvariable ["BIS_COIN_rules",_rules,false];

//--- Categories
_categories = if (isnil {_logic getvariable "BIS_COIN_categories"}) then {[]} else {_logic getvariable "BIS_COIN_categories"};
_logic setvariable ["BIS_COIN_categories",_categories,false];

//--- Items
_items = if (isnil {_logic getvariable "BIS_COIN_items"}) then {[]} else {_logic getvariable "BIS_COIN_items"};
_logic setvariable ["BIS_COIN_items",_items,false];

//--- Funds
_funds = if (isnil {_logic getvariable "BIS_COIN_funds"}) then {["0"]} else {_logic getvariable "BIS_COIN_funds"};
if (typename _funds == "STRING") then {_funds = [_funds]};
_logic setvariable ["BIS_COIN_funds",_funds,false];

//--- Funds Description
_fundsDescription = if (isnil {_logic getvariable "BIS_COIN_fundsDescription"}) then {["$"]} else {_logic getvariable "BIS_COIN_fundsDescription"};
if (typename _fundsDescription == "STRING") then {_fundsDescription = [_fundsDescription]};
_logic setvariable ["BIS_COIN_fundsDescription",_fundsDescription,false];

//--- Area size
_areasize = if (isnil {_logic getvariable "BIS_COIN_areasize"}) then {[150,50]} else {_logic getvariable "BIS_COIN_areasize"};
_logic setvariable ["BIS_COIN_areasize",_areasize,false];

//--- actionCondition code - if true (+ in area and in rules), action will be showed
_actionCondition = if (isnil {_logic getvariable "BIS_COIN_actionCondition"}) then {"true"} else {_logic getvariable "BIS_COIN_actionCondition"};
_logic setvariable ["BIS_COIN_actionCondition",_actionCondition,false];

//--- Start code - by this adding action can be disabled
_onStart = if (isnil {_logic getvariable "BIS_COIN_onStart"}) then {{}} else {_logic getvariable "BIS_COIN_onStart"};
_logic setvariable ["BIS_COIN_onStart",_onStart,false];

//--- Select code
_onSelect = if (isnil {_logic getvariable "BIS_COIN_onSelect"}) then {{}} else {_logic getvariable "BIS_COIN_onSelect"};
_logic setvariable ["BIS_COIN_onSelect",_onSelect,false];

//--- Purchase code
_onPurchase = if (isnil {_logic getvariable "BIS_COIN_onPurchase"}) then {{}} else {_logic getvariable "BIS_COIN_onPurchase"};
_logic setvariable ["BIS_COIN_onPurchase",_onPurchase,false];

//--- Construct code
_onConstruct = if (isnil {_logic getvariable "BIS_COIN_onConstruct"}) then {{}} else {_logic getvariable "BIS_COIN_onConstruct"};
_logic setvariable ["BIS_COIN_onConstruct",_onConstruct,false];

//--- Repair code (set empty code to disable this function)
_onRepair = if (isnil {_logic getvariable "BIS_COIN_onRepair"}) then {{}} else {_logic getvariable "BIS_COIN_onRepair"};
_logic setvariable ["BIS_COIN_onRepair",_onRepair,false];

//--- Sell code (set empty code to disable this function)
_onSell = if (isnil {_logic getvariable "BIS_COIN_onSell"}) then {{}} else {_logic getvariable "BIS_COIN_onSell"};
_logic setvariable ["BIS_COIN_onSell",_onSell,false];


//--- Temporary variables
_logic setvariable ["BIS_COIN_params",[],false];
_logic setvariable ["BIS_COIN_buildings",[],false];
sleep 5.01;


_name = _logic getvariable "BIS_COIN_name";
_id = _logic getvariable "BIS_COIN_id";

_BIS_COIN_idAction = format ["BIS_COIN_action_%1",_id];
		
BIS_COIN_evalCounter = 0;
BIS_COIN_evalCounterDefault = 30; //number of frames to skip in all 
	
_logic setvariable ["BIS_COIN_evalCounter", BIS_COIN_evalCounterDefault];
	
if (isNil {_logic getVariable 'BIS_COIN_evalCondition'}) then {_logic setVariable ['BIS_COIN_evalCondition', false];};
	
while {!isnull _logic} do {

	private ["_player"];
	_player = player;	  

	if (isnil {player getvariable _BIS_COIN_idAction} && !isnull player) then {

		_player = player;

		_name = _logic getvariable "BIS_COIN_name";
		_description = if (_name == "") then {localize "str_coin_action"} else {localize "str_coin_action" + " - " + _name};
			
		_action = player addaction [
			_description,
			BON_CONSTRUCTION_PATH+"coin_interface.sqf",
			_logic,
			1,
			false,
			false,
			"",
			format ["
				BIS_COIN_evalCounter=%1 getVariable 'BIS_COIN_evalCounter';
						
				if ((BIS_COIN_evalCounter)>0) then {
					%1 setVariable ['BIS_COIN_evalCounter',BIS_COIN_evalCounter-1];
					%1 getVariable 'BIS_COIN_evalCondition'
				} else {
					%1 setVariable ['BIS_COIN_evalCounter',BIS_COIN_evalCounterDefault];
					BIS_COIN_evalCounter = BIS_COIN_evalCounterDefault;
					_player = _target;
					_logic = %1;
					_rules = %1 getvariable 'BIS_COIN_rules';					
					
					_dis = (%1 getvariable 'BIS_COIN_areasize') select 0;
					_lpos = position %1;
					_ppos = position _player;
					_customCondition = %1 getvariable 'BIS_COIN_actionCondition';
					_isCustomCondition = if (_customCondition == 'true') then {true} else {call compile _customCondition};
										
					%1 setVariable ['BIS_COIN_evalCondition',
						player == _player && (_player in _rules || side _player in _rules) && ([_lpos select 0,_lpos select 1] distance [_ppos select 0,_ppos select 1]) < _dis && _isCustomCondition
					];

					%1 getVariable 'BIS_COIN_evalCondition'
				};
			",_varname]
		];

		player setvariable [_BIS_COIN_idAction,_action];
			
	};
		
	waituntil {sleep 1.0, ((_player != player) && (!isnull player)) || ((_player distance _logic) > 300 + ((_logic getvariable 'BIS_COIN_areasize') select 0))};

	_player removeAction (_player getVariable _BIS_COIN_idAction);
	_player setvariable [_BIS_COIN_idAction, nil];
	player setvariable [_BIS_COIN_idAction, nil];	
		
	_dis = (_logic getvariable 'BIS_COIN_areasize') select 0; //distance to enable construction action in action menu
		
	waituntil {Sleep 3, (_player != player && !isnull player) || ((_player distance _logic) < (300 + _dis))};
	//itearation - action will be added again					
};