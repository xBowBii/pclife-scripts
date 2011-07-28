	scriptname "UAV: Action";
	_logic = _this select 0;
	_varname = _this select 1;
	_logic setvehiclevarname _varname;
	_id = _logic getvariable "id";
	_idAction = format ["BIS_uav_action_%1",_id];
	bon_uav_action_allowed = false;

	while {!isnull _logic} do {
		if (isnil {player getvariable _idAction}) then {
			textLogFormat ["Log: [UAV] Action %1 added to %2",_idAction,player];
			_name = _logic getvariable "name";
			_description = if (_name == "") then {localize "str_uav_action"} else {(localize "str_uav_action") + " - " + _name};

			player setvariable ["BIS_UAV_logic",_logic];
			_action = player addaction [
				_description,
				BON_UAV_PATH+"uav_interface.sqf",
				[_logic,player],
				1,
				false,
				false,
				"",
				"bon_uav_action_allowed"
			];
			player setvariable [_idAction,_action];
		};

		_player = player;
		while{_player == player && alive player && not isNull _logic} do {

			_rules = _logic getvariable "rules";
			_dis = _logic getvariable "areasize";
			_terminals = _logic getvariable "terminals";
			bon_uav_action_allowed = (_player in _rules || side _player in _rules) && {((_player distance _x < _dis && abs speed _x < 1) || unitbackpack _player == _x) && alive _x} count _terminals > 0;

			sleep 2;
		};

		//--- Player dead or logic deleted
		_player removeaction (_player getVariable _idAction);
		_player setvariable [_idAction,nil];
		waituntil {alive player};
		if(not isNull _logic) then{
			_units = ((_logic getVariable "uav_units") - [_player]) + [player];
			_logic setVariable ["uav_units",_units];
		};
	};
