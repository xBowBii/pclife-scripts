// by Bon_Inf*

if(not isServer) exitWith{};

_location = _this select 0;
_pos = position _location;
_size = ((size _location) select 0) max ((size _location) select 1);

_nearlocations = [];
_radius = 2000;
While{count _nearlocations < 2} do {
	_nearlocations = (nearestLocations [_pos,["Name","NameVillage","NameCity","NameCityCapital"],_radius] - [_location]);
	_radius = _radius + 100;
};
_nearlocations = _nearlocations call getArrayPermutation;


_radius = 200;
_nearRoads = [];
While{count _nearRoads == 0} do {
	_nearRoads = _pos nearRoads _radius;
	_radius = _radius + 100;
};

_truckgroup = [tfor_stopconvoy_vehicle_1,tfor_enemy_side,position (_nearRoads call getRandomElement),0] call spawnVehicle;
WaitUntil{vehicle leader _truckgroup != leader _truckgroup};
_truck = vehicle leader _truckgroup;
leader _truckgroup setRank "COLONEL";

_armorgroup = [tfor_stopconvoy_vehicle_2,tfor_enemy_side,position (_nearRoads call getRandomElement),0] call spawnVehicle;
WaitUntil{vehicle leader _armorgroup != leader _armorgroup};
_armor = vehicle leader _armorgroup;

_apcgroup = [call compile format["tfor_%1_apc call getRandomElement",tfor_enemy_side],tfor_enemy_side,position (_nearRoads call getRandomElement),0] call spawnVehicle;
WaitUntil{vehicle leader _apcgroup != leader _apcgroup};
_apc = vehicle leader _apcgroup;

_arrow1 = "Sign_arrow_down_large_EP1" createVehicle position _truck; _arrow1 attachTo [_truck,[0,0,2.5]];
_arrow2 = "Sign_arrow_down_large_EP1" createVehicle position _armor; _arrow2 attachTo [_armor,[0,0,2.5]];
_arrow3 = "Sign_arrow_down_large_EP1" createVehicle position _apc; _arrow3 attachTo [_apc,[0,0,2.5]];

(units _apcgroup + units _armorgroup) joinSilent _truckgroup;
(units _truckgroup + [_truck,_armor,_apc,_arrow1,_arrow2,_arrow3]) spawn tfor_cleanup_after_mission;


sleep 2;
deleteGroup _apcgroup;
deleteGroup _armorgroup;

{
	_truckgroup addWaypoint [position _x,100];
} foreach _nearlocations;
(_truckgroup addWaypoint [position _location,100]) setWaypointtype "CYCLE";


_truckgroup setBehaviour "SAFE";
_truckgroup setSpeedMode "LIMITED";
_truckgroup setFormation "COLUMN";


While{(canMove _truck || canMove _armor || canMove _apc) && tfor_deathcount <= tfor_max_death_per_mission} do{sleep 5};

if(tfor_deathcount > tfor_max_death_per_mission) then {
	tfor_missionstate = "FAIL";
} else {
	tfor_missionstate = "SUCCESS";
};