//if (isServer) {

//  _pilot = createVehicle ["USMC_Soldier_Pilot", getMarkerPos "launch_point",[],0,"FORM"];
  sleep 0.5;
  _easterPlane = createVehicle ["C130J_US_EP1", getMarkerPos "start_point",[],0,"FLY"];
  sleep 0.1;
  pilot moveInDriver _easterPlane;
//  player moveInDriver _easterPlane;
  _easterPlane setDir 270;
  _easterPlane setVelocity [-80,0,0];
  sleep 0.1;  
  
  player globalchat "plane created!";
  _wp = group _pilot addWaypoint [getMarkerPos "launch_point",0];
  _wp2 = group _pilot addWaypoint [getMarkerPos "finish_point",0];
  
  sleep 12;

	_bomb = "RHIB";

	for "_x" from 1 to 16 do {
		sleep 0.05;
		_bomb = "Bo_GBU12_LGB" createVehicle [position _easterPlane select 0, position _easterPlane select 1, 100];
		_bomb attachTo [_easterPlane, [_x*2-8, 0, -2]];
		sleep 0.1;
		_bomb setDir 0;
		detach _bomb;
		player globalchat "Bomb away!";
		sleep 0.4;
	};

//}