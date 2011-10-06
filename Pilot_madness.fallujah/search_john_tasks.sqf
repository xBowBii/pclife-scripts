if (myas != 1) then {

	if (isServer) then {
		sleep 8;
		[-2, {leader player sideChat _this}, "Damn, seems we killed someone, that may be useful for us"] call CBA_fnc_globalExecute;
		sleep 6;
		[-2, {leader player sideChat _this}, "John isn't here, so we suggest, that he is alive and those bastards captured him"] call CBA_fnc_globalExecute;
		sleep 6;
		[-2, {leader player sideChat _this}, "Before crash I noticed many hangars in this area, but this is fucking kilometer area of search."] call CBA_fnc_globalExecute;
		sleep 6;
		[-2, {leader player sideChat _this}, "We have to search in any big building in this area."] call CBA_fnc_globalExecute;
		sleep 6;
		[-2, {leader player sideChat _this}, "I think, they won't leave him without guard, so that simplifies our task."] call CBA_fnc_globalExecute;
		sleep 6;
		[-2, {leader player sideChat _this}, "He may be heavy wounded or even dead. But we need to make a decision: we'll come home with him, or without."] call CBA_fnc_globalExecute;
		_search = createMarker ["search1", position searchh];
		_search setMarkerSize [500, 500];
		_search setMarkerShape "ELLIPSE";
		_search setMarkerBrush "BORDER";
		_search setMarkerColor "ColorRed";
		_searchtext = createMarker ["searchtxt1", position searchh];
		_searchtext setMarkerShape "ICON";
		_searchtext setMarkerText "John search zone";
		_searchtext setMarkerColor "ColorRed";
		_searchtext setMarkerType "Pickup";
	};
	tskobj6 = player createSimpleTask["Find John"];
	tskobj6 setSimpleTaskDestination (getMarkerPos "obj6");
	tskobj6 setSimpleTaskDescription["Find and rescue John", "Check all marked zones", "Search zone"];
	player setCurrentTask tskobj6;
	tskobj2 setTaskState "Canceled";
};
