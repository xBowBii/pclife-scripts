_carrier = _this select 0;
_pilot = _this select 1;
_action = _this select 2;
_objects = nearestObjects [getPos _carrier, ["car"], 10]; 
_nearest = _objects select 1;
if ((typeOf _nearest) == "") exitWith { _carrier vehicleChat "No static weapons near by" };



_carrier vehicleChat format ["Ready to attach vehicle --%1--", typeOf _nearest];

_carrier removeAction _action;
_carrier setVariable ["cancelledAttach", false];

_cancelAction = _carrier addAction ["Cancel Attach", "cancelAttach.sqf", [], 1, false, true, "", "driver _target == player"];
_carrier vehicleChat format ["%1 now attached", typeOf _nearest];

if (_carrier getVariable "cancelledAttach") exitWith { _carrier vehicleChat "Cancelled Vehicle Attach" };

_carrier setVariable ["attached", true];
_carrier removeAction _cancelAction;
_carrier addAction ["Detach Vehicle", "detachVehicle2.sqf", _nearest, 1, false, true, "", "driver _target == player"];

while {_carrier getVariable "attached" } do {
	_nearest Attachto [_carrier,[0,-4,0]];
	sleep 0.25;
};

[_carrier, _nearest] execVM "dropVehicle2.sqf";