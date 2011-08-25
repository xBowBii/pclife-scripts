if (isServer) then {
_marker = _this select 0;
_area = _this select 1;
_radius = _this select 2;
_respawn = _this select 3;
_list = _area nearRoads _radius;
_iedarray = ["Garbage_can","Garbage_container","Land_Crates_stack_EP1","Land_tires_EP1","Land_transport_crates_EP1","BMP2Wreck","BRDMWreck","LADAWreck","hiluxWreck","datsun01Wreck","datsun02Wreck","SKODAWreck","T72Wreck","T72WreckTurret","UAZWreck","UralWreck"];
_roadpositions = [0, 2, 3, 4, 5, 6, -6, -5, -4, -3, -2];
PAPABEAR=[West,"HQ"];
sleep 10;

while {true} do {

_roads = floor random (count _list); 
_road = _list select _roads;

_ieds = floor random (count _iedarray); 
_ied = _iedarray select _ieds;

_roadpos = floor random (count _roadpositions); 
_offset = _roadpositions select _roadpos;

_iedobj = _ied createVehicle (position _road);
_iedobj setPos (_road modelToWorld [_offset, 0, 0]);
_iedobj setdamage 0.75;
_iedobj setdir (random 359);
_marker setpos (getpos _iedobj);

_trg=createTrigger["EmptyDetector",getPos _iedobj];
_trg setTriggerArea[10,10,0,false];
_trg setTriggerActivation["WEST","PRESENT",false];
_trg setTriggerStatements["this", "_bomb = nearestObject [getPos (thislist select 0), 'static']; _bomb setdamage 1; [center,nil,rGLOBALCHAT,'ALLAHU AKBAR!!!'] call RE;", ""];

while {alive _iedobj} do {
sleep 0.5;
};

_boom1 = "ACE_PipebombExplosion" createVehicle (position _iedobj);
_boom2 = "ACE_PipebombExplosion" createVehicle [(getPos _iedobj select 0) + 2.5, getPos _iedobj select 1, getPos _iedobj select 2];
_boom3 = "ACE_PipebombExplosion" createVehicle [(getPos _iedobj select 0) - 2.5, getPos _iedobj select 1, getPos _iedobj select 2];
_boom4 = "ACE_PipebombExplosion" createVehicle [getPos _iedobj select 0, (getPos _iedobj select 1) + 2.5, getPos _iedobj select 2];
_boom5 = "ACE_PipebombExplosion" createVehicle [getPos _iedobj select 0, (getPos _iedobj select 1) - 2.5, getPos _iedobj select 2];
_he = "sh_125_he" createVehicle (position _iedobj);
_wp1 = "sh_105_wp" createVehicle (position _iedobj);
_wp2 = "ACE_M34" createVehicle (position _iedobj);
_sm = "ARTY_SmokeShellWhite" createVehicle (position _iedobj);
deletevehicle _iedobj;
deletevehicle _trg;
_marker setpos (getpos server);
sleep 1 + (random 2);
[PAPABEAR,nil,rSIDECHAT,"IED Detonated!"] call RE;
sleep _respawn;
};
};