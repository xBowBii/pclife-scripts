private ["_lightVeh", "_truck", "_grp", "_grp2", "_driver", "_gunner", "_groupArray", "_soldier"];

_grp = createGroup resistance;
_grp2 = createGroup resistance;

_groupArray = [_grp, _grp2];

for "_i" from 1 to C_LIGHT_VEH_COUNT do {
  _lightVeh = createVehicle [C_LIGHT_VEH, getMarkerPos format["convoy_%1_spawn", RANDOM_VALUE], [], 0, "NONE"];
  _driver = _grp createUnit [C_CREW, getMarkerPos format["convoy_%1_spawn", RANDOM_VALUE], [], 0, "FORM"];  
  _driver moveInDriver _lightVeh;  
  _gunner = _grp createUnit [C_CREW, getMarkerPos format["convoy_%1_spawn", RANDOM_VALUE], [], 0, "FORM"];
  _gunner moveInGunner _lightVeh;
};

for "_i" from 1 to C_TRUCK_COUNT do {
  _truck = createVehicle [C_TRUCK, getMarkerPos format["convoy_%1_spawn", RANDOM_VALUE], [], 0, "NONE"];
  _driver = _grp createUnit [C_CREW, getMarkerPos format["convoy_%1_spawn", RANDOM_VALUE], [], 0, "FORM"];
  _driver moveInDriver _truck;
  
  for "_z" from 1 to C_INF_PER_TRUCK do {
    _soldier = _grp2 createUnit [C_SOLDIER, getMarkerPos format["convoy_%1_spawn", RANDOM_VALUE], [], 0, "FORM"];
    _soldier moveInCargo _truck;
  };
};

for "_x" from 1 to 5 do {
  _wp = group _driver addWaypoint [getMarkerPos format["convoy_%1_wp%2", RANDOM_VALUE,_x], 0];
  _wp setWaypointType "MOVE";
  _wp setWaypointBehaviour "CARELESS";
  _wp setWaypointSpeed "LIMITED";
};

_wp = group _driver addWaypoint [getMarkerPos format["convoy_%1_wp1", RANDOM_VALUE],0];
_wp setWaypointType "CYCLE";

{
  _x spawn {
    _units = units _this;
    _hidetime = 20;

    While{({alive _x} count _units) > 0} do{sleep 20};

    sleep _hidetime;
    {
      hidebody _x;
      sleep 3;
      deleteVehicle _x;
    } foreach _units;

    sleep 20;
    deleteGroup _this;
  };
} foreach _groupArray;