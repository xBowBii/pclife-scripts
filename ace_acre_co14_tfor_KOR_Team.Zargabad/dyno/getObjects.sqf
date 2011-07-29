_script = _this;

_return = [];

_objs = [];
_objs = call (compile (preprocessFileLineNumbers format ["dyno\compositions\%1.sqf",_script]));

{
	_return = (_return - [_x select 0]) + [_x select 0];
} foreach _objs;


_return