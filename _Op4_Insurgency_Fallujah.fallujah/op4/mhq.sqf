if (hq distance server < 1250) exitwith {PAPABEAR=[West,"HQ"]; PAPABEAR sidechat "REQUEST DENIED - MHQ IS NOT DEPLOYED"};
cutText ["MOVING OUT", "BLACK OUT",2];
sleep 9;
_safe = "RoadCone" createvehiclelocal (position hq);
player setpos (getpos _safe);
deletevehicle _safe;
sleep 1;
cutText ["","BLACK IN",2];
player setdir (getdir hq);