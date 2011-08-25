//by Strikor, op4gaming.com

if (!isServer) exitWith {};

_veh = _this select 0;
_rwait = _this select 1;
_mwait = _this select 2;
_mark = _this select 3;
_mtype = _this select 4;
_mtext = _this select 5;
_type = typeof _veh;
_startpos = getpos _veh;
_startdir = getdir _veh;
_vmark = _mark;
_nearblue = 0;

while {true} do {
_nearblue = 0;
sleep _mwait;
deletemarker _vmark;
_mark1 = createMarker [_vmark, position _veh];
_mark1 setMarkerShape "ICON";
_vmark setMarkerText _mtext;
if (alive _veh) then {
	if !(canmove _veh) then {
	_vmark setMarkerColor "ColorOrange";
	_vmark setMarkerType "n_maint";
	_list= position _veh nearObjects ["all",500];
	{if ((side _x) == West) then {_nearblue = _nearblue + 1};} forEach _list;
	sleep 1;
	if (_nearblue < 1) then {
	_veh setdamage 1;
	[PAPABEAR,nil,rSIDECHAT,"Controlled detonation complete"] call RE;
	};
	_nearblue = 0;	
	} else { 
	_vmark setMarkerColor "ColorBlue";
	_vmark setMarkerType _mtype;
	};
	} else {	
	_vmark setMarkerColor "ColorBlack";
	_vmark setMarkerType "waypoint";	
	if (_veh distance fob < 500) then {
	deletevehicle _veh;
	};
	sleep _rwait;
	_veh = objNull;
	sleep 1;
	_veh = _type createvehicle _startpos;
	_veh setpos _startpos;
	_veh setdir _startdir;
	};
};