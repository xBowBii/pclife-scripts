tskobj1 setTaskState "SUCCEEDED";
_null = [objNull,objNull,tskobj1, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
tskobj2 = player createSimpleTask["Return to base"];
tskobj2 setSimpleTaskDestination (getMarkerPos taskpointtwo);
tskobj2 setSimpleTaskDescription["Let's go home", "Return to base", "Return to base"];
player setCurrentTask tskobj2;