// by Bon_Inf*

if(not isServer) exitWith{};

private ["_road","_roads","_pos","_current_truckpos"];

_location = _this select 0;
_destination = position _location; _destination set [2,0];
_ambushgroups = [];

_truck = tfor_bringtruck_truck createVehicle getMarkerPos format["respawn_%1",tfor_friendly_side];
[_truck] spawn tfor_cleanup_after_mission;
_truck setVariable ["tfor_nolifting",true,true];


// marker on truck; note: recreating marker all the time for JIPs (increases network traffic, so big sleep)
_truck spawn {
	While{(tfor_currentmission select 1) == "bringtruck"} do{
		deleteMarker "tfor_supporttruck_marker";
		While{isPlayer driver _this} do{sleep 2};
		_marker = createMarker ["tfor_supporttruck_marker",position _this];
		_marker setMarkerType "b_support";
		sleep 5;
	};
	deleteMarker "tfor_supporttruck_marker";
};


While{alive _truck && _truck distance (getMarkerPos format["respawn_%1",tfor_friendly_side]) < 450 && tfor_deathcount <= tfor_max_death_per_mission} do {sleep 5};


// creates enemies on the rear of the truck when it holds for longer than 30 seconds
_truck spawn {

	While{(tfor_currentmission select 1) == "bringtruck"} do {

		While{speed _this > 0} do {sleep 1};

		_time = time; _truckpos = position _this;
		While{position _this distance _truckpos < 50 && time - _time < 60} do{sleep 1};

		_counter = 0;
		While{position _this distance _truckpos < 50} do{

			if(random 2 < 1 && _counter < 2) then {
				_spawnpos = _this modelToWorld [if(random 2 < 1) then{-125} else{125},-125,0];
				_spawnpos set [2,0];
				_ambushgroup = [tfor_enemy_side,5 + round random 5,_spawnpos,50] call spawnInf;
				(units _ambushgroup) spawn tfor_cleanup_after_mission;

				_ambushgroup setBehaviour "AWARE";
				(_ambushgroup addWaypoint [position _this,5]) setWaypointType "SAD";
				_counter = _counter + 1;

			};

		sleep 120;
		};
	};
};


While{alive _truck && _truck distance _destination > (1250 - random 500) && tfor_deathcount <= tfor_max_death_per_mission} do {

	for "_i" from 1 to 2 do {
		
		_current_truckpos = position _truck;
		_truck_heading = _truck modelToWorld [0,800,0];

		if(random 2.25 > 1) then {

			if(isNil "_road") then{
				_roads = _truck nearRoads 1000 + random 500;
			} else {
				_roads = (_truck nearRoads 1000 + random 500) - (_road nearRoads (300 + random 200));
			};

			_road = _roads select (count _roads - 1);
			{
				if(_x distance _truck_heading < _road distance _truck_heading) then {
					_road = _x;
				};
			} foreach _roads;

			_grp = [tfor_enemy_side,5 + round random 5,_road modelToWorld [if(random 2 < 1) then{-50} else{50},0,0],10] call spawnInf;
			_ambushgroups = _ambushgroups + [_grp];

			if(random 2 < 1) then {
				_car = [call compile format["tfor_%1_car call getRandomElement",tfor_enemy_side],tfor_enemy_side,position _road,50] call spawnVehicle;
				units _car joinSilent _grp;
				sleep 1;
				deleteGroup _car;
			};
			(units _grp) spawn tfor_cleanup_after_mission;

			_grp setBehaviour "COMBAT";
			(_grp addWaypoint [position _road,75]) setWaypointType "HOLD";
			{_x findCover [position _x,position _road,50]} foreach units _grp;

		};
	};

	_distance = 750 + random 500;
	While{(_truck distance _current_truckpos) < _distance && alive _truck && _truck distance _destination > (1250 - random 500) && tfor_deathcount <= tfor_max_death_per_mission} do {sleep 5};

	_road = nil;
	_roads = nil;
	_distance = nil;

};


_pos = [_destination,150] call getFlatArea;
["outpost_0",round random 360,_pos] execVM "dyno\objectMapper.sqf";
_pos spawn {
	_arrow = "Sign_arrow_down_large_EP1" createVehicle _this; _arrow setPos [_this select 0,_this select 1,15];
	sleep 10;
	_outpost_objects = ("outpost_0" call (compile (preprocessFileLineNumbers "dyno\getObjects.sqf")));
	(nearestObjects[_this,_outpost_objects,50]+[_arrow]) spawn tfor_cleanup_after_mission;
};

_friendlies = [tfor_friendly_side,2 + round random 2,_pos,20] call spawnInf;
(units _friendlies) spawn tfor_cleanup_after_mission;
{_x allowDamage false} foreach units _friendlies;

_ang = 0;
_rad = 50; //radius
_bcount = 4;
_inc = 360/_bcount; 

for "_i" from 0 to _bcount do
{
	_a = (_pos select 0)+(sin(_ang)*_rad);
	_b = (_pos select 1)+(cos(_ang)*_rad);

	_wppos = [_a,_b,_pos select 2];
	_ang = _ang + _inc;

	_wp = _friendlies addWayPoint [_wppos,10];
};
_wp setWaypointType "CYCLE";
_friendlies setBehaviour "SAFE";
_friendlies setSpeedMode "LIMITED";


While{_truck distance _pos > 50 && alive _truck && tfor_deathcount <= tfor_max_death_per_mission} do{sleep 2};

if(not alive _truck || tfor_deathcount > tfor_max_death_per_mission) then {
	tfor_missionstate = "FAIL";
} else {
	tfor_missionstate = "SUCCESS";

	_truck setVehicleInit "this setFuel 0"; processInitCommands;
	WaitUntil{speed _truck == 0};
	{_x action ["eject",_truck]} foreach crew _truck;
	_truck allowDamage false;
	_truck lock true;
};