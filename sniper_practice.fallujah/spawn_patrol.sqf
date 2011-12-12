private ["_target1", "_target2", "_grp1", "_grp2"];

_grp1 = createGroup resistance;
_target1 = _grp1 createUnit ["GUE_Commander", getMarkerPos "patrol_0", [], 0, "FORM"];
_target1 setPosATL [getMarkerPos "patrol_0" select 0, getMarkerPos "patrol_0" select 1, (getMarkerPos "patrol_0" select 2) + 6.5];
_target1 setDir 140;
TEH_TARGET = _target1;
_target1 addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "head_hit")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleHead};_this select 2}];
_target1 addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "body")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleBody};_this select 2}];
_target1 addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "hands")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleHands};_this select 2}];
_target1 addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "legs")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleLegs};_this select 2}];

_grp2 = createGroup resistance;
_target2 = _grp2 createUnit ["GUE_Soldier_GL", getMarkerPos "patrol_0", [], 0, "FORM"];
TEH_TARGET2 = _target2;
_target2 addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "head_hit")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleHead};_this select 2}];
_target2 addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "body")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleBody};_this select 2}];
_target2 addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "hands")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleHands};_this select 2}];
_target2 addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 == "legs")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call handleLegs};_this select 2}];

for "_x" from 1 to 4 do {
  _wp = group _target2 addWaypoint [getMarkerPos format["patrol_%1", _x], 0];
  _wp setWaypointType "MOVE";
  _wp setWaypointBehaviour "CARELESS";
  _wp setWaypointSpeed "LIMITED";
  _wp setWaypointTimeout [3, 8, 5];
};

_wp = group _target2 addWaypoint [getMarkerPos "patrol_1",0];
_wp setWaypointType "CYCLE";

_grp1 spawn {
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

_grp2 spawn {
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