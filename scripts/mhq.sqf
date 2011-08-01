// by Bon_Inf*


tfor_mhqlogic = _this select 0;
if(isNull tfor_mhqlogic) exitWith{};


_dir = getDir tfor_mhqlogic;
_pos = getPos tfor_mhqlogic;


_mhq_respawntime = 600; //seconds


WaitUntil{not isNil "tfor_mhqtype"};
if(isServer) then{
	tfor_mhq = tfor_mhqtype createVehicle _pos; tfor_mhq setPos _pos; tfor_mhq setDir _dir;
	publicVariable "tfor_mhq";
};

if(not isDedicated) then {
	[tfor_mhqlogic] execVM "bon_construction\init_mhq.sqf";
	tfor_mhqlogic spawn {
		while{alive _this} do {
			_marker = createMarkerLocal ["tfor_mhq",position _this];
			_marker setMarkerTypeLocal "b_hq";
			sleep 10;
			deleteMarkerLocal _marker;
		};
	};
};


WaitUntil{not isNil "tfor_mhq"};
WaitUntil{not isNil "tfor_mhqrespawn"};
if(tfor_mhqrespawn == 0 && not alive tfor_mhq) exitWith{hint parseText "<t size='1.25' color='#ef2525'>Штаб вашей команды был уничтожен.</t>"};

WaitUntil{not isNull tfor_mhq};

tfor_mhq setVariable ["tfor_nodrivercheck",true];

Waituntil{time > 0}; // attachTo command needs all initialized in order to work properly on remote machines
if(not alive tfor_mhq) then{
	detach tfor_mhqlogic;
	sleep 2;
	tfor_mhqlogic setPos [0,0,1000];
} else {
	sleep 1;
	tfor_mhqlogic attachTo [tfor_mhq,[0,0,5]];
};



if(tfor_mhqrespawn == 0) then{
	tfor_mhq spawn {

		While{alive _this} do{sleep 5}; // killed-eventhandler not working here, since its executed only where unit is local
		hint parseText "<t size='1.0' color='#ef2525'>Штаб вашей команды был уничтожен.</t>";
		deleteVehicle tfor_mhqlogic;
		sleep 120;
		deleteVehicle _this;
	};
} else {
	if(isServer) then{
		[tfor_mhq,_mhq_respawntime] execFSM "fsm\vehicle_lifecycle.fsm";

		While{tfor_mhqrespawn != 0} do{

			While{alive tfor_mhq} do{sleep 10};

			detach tfor_mhqlogic; sleep 2; tfor_mhqlogic setPos [0,0,1000];

			While{{alive _x} count nearestObjects [_pos,[tfor_mhqtype],10] == 0} do{sleep 1};
			tfor_mhq = nearestObjects [_pos,[tfor_mhqtype],10] select 0;
			publicVariable "tfor_mhq";
			tfor_mhq setVariable ["tfor_nodrivercheck",true,true];

			tfor_mhqlogic attachTo [tfor_mhq,[0,0,5]];
		};
	};
};