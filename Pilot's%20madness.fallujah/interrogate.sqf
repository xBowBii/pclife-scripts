_tongue = _this select 0;
_caller = _this select 1;
_id = _this select 2;

publicVariable "tongue";

if (_caller == leader rescuegrp) then {

	_action = _tongue addAction["foo", "foo.sqf"];
	while {_action >= 0} do {
	_tongue removeAction _action;
	_action = _action - 1;
};

tongue setunitpos "up";
tongue playAction "SceneCommanderTalk";
[-2, {_null = [] execVM _this}, "tongue_talk.sqf"] call CBA_fnc_globalExecute;
[-2, {_null = [] execVM _this}, "hospital_tasks.sqf"] call CBA_fnc_globalExecute;

myas = 1;
publicVariable "myas";

} else {
	[-2, {player sideChat _this}, "We have captive here. Maybe Commander should talk with him."] call CBA_fnc_globalExecute;
};
