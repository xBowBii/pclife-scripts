//
// By Hailo (totaldamage.org)
//
// IMPORTANT: ADD A GAMELOGIC NAMED "server"
//
// Handle join in progress events
// Supports: [_locality, _name, _id]
// _locality can be any of the following: player, server, dedicatedserver
//

_runOnlocality = _this select 0; 
_name = _this select 1; 
_id = _this select 2;
_locality = "player";

if ((_runOnlocality == "player") and (!local player)) exitWith {};
if ((_runOnlocality == "server") and (!local server)) exitWith {};
if ((_runOnlocality == "dedicatedserver") and (local player)) exitWith {};
if (local server) then { _locality = "server"; };
if (!local player) then { _locality = "dedicatedserver"; };

switch (_locality) do {
	case "player": {
		if (_name == name player) then {
			if(format["%1", HLOsDebug] == "true") then { hint format["onPlayerDisconnected.sqf:\nA player is disconnecting.\n\nLocality = %1\nName: %2\nID: %3\n\nThis has been executed on the disconnecting player.",_locality,_name,_id]; };
			// ************************************************************************************************************************************************************ //
			// This will be executed on the disconnecting player. Add your code below this line.
			
			
			// ************************************************************************************************************************************************************ //
		}
		else
		{
			if(format["%1", HLOsDebug] == "true") then { hint format["onPlayerDisconnected.sqf:\nA player is disconnecting.\n\nLocality = %1\nName: %2\nID: %3\n\nThis has been executed on all players excluding the disconnecting player.",_locality,_name,_id]; };
			// ************************************************************************************************************************************************************ //
			// This will be executed on all players excluding the disconnecting player. Add your code below this line.
			
			
			// ************************************************************************************************************************************************************ //
		};
	};
	default {
		if (_locality == "server" or _locality == "dedicatedserver") then {
			if(format["%1", HLOsDebug] == "true") then {
				if (_locality == "server") then { player globalchat "onPlayerConnected.sqf: A player is connecting. This has been executed on the server."; player globalchat format["onPlayerConnected.sqf: Locality = %1, Name: %2, ID: %3.",_locality,_name,_id]; };
				if (_locality == "dedicatedserver") then { player globalchat "onPlayerConnected.sqf: A player is connecting. This has been executed on the dedicated server."; player globalchat format["onPlayerConnected.sqf: Locality = %1, Name: %2, ID: %3.",_locality,_name,_id]; };
			};
			// ************************************************************************************************************************************************************ //
			// This will be executed on the server. Add your code below this line.
					
			
			// ************************************************************************************************************************************************************ //
		};
	};
};

