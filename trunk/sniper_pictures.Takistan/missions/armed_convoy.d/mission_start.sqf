private ["_lightVeh", "_truck", "_grp", "_grp2", "_driver", "_gunner", "_groupArray", "_soldier"];

_grp = createGroup resistance;
_grp2 = createGroup resistance;

_groupArray = [_grp, _grp2];

{
  _veh = _x;
  for "_i" from 1 to AC_LIGHT_VEH_COUNT do {
    _lightVeh = createVehicle [_veh, getMarkerPos format["arm_convoy_%1_spawn", RANDOM_VALUE], [], 0, "NONE"];
    _driver = _grp createUnit [AC_CREW, getMarkerPos format["arm_convoy_%1_spawn", RANDOM_VALUE], [], 0, "FORM"];  
    _driver moveInDriver _lightVeh;  
    _gunner = _grp createUnit [AC_CREW, getMarkerPos format["arm_convoy_%1_spawn", RANDOM_VALUE], [], 0, "FORM"];
    _gunner moveInGunner _lightVeh;
  };
} foreach AC_LIGHT_VEH;

{
  _veh = _x;
  for "_i" from 1 to AC_TRUCKS_COUNT do {
    _truck = createVehicle [_veh, getMarkerPos format["arm_convoy_%1_spawn", RANDOM_VALUE], [], 0, "FORM"];
    _driver = _grp createUnit [AC_CREW, getMarkerPos format["convoy_%1_spawn", RANDOM_VALUE], [], 0, "FORM"];
    _driver moveInDriver _truck;
  
    //don't fill rearm/etc trucks with infantry
    _isSupport = getText (configFile >> "CfgVehicles" >> typeof _truck >> "vehicleclass");
    if (_isSupport != "Support") then {
      for "_z" from 1 to AC_INF_PER_TRUCK do {
        _soldier = _grp2 createUnit [AC_SOLDIER, getMarkerPos format["arm_convoy_%1_spawn", RANDOM_VALUE], [], 0, "FORM"];
        _soldier moveInCargo _truck;
      };
    };
  };
} foreach AC_TRUCKS;

{
  _veh = _x;
  for "_i" from 1 to AC_LIGHTARMOR_COUNT do {
    _lightArmor = createVehicle [_veh, getMarkerPos format["arm_convoy_%1_spawn", RANDOM_VALUE], [], 0, "NONE"];
    _driver = _grp createUnit [AC_CREW, getMarkerPos format["arm_convoy_%1_spawn", RANDOM_VALUE], [], 0, "FORM"];  
    _driver moveInDriver _lightArmor;  
    _gunner = _grp createUnit [AC_CREW, getMarkerPos format["arm_convoy_%1_spawn", RANDOM_VALUE], [], 0, "FORM"];
    _gunner moveInGunner _lightArmor;
  };
} foreach AC_LIGHTARMOR;

for "_x" from 1 to 5 do {
  _wp = group _driver addWaypoint [getMarkerPos format["arm_convoy_%1_wp%2", RANDOM_VALUE,_x], 0];
  _wp setWaypointType "MOVE";
  _wp setWaypointBehaviour "CARELESS";
  _wp setWaypointSpeed "LIMITED";
};

_wp = group _driver addWaypoint [getMarkerPos format["carm_onvoy_%1_wp1", RANDOM_VALUE],0];
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