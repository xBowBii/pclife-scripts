// by Bon_Inf*
private ["_side","_pos","_radius","_units","_unit","_count"];

_side = _this select 0;
_pos = _this select 1;
_radius = _this select 2;
_count = 0;

_units = nearestObjects [_pos, ["Car","Tank","Air","Man"], _radius];

{
	_unit = _x;
	if(_unit isKindOf "Man" && side _unit == _side) then{
		if(alive _unit) then{_count = _count + 1};
	}
	else{
		if(canMove _unit && side _unit == _side) then{_count = _count + 1};
	};
} foreach _units;

_count