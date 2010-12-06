tskobj1 = player createSimpleTask["Clear the city"];
tskobj1 setSimpleTaskDestination (getMarkerPos taskpoint);
tskobj1 setSimpleTaskDescription["Secure the Guerilla held town and the area surrounding it", "Capture the town", "Capture Town"];
player setCurrentTask tskobj1;