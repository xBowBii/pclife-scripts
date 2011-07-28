This piece of code is the usual BIS UAV module, though a bit modified in a
sense that the UAV is created dynamically for each player who executes the
enclosed uav\init.sqf and gets deleted when the player disconnects.

In case the UAV crashes the logic, uav itself as well as the crew gets
cleaned up (i.e deleted) and the whole thing restarts, with a new logic
and a new UAV.

All scripts are running locally, only the vehicle name of the logic gets
broadcasted (as BIS did themselves) to avoid conflicts when more than one
instance of this script is running during a session.


Note: You need a gamelogic placed on the map with the name "server";



All objects serving as terminals for the UAV you can retrieve by
bon_uav_logic getVariable "uav_terminals",
and using "setVariable" you can add/remove such dynamically.



Along with the content in the uav\ folder the following piece of code is re-
quired, usually placed in the mission's init.sqf:

onPlayerDisconnected "
	_uavgarbage = Server getVariable format['bon_uav_%1',_uid];
	if(not isNil '_uavgarbage') then {_uavgarbage execVM (BON_UAV_PATH+'cleanup.sqf')};
";