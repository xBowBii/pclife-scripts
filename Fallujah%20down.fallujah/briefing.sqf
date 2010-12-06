player createDiaryRecord["Diary", ["Situation", "<br/> Three teams (<marker name='alpha'>Alpha Team</marker>, <marker name='bravo'>Bravo Team</marker>, <marker name='delta'>Delta Team</marker>) in city are cutted off from each other, and running low ammo. They need help and ammo for regroup and evac. <br/> Resupply convoy with <marker name='support'>Support team</marker> moving in city for help. <br/> <marker name='renegade'>Renegades</marker> dropping two groups in city for help and convoy cover."]];

player createDiaryRecord["Diary", ["Task", "<br/> <marker name='renegade'>Renegades</marker> fly in the city, and dropping two small groups with additional ammunition in points: <marker name='ext1'>Extraction point 1</marker> and <marker name='ext2'>Extraction point 2</marker>. <br/>Team one regrouping with <marker name='alpha'>Alpha Team</marker>, and covering place for <marker name='convstop'>convoy</marker>, team two regrouping with <marker name='delta'>Delta Team</marker>, then going to rescue <marker name='bravo'>Bravo Team</marker>. <br/> Delta, Bravo and team regrouping with convoy, and then moving from city. <br/>Renegades providing air support after extractions, and leaving city with convoy."]];

tskobj1 = player createSimpleTask["Mission"]; 
tskobj2 = convoycom createSimpleTask["Get in the city"]; 
tskobj3 = pilot1 createSimpleTask["Take and drop Team one"]; 
tskobj4 = pilot2 createSimpleTask["Take and drop Team two"]; 
tskobj5 = alphacom createSimpleTask["Cover position for LZ1"]; 
tskobj6 = deltacom createSimpleTask["Cover position for LZ2"]; 
tskobj7 = bravocom createSimpleTask["Hold position"]; 

tskobj2 setSimpleTaskDestination (getMarkerPos "obj2");
tskobj2 setSimpleTaskDescription["Move in combat zone, and pick-up Alpha, Bravo and Delta teams with Team one and two.", "Move in city", "Regroup point"];

tskobj3 setSimpleTaskDestination (getMarkerPos "obj3");
tskobj3 setSimpleTaskDescription["Fly in combat zone, and drop Team One near Alpha Team", "Drop Team one", "LZ One"]; 

tskobj4 setSimpleTaskDestination (getMarkerPos "obj4");
tskobj4 setSimpleTaskDescription["Fly in combat zone, and drop Team Two near Delta Team", "Drop Team two", "LZ Two"]; 

tskobj5 setSimpleTaskDestination (getMarkerPos "obj5");
tskobj5 setSimpleTaskDescription["Cover area for landing", "Cover LZ1", "LZ One"]; 

tskobj6 setSimpleTaskDestination (getMarkerPos "obj6");
tskobj6 setSimpleTaskDescription["Cover area for landing", "Cover LZ2", "LZ Two"]; 

tskobj7 setSimpleTaskDestination (getMarkerPos "obj7");
tskobj7 setSimpleTaskDescription["Hold position until Delta come up", "Hold position", "Hold"]; 

tskobj1 setSimpleTaskDestination (getMarkerPos "obj1");
tskobj1 setSimpleTaskDescription["Read the notes for details", "Mission", "Mission"]; 
