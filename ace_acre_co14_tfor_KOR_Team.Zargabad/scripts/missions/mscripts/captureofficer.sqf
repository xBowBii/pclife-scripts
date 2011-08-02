// by Bon_Inf*

if(not isServer) exitWith{};

private ["_pos"];


_location = _this select 0;
_position = position _location;


EnemiesSpawned = false;
[_location] execVM "scripts\missions\spawn_enemies.sqf";


_pos = [_position,150] call getFlatArea;
["outpost_2",round random 360,_pos] execVM "dyno\objectMapper.sqf";

sleep 10;
_outpost_objects = ("outpost_2" call (compile (preprocessFileLineNumbers "dyno\getObjects.sqf")));
nearestObjects[_pos,_outpost_objects,50] spawn tfor_cleanup_after_mission;


_officergrp = createGroup tfor_enemy_side;
_officer = _officergrp createUnit [tfor_captureofficer_officer,position _location,[],0,"FORM"];

_officer setRank "COLONEL";
_officer setCaptive true;
_officer allowFleeing 0;
_officer setVehicleInit "
	this addAction ['capture','scripts\capture.sqf'];
	this addAction ['grab','scripts\grab.sqf'];
"; processInitCommands;
removeAllWeapons _officer;

_officer setPos getPos (nearestObjects [_pos,["House"],50] select 0);
_officer setDamage 0;
(_officergrp addWaypoint [position _officer,0]) setWaypointType "HOLD";


[_officer,_pos] spawn {
	_officer = _this select 0;
	_pos = _this select 1;

	while{alive _officer} do{
		while{{isPlayer _x} count units group _officer > 0 && alive _officer} do{
			_mindist_to_group = 999999;
			{_mindist_to_group = _mindist_to_group min (_officer distance _x)} foreach (units group _officer)-[_officer];
			
			if(_mindist_to_group > 50) then{
				[_officer] joinSilent GrpNull;
				{deleteWaypoint _x} foreach waypoints group _officer;
				(group _officer addWaypoint [_pos,0]) setWaypointType "HOLD";
			};
			sleep 5;
		};
		sleep 5;
	};
};


While{_officer distance getMarkerPos format["respawn_%1",tfor_friendly_side] > 50 && alive _officer && tfor_deathcount <= tfor_max_death_per_mission} do{sleep 10};


if(not alive _officer || tfor_deathcount > tfor_max_death_per_mission) then {
	tfor_missionstate = "FAIL";
} else {
	tfor_missionstate = "SUCCESS";
};


sleep 10;
_officer action ["eject",vehicle _officer];
sleep 1;
{deleteVehicle _x} foreach units _officergroup;
sleep 1;
deleteGroup _officergrp;
deleteVehicle _officer;