_carrier = _this select 0;
_action = _this select 2;

_carrier removeAction _action;

_carrier vehicleChat "Static Weapon Detached";

_newAction = _carrier addAction ["Attach Static Weapon", "attachVehicle.sqf", [], 1, false, true, "", "driver _target == player"];
_carrier setVariable ["attachAction", _newAction];

_carrier setVariable ["attached", false];