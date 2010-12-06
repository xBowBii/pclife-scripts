if (isServer) {

	_bomb = "RHIB";

	for "_x" from 1 to 4 do {
		sleep 0.05;
		_bomb = "Bo_GBU12_LGB" createVehicle [position plane1 select 0, position plane1 select 1, 100];
		_bomb attachTo [plane1, [_x*2-8, 0, -2]];
		sleep 0.1;
		_bomb setDir 0;
		detach _bomb;
		sleep 0.4;
	};

	for "_x" from 1 to 4 do {
		sleep 0.05;
		_bomb = "Bo_GBU12_LGB" createVehicle [position plane2 select 0, position plane2 select 1, 100];
		_bomb attachTo [plane2, [_x*2-8, 0, -2]];
		sleep 0.1;
		_bomb setDir 0;
		detach _bomb;
		sleep 0.4;
	};

};