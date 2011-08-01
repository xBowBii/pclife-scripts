//by Bon_Inf*


if(not isServer) exitWith{};

_debug = false; // create markers at camp positions



if(_debug) then {hint "Создаю лагеря..."};


private ["_pos"];


_all_heights = nearestLocations [position Server,["Mount"],20000];


/*
* we take heights as base.
* possible locations are heights that:
* - are at least 150m and at most 500m away from any road
* - flat and empty
* - at least 1800m away from friendly home base
*/
_all_possible_locations = [];
{
	_position = [position _x select 0, position _x select 1,0];

	_roads_close = _position nearRoads 150;
	_roads_far = _position nearRoads 500;
	_isflatempty = _position isflatempty [10,0,0.1,2,0,false,ObjNull];

	if(
		count _roads_far > 0
	     && count _roads_close == 0
	     && count _isflatempty > 0
	     && _position distance getmarkerpos format["respawn_%1",tfor_friendly_side] > 1800
	) then {_all_possible_locations = _all_possible_locations + [_x]};

} foreach _all_heights;



/*
* pick a random location from all possible locations generated before,
* remove all possible locations around 800m
* until either no locations are left or we have the desired number locations picked
*/
_outpostpositions = [];
while{count _outpostpositions < tfor_maxnumber_camps && count _all_possible_locations > 0} do {
	_location = _all_possible_locations call getRandomElement;
	_heights_to_remove = nearestLocations [position _location,["Mount"],800];
	_all_possible_locations = _all_possible_locations - _heights_to_remove;
	_outpostpositions = _outpostpositions + [_location];
};




// OK now let's generate camps.

{
	_position = [position _x select 0, position _x select 1,0];

	// camp strength and type depends on distance to home base. <- tweak by 1nsider!

	private ["_campstrength","_camptype"];
	_campdistance = _position distance (getMarkerPos format["respawn_%1",tfor_friendly_side]);

	// recon camp
	if (_campdistance < 3500) then {
		_campstrength = (round random 3)+4; //4-7 men
		_camptype = ["tentcamp_1","tentcamp_2"] call getRandomElement;
	};

	// medium camp (outposts)
	if (_campdistance >= 3500 && _campdistance < 6000) then {
		_campstrength = (round random 8)+6; //6-14 men
		_camptype = ["bunkersmall_0","guardpost_0","guardpost_1"] call getRandomElement;
	};

	// distant camp (militia bases)
	if (_campdistance >= 6000) then {
		_campstrength = (round random 8)+10; //10-18 men
		_camptype = ["bunkermedium_0","bunkermedium_1","bunkermedium_2"] call getRandomElement;


		// in case of distant camp, spawn statics pointing to nearest road segments
		_nearestroad = (_position nearRoads 500) select 0;

		private ["_pos"]; _mindist = 99999;

		_ang = 0; _rad = 15; _inc = 18; 
		for "_i" from 0 to 20 do {
			_a = (_position select 0)+(sin(_ang)*_rad);
			_b = (_position select 1)+(cos(_ang)*_rad);
			_ang = _ang + _inc;

			if([_a,_b,0] distance _nearestroad < _mindist) then {
				_pos = [_a,_b,0];
				_mindist = [_a,_b,0] distance _nearestroad;
			};
		};

		_statictype = [
			"DSHKM_TK_INS_EP1","DSHKM_TK_INS_EP1","DSHKM_TK_INS_EP1","DSHKM_TK_INS_EP1","DSHKM_TK_INS_EP1",
			"DSHkM_Mini_TriPod_TK_INS_EP1","DSHkM_Mini_TriPod_TK_INS_EP1","DSHkM_Mini_TriPod_TK_INS_EP1",
			"AGS_TK_INS_EP1","AGS_TK_INS_EP1",
			"ZU23_TK_INS_EP1" //<- frkn badass, you may want to comment this one out
		] call getRandomElement;
		_statictype createVehicle _pos;
	};


	// create the object composition
	[_camptype,round random 360,_position] execVM "dyno\objectMapper.sqf";


	// bring camp to life
	[_position,_campstrength] spawn {
		_position = _this select 0;
		_campstrength = _this select 1;

		_campalive = true;	
		While{_campalive} do {



			While{{side _x == tfor_friendly_side} count nearestObjects[_position,["Man","LandVehicle","Helicopter"],1500] == 0} do {sleep 10};


				
			_grp = [tfor_enemy_side,_campstrength,_position,50,"militia"] call spawnInf;
			_units = units _grp;

			switch (round random 3) do {
				case 0 : {
					_road = (_position nearRoads 500) select 0;
					(_grp addWaypoint [position _road,50]) setWaypointType "HOLD";
					_grp setBehaviour "COMBAT";
				};
				case 1 : {
					[_grp,_position,"standby",25] execFSM "fsm\bon_ai_movement.fsm";
				};
				default {
					[_grp,_position,"patrol",150] execFSM "fsm\bon_ai_movement.fsm";
				};
			};

			_nearstatics = nearestObjects [_position,["StaticWeapon"],50];
			if(count _nearstatics > 0) then {
				_unit = leader _grp;
				for "_i" from 0 to (count units _grp)-1 do {
					_unit = units _grp select _i;
					if(leader _unit != _unit) exitWith{};
				};
				_unit assignAsGunner (_nearstatics select 0);
				[_unit] orderGetIn true;
				(_nearstatics select 0) setVehicleAmmo 1;
			};



			While{{side _x == tfor_friendly_side} count nearestObjects[_position,["Man","LandVehicle","Helicopter"],1500] > 0} do {sleep 60};



			// if the group has been wiped out, decide on distance and probability whether to keep it alive or not
			_distance_factor = round(_position distance getmarkerpos format["respawn_%1",tfor_friendly_side])/1000;
			if({alive _x} count units _grp == 0 && random _distance_factor < 3.5) then {_campalive = false};
			
			{
				_x action ["eject", vehicle _x];
				sleep 1;
				deleteVehicle _x;
			} foreach _units;
			sleep 5; deleteGroup _grp;

			//if the camp is still alive, make sure it won't get activated for the next 1800 secs
			if(_campalive && {alive _x} count units _grp == 0) then {sleep 1800};
		};
	};

} foreach _outpostpositions;


if(_debug) then {
	{(createMarker [str (position _x),position _x]) setMarkerType "dot"} foreach _outpostpositions;
	hint format["camp init done.\n\ncamps generated: %1",count _outpostpositions];
};

diag_log format["##### TFOR CAMPS INITIALIZED; number camps generated: %1 #####",count _outpostpositions];