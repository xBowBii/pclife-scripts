// by Bon_Inf*
//
// searches for high positions around the AO, spawns snipers and makes them
// move and camp at these positions.


if(not isServer) exitWith{};


_location = _this select 0;
_position = [position _location select 0,position _location select 1,0];


// get sniper units
_allunits = call compile format["tfor_%1_inf",tfor_enemy_side];
_snipers = [];
{
	_camouflage = getnumber (configfile >> "CfgVehicles" >> _x >> "camouflage");
	if(_camouflage < 1) then{_snipers = _snipers + [_x]};
} foreach _allunits;
if(count _snipers == 0) exitWith{};


// get heights around _location
_heights = nearestLocations [_position,["Mount"],500];

_spawned_snipers = [];
_helih = "HeliHEmpty" createVehicleLocal _position;
_locationheight = (getposASL _helih) select 2;
{
	_helih setpos position _x;
	_heightasl = (getposASL _helih) select 2;

	if(_heightasl - _locationheight > 50 && random 2 < 1.25) then {
		_group = createGroup tfor_enemy_side;
		_sniper = _group createUnit [_snipers call getRandomElement,_position,[],0,"NONE"];
		_spawned_snipers = _spawned_snipers + [_sniper];

		_group setBehaviour "COMBAT";
		(_group addWaypoint [position _helih,0]) setWaypointType "HOLD";

		_group spawn {
			while{count units _this > 0} do {sleep 60};
			deletegroup _this;
		};
	};
} foreach _heights;

deleteVehicle _helih;
_spawned_snipers spawn tfor_cleanup_after_mission;