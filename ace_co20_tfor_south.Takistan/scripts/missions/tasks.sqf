// by Bon_Inf*
// executed by initSideMissions.sqf, publicVariableEventHandler "SideObjective"

WaitUntil{not isNull player || isServer};
if(isDedicated) exitWith{};

_location = _this select 0;
_mission = _this select 1;
_statelastmission = _this select 2;


// _marker = [ "ellipse" or "icon" , icon type (defined in CfgMarkers) , [size_x,size_y] , text ];
_marker = ["ELLIPSE","",[250,250],""];



if(not isNil "tfor_currenttask") then {
	if(_statelastmission == "SUCCESS") then {
		tfor_currenttask setTaskState "SUCCEEDED";
		taskhint ["Task complete.\nGood Job!", [0.6, 0.839, 0.47, 1], "taskDone"];
	};
	if(_statelastmission == "FAIL") then{
		tfor_currenttask setTaskState "FAILED";
		taskhint ["Task failed.", [1, 0.2, 0.3, 1], "taskFailed"];
	};

	tfor_waitfornewtask = player createSimpleTask ["Mission"];
	tfor_waitfornewtask setSimpleTaskDescription ["Await next task.","Await next task.",""];
	sleep tfor_missiondelay;
	player removeSimpleTask tfor_waitfornewtask;
};



switch _mission do {

	case "clearlocation" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Enemy forces gather in %1. Dominate the area.",text _location],format["Clear %1",text _location],format["Clear %1",text _location]];
		taskhint [format["New task:\nClear %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
	};
	case "searchcache" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Search %1 for a weapon cache reported by locals and destroy it.",text _location],format["Search cache in %1",text _location],format["Cache in %1",text _location]];
		taskhint [format["New task:\nSearch and destroy cache in %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_destroy",[1,1]," s.a.d. cache"];
	};
	case "destroyradarscud" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Destroy an enemy Anti-Air Radar and a Scud launcher located in %1.",text _location],format["Destroy AA-Radar and Scud in %1",text _location],format["Radar,Scud in %1",text _location]];
		taskhint [format["New task:\nDestroy Anti-Air Radar and Scud launcher in %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_destroy",[1,1]," destroy radar+scud"];
	};
	case "rescuepilot" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["A Blackhawk pilot has been shot down over %1. Find and destroy the UH60 wreck, secure the pilot and bring him back to base.",text _location],format["Blackhawk down in %1",text _location],format["Pilot in %1",text _location]];
		taskhint [format["New task:\nBlackhawk down in %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_destroy",[1,1]," s.a.r. pilot"];
	};
	case "stopconvoy" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["A convoy of two armed vehicles and a support truck is starting its schedule every day in %1, driving its route along the near towns and hideouts. Search the convoy and destroy it.",text _location],"Destroy the convoy","Convoy"];
		taskhint [format["New task:\nStop a convoy starting in %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_start",[1,1]," convoy start"];
	};
	case "bringtruck" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["There is a support truck waiting at base. Your task is to bring it to a solitary outpost in %1. You fail the mission in case the support truck gets destroyed.",text _location],format["Bring supports to %1",text _location],format["Supports to %1",text _location]];
		taskhint [format["New task:\nBring supports to %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_end",[1,1]," outpost needs support"];
	};
	case "defendcamp" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Something is going on in %1. Investigate the area.",text _location],format["Investigate %1",text _location],format["Investigate %1",text _location]];
		taskhint [format["New task:\nInvestigate the area of %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_unknown",[1,1]," investigate"];
	};
	case "captureofficer" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Capture an officer commanding his troups in %1 and bring him to your base. Mission considered failed if he dies.",text _location],format["Capture officer in %1",text _location],format["Officer in %1",text _location]];
		taskhint [format["New task:\nCapture an enemy officer in %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
	};
	case "destroyfirebase" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Something is going on in %1. Investigate the area.",text _location],format["Investigate %1",text _location],format["Investigate %1",text _location]];
		taskhint [format["New task:\nInvestigate the area of %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_unknown",[1,1]," investigate"];
	};
	case "relievesquad" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["A squad of friendlies was ambushed in %1 and is now under attack by enemy infantry forces. Move to them asap and provide fire support.",text _location],format["Relieve Squad in %1",text _location],format["Squad in %1",text _location]];
		taskhint [format["New task:\nHelp a suppressed squad in %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_dot",[1,1]," help squad"];
	};
	case "markfueldump" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["An enemy fuel dump has been spotted in %1. Your task is to mark it with a %2 or something similar for our artillery.",text _location,getText (configFile >> "CfgMagazines" >> tfor_markfueldump_markerobjects select 0 >> "displayname")],format["Mark fuel dump in %1",text _location],format["fuel dump in %1",text _location]];
		taskhint [format["New task:\nMark Fuel Dump in %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_destroy",[1,1]," mark fuel dump"];
	};
	case "airattack" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Something is going on in %1. Investigate the area.",text _location],format["Investigate %1",text _location],format["Investigate %1",text _location]];
		taskhint [format["New task:\nInvestigate the area of %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_unknown",[1,1]," investigate"];
	};
	case "tankattack" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Something is going on in %1. Investigate the area.",text _location],format["Investigate %1",text _location],format["Investigate %1",text _location]];
		taskhint [format["New task:\nInvestigate the area of %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_unknown",[1,1]," investigate"];
	};
	case "destroycamps" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Besides enemy forces occupying %1, Recon spotted some enemy militia camps. Your task is to locate and clear all militia camps around %1, while suppressing the %2ern forces and forcing them to stay in %1.",text _location,tfor_enemy_side],format["Destroy Camps in %1",text _location],format["Camps in %1",text _location]];
		taskhint [format["New task:\nDestroy militia camps in %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
	};
	case "supporttroops" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Main enemy attack forces gathered in %1. Your task is to link up with and support our Regimental Combat Team in their engagement (check map for rallypoint position). You fail if our own forces can't dominate the battle.",text _location],format["Attack %1",text _location],format["Attack %1",text _location]];
		taskhint [format["New task:\nAttack %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
	};
	case "insurgency" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Localists told us about another weapon cache around %1. We cannot say whether these information are reliable or not. So we suggest you engage %1 and SEARCH THE ENEMY FOR FURTHER HINTS.",text _location],format["Cache search in %1",text _location],format["Insurgency",text _location]];
		taskhint [format["New task:\nSearch cache in %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
	};
};



if(not isNil "tfor_missionmarker") then {deleteMarker tfor_missionmarker};
tfor_missionmarker = createMarkerLocal ["currentSide",position _location];
tfor_missionmarker setMarkerShape (_marker select 0);
tfor_missionmarker setMarkerType (_marker select 1);
tfor_missionmarker setMarkerSize (_marker select 2);
tfor_missionmarker setMarkerText (_marker select 3);
tfor_missionmarker setMarkerColor "ColorRed";


tfor_currenttask setSimpleTaskDestination [(position _location) select 0,(position _location) select 1,0];
player setCurrentTask tfor_currenttask;