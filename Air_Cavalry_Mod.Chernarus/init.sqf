usEra = 0;
rusEra = 0;
specEra = 0;
// FUCK THIS SHIT
_null = [] execVM "briefing.sqf";
_null = [] execVM "chooseObjective.sqf";
ace_wounds_prevtime = 300;

/*if (local server or !local player) then {
	onPlayerConnected "nil = [""Connected"",_name,_id] execVM ""jip.sqf"";";
	onPlayerDisconnected "nil = [""Disconnected"",_name,_id] execVM ""jip.sqf"";";
};
*/

//_EastHQ = createCenter east;