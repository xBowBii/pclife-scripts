// by Bon_Inf*

if(not isServer) exitWith{};

_location = _this select 0;
_pos = position _location;
_size = ((size _location) select 0) max ((size _location) select 1);


EnemiesSpawned = false;
[_location] execVM "scripts\missions\spawn_enemies.sqf";


_wreck = tfor_rescuepilot_heliwreck createVehicle [(_pos select 0) + 2*_size - random 4*_size,(_pos select 1) + 2*_size - random 4*_size,0];
//[_wreck] execVM "scripts\c4only.sqf";
_wreck addEventHandler ["Killed",{
	(_this select 0) spawn {
		sleep 2;
		deleteVehicle _this;
	};
}];

_grp = createGroup tfor_friendly_side;
_pilot = _grp createUnit [tfor_rescuepilot_pilottype, _pos, [], 0, "FORM"];
_pilot setCaptive true;
_pilot setHit ["hands",1];
_pilot setHit ["head_hit",0.4];
_pilot setHit ["body",0.5];
_pilot playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
_pilot disableAI "MOVE";
_pilot disableAI "ANIM";
_pilot setVehicleInit "
	this addAction ['capture','scripts\capture.sqf'];
	this addAction ['grab','scripts\grab.sqf'];
"; processInitCommands;
removeAllWeapons _pilot;


_houses = [position _location,300] call getEnterableHouses;

if((count _houses) > 0) then {

	_house = _houses call getRandomElement;

	_buildingpos = 1 max (round random (_house select 1));
	_house = _house select 0;

	_pilot setPos (_house buildingPos _buildingpos);
} else {
	_pilot setPos [(_pos select 0) + _size - round random (2*_size),(_pos select 1) + _size - round random (2*_size),0];
};


_guards = [tfor_enemy_side,3,_pos,50] call spawnInf;
(units _guards) spawn tfor_cleanup_after_mission;

_guards allowFleeing 0;
(_guards addWaypoint [position _pilot,0]) setWaypointType "HOLD";
_guards setFormation "DIAMOND";


While{
	tfor_deathcount <= tfor_max_death_per_mission	&&
	(_pilot distance getMarkerPos "Barracks" > 100	||
	alive _wreck)					&&
	alive _pilot
} do {sleep 5};


if(not alive _pilot || tfor_deathcount > tfor_max_death_per_mission) then {
	tfor_missionstate = "FAIL";
} else {
	tfor_missionstate = "SUCCESS";
};


sleep 5;
deleteVehicle _wreck;
_pilot action ["eject",vehicle _pilot];
sleep 1;
deleteVehicle _pilot;
deleteVehicle _wreck;
sleep 1;
deleteGroup _grp;