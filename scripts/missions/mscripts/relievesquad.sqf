// by Bon_Inf*

if(not isServer) exitWith{};

private ["_randompos","_isFlat","_attacker1","_attacker2","_attacker3","_attacker4","_attacker5"];

_location = _this select 0;
_pos = position _location;


_isFlat = [_pos,250] call getFlatArea;

While{{side _x == tfor_friendly_side} count nearestObjects[_isFlat,["Man","Air","LandVehicle"],1000] == 0 && tfor_deathcount <= tfor_max_death_per_mission} do{sleep 5};

_grp = [tfor_friendly_side,5,_isFlat,20] call spawnInf;
{
	_x setCaptive true;
	_x allowDamage false;
	_x addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}]; // <- Hollywood mags yay
} foreach units _grp;
(_grp addWaypoint [_isFlat,5]) setWaypointType "HOLD";

_arrow = "Sign_arrow_down_large_EP1" createVehicle _isFlat; _arrow setPos [_isFlat select 0,_isFlat select 1,15];

_landrover1 = "LandRover_Special_CZ_EP1" createVehicle [(_isFlat select 0) + 10 - random 20,(_isFlat select 1) + 10 - random 20,0];
_landrover2 = "LandRover_Special_CZ_EP1" createVehicle [(_isFlat select 0) + 10 - random 20,(_isFlat select 1) + 10 - random 20,0];
_landrover3 = "LandRover_Special_CZ_EP1" createVehicle [(_isFlat select 0) + 10 - random 20,(_isFlat select 1) + 10 - random 20,0];
{_x setDir random 360; _x setDamage (random 0.9); _x lock true} foreach [_landrover1,_landrover2,_landrover3];


_get_attacker_pos = {

	_pos = _this select 0;
	_ang = _this select 1;
	_rad = _this select 2;

	_a = (_pos select 0)+(sin(_ang)*_rad);
	_b = (_pos select 1)+(cos(_ang)*_rad);

	_pos = [_a,_b,_pos select 2];

	_pos
};


_attacker = [];
for "_i" from 1 to 5 do {
	_spawnpos = [_isFlat,(360/5)*_i,100] call _get_attacker_pos;
	call compile format["_attacker%1 = [tfor_enemy_side,4,_spawnpos,10] call spawnInf; {_attacker = _attacker + [_x]} foreach units _attacker%1",_i];
};
{_x setCaptive true} foreach _attacker;



While{{side _x == tfor_friendly_side} count nearestObjects[_isFlat,["Man","Air","LandVehicle"],320] == 0 && tfor_deathcount <= tfor_max_death_per_mission} do{sleep 5};

{_x setCaptive false; _x allowFleeing 0} foreach (_attacker + units _grp);
{(_x addWaypoint [_isFlat,5]) setWaypointType "SAD"} foreach [_attacker1,_attacker2,_attacker3,_attacker4,_attacker5];


While{{alive _x} count _attacker > 0 && tfor_deathcount <= tfor_max_death_per_mission} do{sleep 5};
{_x allowDamage true} foreach units _grp;

tfor_commandchat = "More enemy units are heading to your position. Hold and Defend.";
publicVariable "tfor_commandchat";
player commandChat tfor_commandchat;


_amountattacker = 3 max (ceil (playersNumber tfor_friendly_side max 1)/2);
for "_i" from 1 to _amountattacker do {
	_spawnpos = [_isFlat,(360/_amountattacker)*_i,350] call _get_attacker_pos;

	call compile format["

	_attacker%1 = [tfor_enemy_side,4,_spawnpos,10] call spawnInf;
	if(random 2 < 1) then {
		_cargrp = [tfor_%2_car call getRandomElement,tfor_enemy_side,_spawnpos,20] call spawnVehicle;
		(units _cargrp) joinSilent _attacker%1;
		sleep 1; deleteGroup _cargrp;
	};
	{_attacker = _attacker + [_x]} foreach units _attacker%1;
	(_attacker%1 addWaypoint [_isFlat,5]) setWaypointType 'SAD';

	",_i,tfor_enemy_side];
};

{_x allowFleeing 0} foreach _attacker;

([_arrow,_landrover1,_landrover2,_landrover3] + units _grp + _attacker) spawn tfor_cleanup_after_mission;

While{{alive _x} count _attacker > 3 && {alive _x} count units _grp > 0 && tfor_deathcount <= tfor_max_death_per_mission} do{sleep 5};

{_x allowFleeing 1} foreach _attacker;


if({alive _x} count units _grp > 0) then {
	tfor_missionstate = "SUCCESS";
} else {
	tfor_missionstate = "FAIL";
};