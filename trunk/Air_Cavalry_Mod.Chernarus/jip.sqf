//
// By Hailo (totaldamage.org)
//
// IMPORTANT: ADD A GAMELOGIC NAMED "server"
//
// Handle join in progress events
//

_event = objNull;
_name = objNull;
_id = objNull;
_locality = "player";

if(count _this == 4) then {
	// event handler
	_event = _this select 0;
	_runOnlocality = format["%1",_this select 1];
	_name = _this select 2;
	_id = _this select 3;
		
	if ((_runOnlocality == "player") and (!local player)) exitWith {};
	if ((_runOnlocality == "server") and (!local server)) exitWith {};
	if ((_runOnlocality == "dedicatedserver") and (local player)) exitWith {};
	
	if (local server) then { _locality = "server"; };
	if (!local player) then { _locality = "dedicatedserver"; };
} else {
	// server logic
	if(count _this == 3) then {
		if (local server) then { _locality = "server"; };
		if (!local player) then { _locality = "dedicatedserver"; };
		_event = _this select 0;
		_name = _this select 1;
		_id = _this select 2;
	};
};
if ((format["%1",_name] == "<NULL-object>") and (format["%1",_id] == "<NULL-object>")) exitWith {};

if ((_locality == "server") or (_locality == "dedicatedserver")) then {
	// raise event on clients
	switch (format["%1",_event]) do {
		case "Connected": {
			// raise server connected event
			if (_locality == "dedicatedserver") then { nil = ["dedicatedserver", _name, _id] execVM "events\onPlayerConnected.sqf"; } 
			else { nil = ["server", _name, _id] execVM "events\onPlayerConnected.sqf"; };
			
			// raise client connected event
			_obj = "HeliHEmpty" createVehicle [0,0,0];			
			_obj setVehicleInit "nil = [""player"", """+format["%1",_name]+""", "+format["%1",_id]+"] execVM ""events\onPlayerConnected.sqf"";";
			processInitCommands;
			deleteVehicle _obj;
		};
		case "Disconnected": {
			// raise server disconnected event
			if (_locality == "dedicatedserver") then { nil = ["dedicatedserver", _name, _id] execVM "events\onPlayerDisconnected.sqf"; } 
			else { nil = ["server", _name, _id] execVM "events\onPlayerDisconnected.sqf"; };

			// raise client disconnected event
			_obj = "HeliHEmpty" createVehicle [0,0,0];
			_obj setVehicleInit "nil = [""player"", """+format["%1",_name]+""", "+format["%1",_id]+"] execVM ""events\onPlayerDisconnected.sqf"";";
			processInitCommands;
			deleteVehicle _obj;
		};
	};
};

