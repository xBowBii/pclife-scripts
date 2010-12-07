tskobj1 setTaskState "SUCCEEDED";
_null = [objNull,objNull,tskobj1, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
tskobj2 = player createSimpleTask["Defend the city"];
tskobj2 setSimpleTaskDestination (getMarkerPos taskpoint);
tskobj2 setSimpleTaskDescription["Defend the city, eliminate all attacking insurgent forces and come back home alive", "Defend the city", "Defend"];
player setCurrentTask tskobj2;