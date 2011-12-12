private ["_target", "_grp"];
_tDir = 0;
_tDistance = 0;

_centerX = getMarkerPos "normal_range" select 0;
_centerY = getMarkerPos "normal_range" select 1;
_sizeX = getMarkerSize "normal_range" select 0;
_sizeY = getMarkerSize "normal_range" select 1;

_startX = _centerX - 0.5*_sizeX;
_startY = _centerY - 0.5*_sizeY;

_pad = createVehicle ["InvisibleManW_EP1", [_startX + (round random _sizeX), _startY + (round random _sizeY), 0], [], 0, "FORM"];
[_pad] call fixObstacles;

_grp = createGroup resistance;
_target = _grp createUnit ["GUE_Commander", position _pad, [], 1, "FORM"];
TEH_TARGET = _target;
deleteVehicle _pad;
sleep 0.2;

_target addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "head_hit")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleHead};_this select 2}];
_target addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "body")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleBody};_this select 2}];
_target addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "hands")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleHands};_this select 2}];
_target addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "legs")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleLegs};_this select 2}];

_tDir = ((((getPos _target select 0) - (getPos spotter select 0)) atan2 ((getPos _target select 1) - (getPos spotter select 1))) + 360) % 360;
_target setDir round random 360;
_tDistance = spotter distance _target;

if (_tDistance < 500) then {[-2, {player globalchat _this}, format ["New target: man, %1, closer than 0.5km",_tDir]] call CBA_fnc_globalExecute;};
if (_tDistance >= 500) then {[-2, {player globalchat _this}, format ["New target: man, %1, farther than 0.5km",_tDir]] call CBA_fnc_globalExecute;};

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