textLogFormat ["Log: [High Command] Local script executed on %1",player];
_logic = player getvariable "BIS_HC_scope";
if (isnil "_logic") then {_logic = bis_hc_mainscope; player setvariable ["BIS_HC_scope",_logic,true]};
_logicMARTA = BIS_Marta_mainscope;

_groupicons = configfile >> "cfggroupicons";
_groupiconnames = [];
for "_i" from 0 to (count _groupicons - 1) do {
	_element = _groupicons select _i;
	if (isclass _element) then {
		_groupiconnames = _groupiconnames + [configname _element,gettext (_element >> "name")];
	};
};



private ["_leader"];
while{isNil "_leader"} do{
_leader = _logic getVariable "HC_commander"};
if(_leader != player) exitWith{hint "shit"};
waituntil {count hcallgroups player > 0};


textLogFormat ["Log: [High Command] %1 is now commander",player];

_logic setvariable ["commander",true];



//-- Execute GUI control script
[player] execvm (BON_HC_PATH+"HC_GUI.sqf");


//--- Custom code when new enemy group is revealed
_logicMARTA = BIS_Marta_mainscope;
[_logicMARTA,"codein",[{
	_enemygroups = BIS_marta_mainscope getvariable "enemygroups";
	if (_this in _enemygroups) then {
		_grouptype = markertype (["MARKER",_this] call BIS_marta_getParams);
		["enemy",_grouptype] execVM (BON_HC_PATH+"HC_sound.sqf");
	};
}]] call BIS_fnc_variableSpaceAdd;