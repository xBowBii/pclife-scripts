if (isServer) then {

CONNECTEDPLAYERS = [];
publicVariable "CONNECTEDPLAYERS";
onPlayerConnected "[_id, _name, _uid] execVM ""playerConnected.sqf""";
onPlayerDisconnected "[_id, _name, _uid] execVM ""playerDisconnected.sqf""";

}; 
