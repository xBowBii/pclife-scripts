// by Bon_Inf*


BON_UAV_PATH = "uav\";


if(isNil "Server") exitWith{hint "UAV ERROR: Gamelogic named 'Server' required."};
if(isNull Server) exitWith{hint "UAV ERROR: Gamelogic named 'Server' required."};
if(typename server != "OBJECT") exitWith{hint "UAV ERROR: Gamelogic named 'Server' required."};


if(isDedicated) exitWith{};
WaitUntil{not isNull player};



_terminal = _this select 0;


_uavtype = "MQ9PredatorB_US_EP1";
_uavside = tfor_friendly_side;

_uav_classes = tfor_commanders;




/*****************************************************************************/
/*****************************************************************************/

if(not (typeOf player in _uav_classes) && count _uav_classes > 0) exitWith{};


_logicgroup = createGroup sideLogic;
_logic = _logicgroup createUnit ["Logic",position _terminal,[],0,"NONE"];


_createuav = compile (preprocessFileLineNumbers (BON_UAV_PATH+"createuav.sqf"));
_cleanup = compile (preprocessFileLineNumbers (BON_UAV_PATH+"cleanup.sqf"));
sleep 1;
_uavcreation = [_logic,_uavtype,_uavside] call _createuav;
_uav = _uavcreation select 0;
_units = _uavcreation select 1;
_grp = _uavcreation select 2;

Server setVariable [format["bon_uav_%1",getPlayerUID player],[_logic,_uav,_units],true];

_logic setVariable ["uav_uavs",[_uav]];
_logic setVariable ["uav_terminals",[_terminal] + nearestObjects [position _logic,["Base_WarfareBUAVterminal"],20000]];
_logic setVariable ["uav_units",[player]];

bon_uav_logic = _logic;

sleep 1;
[_logic] execVM (BON_UAV_PATH+"uav.sqf");


While{alive _uav} do {sleep 10};
sleep 10;
While{not ([_logic,_uav,_units] call _cleanup)} do{sleep 0.1};

[_terminal] execVM (BON_UAV_PATH+"init.sqf");