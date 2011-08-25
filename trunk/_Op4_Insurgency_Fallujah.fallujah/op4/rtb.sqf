cutText ["MOVING OUT", "BLACK OUT",2];
sleep 9;
_safe = "RoadCone" createvehiclelocal (position fob);
player setpos (getpos _safe);
deletevehicle _safe;
sleep 1;
cutText ["","BLACK IN",2];
player setdir 315;