// cleans up all objects marked during the mission at _location;
// there's a 'sleep' in it, so call this code with 'spawn' only
tfor_cleanup_after_mission = {

	_objects = _this;
	_location = tfor_currentmission select 0;

	While{_location == (tfor_currentmission select 0)} do{sleep 60};

	sleep 180;
	While{{side _x == tfor_friendly_side && alive _x && isPlayer _x} count nearestObjects [position _location,["Man","LandVehicle","Air"],1000] > 0} do {sleep 20};

	{
		if(vehicle _x != _x) then {deleteVehicle vehicle _x};
	} foreach _objects;

	sleep 1;

	{
		deleteVehicle _x;
	} foreach _objects;
};


"tfor_remote_cleanup" addPublicVariableEventHandler {(_this select 1) spawn tfor_cleanup_after_mission};