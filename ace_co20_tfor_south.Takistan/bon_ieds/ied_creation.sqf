//by Bon_Inf*

if(not isServer) exitWith {};


_debug = false; // create markers at IED positions


private ["_iedpos","_offset","_ied"];


// the following line is a CPU overkill :-(
// whenever possible, avoid usage of nearroads with a radius > 100
_roads = (Server nearRoads 20000) - ((bon_ied_greenzone select 0) nearRoads (bon_ied_greenzone select 1));


_iedpositions = [];

while{count _roads > 0 && count _iedpositions < bon_number_ieds} do {

	_j = (count _roads - 1) min (round random (count _roads));
	_iedpos = _roads select _j;
	_roads = _roads - [_iedpos]; // in each step _roads get smaller, hence deterministic

	if({_x distance _iedpos < 1000} count _iedpositions == 0) then {

		_iedpositions = _iedpositions + [_iedpos];

		_j = (count bon_ied_container - 1) min (round random (count bon_ied_container));
		_ied = (bon_ied_container select _j) createVehicle position _iedpos;

		if(random 2 > 1) then {_offset = [-7.5 - random 3,0,0]} else {_offset = [7.5 + random 3,0,0]};
		_ied setPosATL (_iedpos modelToWorld _offset);

		_ied setVehicleInit format["
			this addAction ['<t color=""#FFCC00"">Blow IED</t>','%1blow.sqf'];
			this addAction ['<t color=""#F00000"">Defuse IED</t>','%1defuse.sqf'];
		",BON_IED_PATH]; processInitCommands;
		_ied execFSM (BON_IED_PATH+"ied_sensor.fsm");
	};
};



if(_debug) then{
	{
		(createMarker [str position _x,position _x]) setMarkerType "dot";
	} foreach _iedpositions;
	hint format["IEDs created: %1",count _iedpositions];
};