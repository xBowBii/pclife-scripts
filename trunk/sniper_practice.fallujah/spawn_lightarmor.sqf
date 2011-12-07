_tDir = 0;
_btrType = "";

if (isServer) then {
_place = round random 2;

switch (_place) do 
{
  case 0:
    {_btrType = "BTR60_TK_EP1"};  
  case 1:
    {_btrType = "M1126_ICV_M2_EP1"};  
  case 2:
    {_btrType = "LAV25"};
};

//cleaning stuff
_toDelete = nearestObjects [getMarkerPos "btr_spawn", ["BTR60_TK_EP1","M1126_ICV_M2_EP1","LAV25"], 350];
{
  _crew = crew _x;
  {deleteVehicle _x} foreach _crew;
  deleteVehicle _x;
} forEach _toDelete;

_target = createVehicle [_btrType, getMarkerPos "btr_spawn", [], 0, "NONE"];
sleep 0.2;
_target setDir 270;

_magazines = _target magazinesTurret [0];
{_target removeMagazinesTurret [_x,[0]];} foreach _magazines;

_grp = createGroup resistance;
_driver = _grp createUnit ["GUE_Soldier_Crew", getMarkerPos "btr_spawn", [], 0, "FORM"];
_driver addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 != "")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call reportDamage};_this select 2}];
_driver moveInDriver _target;

_gunner = _grp createUnit ["GUE_Soldier_Crew", getMarkerPos "btr_spawn", [], 0, "FORM"];
_gunner addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 != "")) then {[_this select 0, _this select 1, _this select 2, _this select 3] call reportDamage};_this select 2}];
_gunner moveInGunner _target;

_wp = group _driver addWaypoint [getMarkerPos "btr_wp1",0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointSpeed "LIMITED";

_wp = group _driver addWaypoint [getMarkerPos "btr_wp2",0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointSpeed "LIMITED";

_wp = group _driver addWaypoint [getMarkerPos "btr_spawn",0];
_wp setWaypointType "CYCLE";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointSpeed "LIMITED";

_tDir = ((((getPos _target select 0) - (getPos spotter select 0)) atan2 ((getPos _target select 1) - (getPos spotter select 1))) + 360) % 360;
};

player globalchat format ["New target: armor, %1, at direction %2, close.",_btrType,_tDir];