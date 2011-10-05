_carrier = _this select 0;
_vehicle = _this select 1;
_nearest = nearestObject [getPos _carrier, "StaticWeapon"];
detach _nearest;
_nearest setpos [ getPos _nearest select 0, getPos _nearest select 1, 0];