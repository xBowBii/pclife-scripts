private ["_target", "_grp"];
_tDir = 0;
_tDistance = 0;

_place = round random 12;
_offset = 0;

switch (_place) do 
{
  case 0:
    {_offset = 38};  
  case 1:
    {_offset = 21};  
  case 2:
    {_offset = 21};
  case 3:
    {_offset = 6};
  case 4:
    {_offset = 0};
  case 5:
    {_offset = 0};
  case 6:
    {_offset = 21};
  case 7:
    {_offset = 0};
  case 8:
    {_offset = 0};
  case 9:
    {_offset = 0};
  case 10:
    {_offset = 0};
  case 11:
    {_offset = 21};
  case 12:
    {_offset = 21};
};

_marker = format ["xlwp_%1",_place];
_grp = createGroup resistance;
_target = _grp createUnit ["GUE_Commander", getMarkerPos _marker, [], 1, "FORM"];
TEH_TARGET = _target;
_target setPosATL [getMarkerPos _marker select 0, getMarkerPos _marker select 1, (getMarkerPos _marker select 2) + _offset];
sleep 0.2;

_target addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "head_hit")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleHead};_this select 2}];
_target addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "body")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleBody};_this select 2}];
_target addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "hands")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleHands};_this select 2}];
_target addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "legs")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleLegs};_this select 2}];

_target setDir round random 360;
_tDistance = spotter distance _target;
_tDistance = (round (_tDistance/100)) * 100;
_tDir = ((((getPos _target select 0) - (getPos spotter select 0)) atan2 ((getPos _target select 1) - (getPos spotter select 1))) + 360) % 360;

[-2, {player globalchat _this}, format ["New target: man, %1, about %2 meters",_tDir,_tDistance]] call CBA_fnc_globalExecute;

_grp spawn {
	_units = units _this;
	_hidetime = 20;

	While{({alive _x} count _units) > 0} do{sleep 15};

	sleep _hidetime;
	{
		hidebody _x;
		sleep 3;
		deleteVehicle _x;
	} foreach _units;

	sleep 10;
	deleteGroup _this;
};