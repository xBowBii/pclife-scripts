while {true} do {
		sleep 15;
		_tt = time;
		_no = nearestObjects [center,["HMMWV_Armored"],10000];
		for "_i" from 0 to count _no - 1 do {
			(_no select _i) setobjecttexture [0,"ca\wheeled_e\hmmwv\data\hmmwv_body_co.paa"];
			(_no select _i) setobjecttexture [1,"ca\wheeled_e\hmmwv\data\hmmwv_body_co.paa"];
			sleep 0.056;
		};
};
