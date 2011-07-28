if(isServer) then {
	tfor_outroholder = tfor_mhqtype createVehicle position Server;
	publicVariable "tfor_outroholder";
};
sleep 2.5;


playMusic "EP1_Track01"; 0 fadeMusic 1;
cutText["Mission accomplished.","BLACK OUT",12.5];
sleep 12.5;


[] spawn {
	for "_i" from 1 to 2 do {
		{
			if(side _x == tfor_enemy_side) then {deleteVehicle _x};
		} foreach nearestObjects [player,["Man","LandVehicle","Air"],500];
		sleep 1;
	};
};


_delay = 60 + 15 - 12.5;

[player,_delay] execVM "scripts\outro_camera.sqf";

if(vehicle player isKindOf "Air" && not isNil "tfor_outroholder") then {
	vehicle player attachTo [tfor_outroholder];
};

sleep _delay;

7 fadeMusic 0;
cutText ["Thanks for playing.","BLACK OUT",7];

sleep 7;

endMission "END1";