_target = _this select 0;

deleteVehicle _target;
deleteMarker format["bon_rallypoint_%1",getPlayerUID player];

player addAction ["Deploy Rallypoint",BON_SPAWN_PATH+"deployrally.sqf"];