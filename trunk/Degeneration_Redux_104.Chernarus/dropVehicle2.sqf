_carrier = _this select 0;
_vehicle = _this select 1;
_objects = nearestObjects [getPos _carrier, ["car"], 10]; 
_nearest = _objects select 1;
detach _nearest;
_nearest setpos [ getPos _nearest select 0, getPos _nearest select 1, 0];