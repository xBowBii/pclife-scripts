/*
  Parameters:
    0: Object or Position   Anchor, point of origin.
    1: Object or Position   Center position to which objects are move around.
    2: Number               Range in meters to search for objects.
    3: Array or String      Optional. Type of objects to search for.
    
  Examples:
    nul = [gl1,gl2,50] execvm "moveobjects.sqf"
    nul = [start,destination,100,"Man"] execvm "moveobjects.sqf"
    nul = [[3243,5234,0],gl2,50,["Man","Car"]] execvm "moveobjects.sqf"

*/
private ["_range","_objects","_aPos","_dPos","_xPos","_dir","_dst","_types"];
_aPos = _this select 0;
_dPos = _this select 1;
_range = _this select 2;
_types = if (count _this > 3) then {_this select 3} else {[]};

if (typename _aPos == typename objNull) then {_aPos = getpos _aPos};
if (typename _dPos == typename objNull) then {_dPos = getpos _dPos};
if (typename _types == typename "") then {_types = [_types]};

_objects = nearestobjects [_aPos,_types,_range];

{
  _xPos = getpos _x;
  _dir = ((_xPos select 0) - (_aPos select 0)) atan2 ((_xPos select 1) - (_aPos select 1));
  _dst = _aPos distance _xPos;
  _x setpos [((_dPos select 0) + (_dst * sin _dir)),
            ((_dPos select 1) + (_dst * cos _dir)),
            0];
} foreach _objects;