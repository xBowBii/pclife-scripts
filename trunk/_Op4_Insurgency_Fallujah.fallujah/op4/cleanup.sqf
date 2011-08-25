if (isServer) then {
	while {true} do {	
		sleep 1800;
		_tt = time;
		_no = nearestObjects [center,["ACE_UsedPara_Base","ACE_EjectionSeat","weaponholder","Bag_Base_EP1"],10000];
		for "_i" from 0 to count _no - 1 do {
			deleteVehicle (_no select _i);
			sleep 0.056;
		};
	};
};
