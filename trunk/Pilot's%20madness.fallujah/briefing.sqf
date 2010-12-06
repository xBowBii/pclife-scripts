player createDiaryRecord["Diary", ["Situation", "Support helicopter crashed in Fallujah city."]];

player createDiaryRecord["Diary", ["Task", "Move from <marker name='crash'>crash site</marker> to <marker name='safe'>safe zone</marker>. You can use dropped ammo boxes. And don't forget to rescue John!"]];

tskobj1 = player createSimpleTask["Hard day"]; 
tskobj2 = player createSimpleTask["Check for John"]; 
tskobj1 setSimpleTaskDestination (getMarkerPos "obj1");
tskobj1 setSimpleTaskDescription["You should go to airport, and survive.", "Move to safe zone", "Safe zone"]; 
tskobj2 setSimpleTaskDestination (getMarkerPos "obj2");
tskobj2 setSimpleTaskDescription["Find John and rescue him.", "Find John", "John drop zone"]; 
player setCurrentTask tskobj2;