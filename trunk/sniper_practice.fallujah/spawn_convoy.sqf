if(isServer) then {
_type = _this select 3;

//cleaning stuff
_toDelete = nearestObjects [getMarkerPos format["convoy_%1_2", _type], ["LandRover_MG_TK_INS_EP1","UralReammo_TK_EP1"], 500];
{
  _crew = crew _x;
  {deleteVehicle _x} foreach _crew;
  deleteVehicle _x;
} forEach _toDelete;

_target = createVehicle ["LandRover_MG_TK_INS_EP1", getMarkerPos format["convoy_%1_0", _type], [], 0, "NONE"];
_truck = createVehicle ["UralReammo_TK_EP1", getMarkerPos format["convoy_%1_0", _type], [], 0, "NONE"];
sleep 0.2;
_target setDir 90;

_magazines = _target magazinesTurret [0];
{_target removeMagazinesTurret [_x,[0]];} foreach _magazines;

_grp = createGroup resistance;
_driver = _grp createUnit ["GUE_Soldier_Crew", getMarkerPos format["convoy_%1_0", _type], [], 0, "FORM"];
TEH_DRIVER = _driver;
_driver addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 != "")) then {[TEH_DRIVER, _this select 1, _this select 2, _this select 3] call reportDamage};_this select 2}];
_driver moveInDriver _target;

_gunner = _grp createUnit ["GUE_Soldier_Crew", getMarkerPos format["convoy_%1_0", _type], [], 0, "FORM"];
TEH_GUNNER = _gunner;
_gunner addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 != "")) then {[TEH_GUNNER, _this select 1, _this select 2, _this select 3] call reportDamage};_this select 2}];
_gunner moveInGunner _target;

_driver2 = _grp createUnit ["GUE_Soldier_Crew", getMarkerPos format["convoy_%1_0", _type], [], 0, "FORM"];
TEH_DRIVER2 = _driver2;
_driver2 addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 != "")) then {[TEH_DRIVER2, _this select 1, _this select 2, _this select 3] call reportDamage};_this select 2}];
_driver2 moveInDriver _truck;

for "_x" from 1 to 3 do {
_wp = group _driver addWaypoint [getMarkerPos format["convoy_%1_%2", _type,_x], 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointSpeed "LIMITED";
};

_wp = group _driver addWaypoint [getMarkerPos format["convoy_%1_0", _type],0];
_wp setWaypointType "CYCLE";
};