// by Bon_Inf*

if(not isServer) exitWith{};

private ["_partitionsize","_location"];

#include "mm_funcs.sqf"

//tfor_missions = ["insurgency","clearlocation","searchcache","destroyradarscud","rescuepilot","bringtruck","defendcamp","destroyfirebase","captureofficer","relievesquad","markfueldump","airattack","tankattack","supporttroops","destroycamps"] call getArrayPermutation;

tfor_locations = nearestLocations [getMarkerPos format["respawn_%1",tfor_friendly_side],["Name","NameVillage","NameCity","NameCityCapital"],20000];
{if(surfaceiswater [position _x select 0, position _x select 1]) then {tfor_locations = tfor_locations - [_x]}} foreach tfor_locations;


tfor_locations_available = [];

tfor_missionstate = "IN PROGRESS";
tfor_mission_successcounter = 0;
tfor_mission_failcounter = 0;



for "_i" from 1 to (count tfor_locations) min (tfor_maxmissions*2) do {

	if(count tfor_locations == 0) then {
		tfor_locations = tfor_locations_available;
		tfor_locations_available = [];
		_partitionsize = nil;
	};
	if(isNil "_partitionsize") then {_partitionsize = ceil ((count tfor_locations) / tfor_maxmissions)};

	_nextclosest_locations = [];
	for "_l" from 0 to ((_partitionsize - 1) min (count tfor_locations - 1)) do {
		_nextclosest_locations = _nextclosest_locations + [tfor_locations select _l];
	};
	tfor_locations = tfor_locations - _nextclosest_locations;	
	_nextclosest_locations = _nextclosest_locations - nearestLocations [getMarkerPos format["respawn_%1",tfor_friendly_side],["Name","NameVillage","NameCity","NameCityCapital"],800];

	if(isNil "_location") then{
		_location = _nextclosest_locations call getRandomElement;
	} else {
		_found = false;
		{
			if(position _x distance position _location < 2000) exitWith {_found = true; _location = _x};
		} foreach _nextclosest_locations;
		if(not _found) then{_location = _nextclosest_locations call getRandomElement};
	};

	tfor_locations_available = tfor_locations_available + (_nextclosest_locations - [_location]);

	_mission = tfor_missions call getRandomElement;
	tfor_missions = tfor_missions - [_mission];

	tfor_currentmission = [_location,_mission,tfor_missionstate];
	publicVariable "tfor_currentmission";

	[_location,_mission,tfor_missionstate] execVM "scripts\missions\tasks.sqf";

	if(tfor_enemy_patrols > 0) then{[_location] execVM "scripts\missions\enemy_patrols_foot.sqf"};
	if(tfor_rallypoints > 0) then{[_location] execVM "scripts\missions\fop.sqf"};
	[_location] execVM "scripts\missions\snipers.sqf";

	sleep 5; // <- note: keep this sleep for other scripts to detect mission state change !!!

	tfor_missionstate = "IN PROGRESS";
	[_location] execVM format["scripts\missions\mscripts\%1.sqf",_mission];
	diag_log text format["TFOR MISSIONMANAGER: Starting mission %1 at %2",_mission,text _location];

	While{tfor_missionstate == "IN PROGRESS"} do{sleep 1};
	diag_log text format["TFOR MISSIONMANAGER: Mission complete. State: %1",tfor_missionstate];

	if(tfor_missionstate == "SUCCESS") then {
		tfor_mission_successcounter = tfor_mission_successcounter + 1;
	} else {
		tfor_mission_failcounter = tfor_mission_failcounter + 1;
	};

	tfor_deathcount = 0;
	publicVariable "tfor_deathcount";

	if(tfor_mission_successcounter == tfor_maxmissions) exitWith {
		tfor_endmission_success = true;
		publicVariable "tfor_endmission_success";
	};
	if(tfor_mission_failcounter == tfor_maxmissions) exitWith {
		tfor_endmission_fail = true;
		publicVariable "tfor_endmission_fail";
	};
};

// can only become true if you ran out of locations :
if(not tfor_endmission_success && not tfor_endmission_fail) then {
		tfor_endmission_success = true;
		publicVariable "tfor_endmission_success";
};