call fnc_home_teleport;

//cleaning stuff
for "_x" from 1 to 5 do {
  _toDelete = nearestObjects [getMarkerPos format["convoy_%1_wp%2", RANDOM_VALUE,_x], [C_LIGHT_VEH, C_TRUCK], 500];
  {
    _crew = crew _x;
    {deleteVehicle _x} foreach _crew;
    deleteVehicle _x;
  } forEach _toDelete;
};