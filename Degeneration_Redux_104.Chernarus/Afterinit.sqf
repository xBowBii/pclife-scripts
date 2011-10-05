//Zombie mission init script by Celery
titleCut ["","BLACK FADED",1];
[] spawn {0 fadeSound 0;sleep 2;3 fadeSound 1};
//Wait for JIP to load
waitUntil {isDedicated or !isNull player};
//Dead characters array
if (isNil "CLY_deadcharacters") then {CLY_deadcharacters=[]};
[] execVM "LogicCycle.sqf";
//Put player in proper start position
[] execVM "RandomSpawn.sqf";
[] execVM "RandomObjects.sqf";
[] spawn {
	sleep 1;
	//Player is a dog
	CLY_noises_bark=["dog_bark01","dog_bark02","dog_bark03","dog_bark04","dog_bark05"];
	CLY_noises_yelp=["dog_yelp01","dog_yelp02","dog_yelp03"];
	if (typeOf player=="Citizen1") then {
		_group=createGroup civilian;
		germanshepherd=_group createUnit ["Pastor",getMarkerPos "start",[],0,"NONE"];
		germanshepherd setCaptive true;
		selectPlayer germanshepherd;
		publicVariable "germanshepherd";
		[player,"ItemRadio","ItemCompass","ItemWatch","ItemMap"] execVM "cly_addweapon.sqf";
		[] spawn {
			sleep 0.1;
			CLY_k9action=false;
			findDisplay 46 displayAddEventHandler ["MouseButtonDown","if ((_this select 1)==0) then {CLY_k9action=true}"];
			while {true} do {
				sleep 0.1;
				if (CLY_k9action and alive player and typeOf player in ["Fin","Pastor"]) then {
					_sound=CLY_noises_bark select floor random count CLY_noises_bark;
					_victim=objNull;
					_victims=[];
					{if (alive _x and _x!=player and side _x==sideEnemy) then {_victims set [count _victims,_x]}} forEach (player modelToWorld [0,1.25,0] nearEntities [["Man"],1]);
					if (count _victims>0) then {
						_sound=["dog_maul01","dog_02"] select floor random 2;
						_victim=_victims select 0;
						_damage=if (_victim getVariable "zombietype" in ["armored","slow armored"]) then {damage _victim+0.33} else {1};
						_victim setDamage _damage;
						if (_damage>0.9) then {
							germanshepherdhuman setVehicleInit "if (isServer) then {this addScore 1}";
							processInitCommands;
						};
					};
					if (!isNull _victim or speed player==0) then {player playMove "Dog_StopV2"};
					_object="HeliHEmpty" createVehicleLocal [0,0,0];
					_object attachTo [player,[0,0,1.5]];
					_object say3D _sound;
					[_object] spawn {sleep 5;deleteVehicle (_this select 0)};
					CLY_z_attackpv=[player,_sound];
					publicVariable "CLY_z_attackpv";
					{if (vehicle player distance _x<50) then {_x reveal player}} forEach allUnits;
					sleep 1.5;
					{if (vehicle player distance _x<50) then {_x reveal player}} forEach allUnits;
					CLY_k9action=false;
				};
			};
		};
		//Dog 180 turn
		[] spawn {
			while {alive player and !(typeOf player in CLY_deadcharacters)} do {
				if (inputAction "MoveBack"==1) then {
					_180=true;
					for "_x" from 1 to 30 do {
						if (_180) then {
							sleep 0.1;
							if (inputAction "MoveBack"==0) then {_180=false};
						};
					};
					if (_180) then {player setDir getDir player+180};
				};
				sleep 0.1;
			};
		};
	} else {
		//JIP
		player enableSimulation true;
		player setVelocity [0,0,0];
		player setPos [getPos player select 0,getPos player select 1,(getPosATL player select 2)-(getPos player select 2)];
	};
	//Vodnik
	if (!isNil "CLY_jipresumepos" and !(typeOf player in CLY_deadcharacters)) then {
		if (count crew vodnik==0) then {
			player setPosATL CLY_jipresumepos;
		} else {
			if !(player isKindOf "Animal") then {
				player moveInCargo vodnik;
			} else {
				[player] exec "hopon.sqs";
			};
		};
	};
	if !(typeOf player in CLY_deadcharacters) then {
		sleep 1;
		titleCut ["","BLACK IN",3];
		sleep 10;
		player setVariable ["victim",nil,true];
		player setVariable ["CLY_addweapon",nil];
	} else {
		player setPos [(getMarkerPos "respawn_civilian" select 0)-20+random 40,(getMarkerPos "respawn_civilian" select 1)-20+random 40,0];
	};
};

//Trigger spectator script when player is dead or already dead
[] spawn {
	waitUntil {!alive player or typeOf player in CLY_deadcharacters};
	[[],true] execVM "cly_spectate.sqf";
	if !(typeOf player in CLY_deadcharacters) then {
		CLY_deadcharacters set [count CLY_deadcharacters,typeOf player];
		publicVariable "CLY_deadcharacters";
	} else {
		titleText ["\n\nYour character is already dead.","PLAIN",0.5];
	};
};

//Kill dog if its player leaves
if (isServer) then {
	[] spawn {
		while {true} do {
			sleep 1;
			if (!isNil "germanshepherd") then {
				if (!isPlayer germanshepherd) then {
					_dog=germanshepherd;
					sleep 10;
					if (!isPlayer _dog) then {
						if (_dog==germanshepherd) then {
							germanshepherd=nil;
							publicVariable "germanshepherd";
						};
						_dog setDamage 1;
						sleep 60;
						hideBody _dog;
						sleep 5;
						deleteVehicle _dog;
					};
				};
			};
		};
	};
};

//Parameters
if (isNil "paramsArray") then {paramsArray=[2,0]};
CLY_friendlyfire=(paramsArray select 0);
CLY_terraingrid=(paramsArray select 1);

//Miscellaneous variable inits
CLY_cutscene=false;
CLY_playerrating=0;
if (isNil "CLY_alldead") then {CLY_alldead=false};
if (isNil "CLY_dogonly") then {CLY_dogonly=false};

//Leave group
_group=createGroup civilian;
[player] join _group;



//---Accuracy boost---
//Activate accuracy boost
//Designed and recommended only for sidearms with a high spread.
CLY_accuracy=true;

//Define the weapons that receive an accuracy boost
//If you want all guns to have enhanced accuracy, make the array empty.
CLY_accuracyarray=["Colt1911","M9","M9SD","Makarov","MakarovSD","Sa61_EP1"];

//Load the script
CLY_accuracyscript=compile preProcessFile "cly_accuracy.sqf";

//Event handler
player addEventHandler ["Fired",{_this call CLY_accuracyscript}];

//Update weapon direction
if (CLY_accuracy) then {
	[] spawn {
		_lasttime=0;
		while {true} do {
			sleep 0.02;
			CLY_weapondir=[player weaponDirection currentWeapon player,time,_lasttime];
			_lasttime=time;
		};
	};
};
//////////////////////



//Zombie face and texture update for clients
[] exec "zombie_scripts\cly_z_textures.sqs";

//CLY Remove Dead
[120,0] exec "cly_removedead.sqs";
player setVariable ["CLY_removedead",false,true];

//CLY Jukebox
[1,["nowhere",0,220,1]] execVM "cly_jukebox.sqf";

//Disable saving
enableSaving [false,false];

//Weather
setViewDistance 600;
setWind [-2,2,true];



//Claw script
CLY_z_claw={
	_victim=_this select 0;
	_claw=_this select 1;
	if (player==_victim) then {
		titleRsc [format ["claw%1",_claw],"PLAIN"]
	} else {
		if (!isNil {player getVariable "spectating"}) then {
			if (player getVariable "spectating"==_victim) then {
				titleRsc [format ["claw%1",_claw],"PLAIN"];
			};
		};
	};
	true;
};

//Random zombie classname
CLY_randomzombie={
	_selected=false;
	_zombie=CLY_zombieclasses select floor random count CLY_zombieclasses;
	while {typeName _zombie=="ARRAY"} do {
		_zombie=_zombie select floor random count _zombie;
	};
	_zombie;
};

//Random armored zombie classname
CLY_randomarmoredzombie={
	_zombie=CLY_armoredzombieclasses select floor random count CLY_armoredzombieclasses;
	while {typeName _zombie=="ARRAY"} do {
		_zombie=_zombie select floor random count _zombie;
	};
	_zombie;
};

//Claw mark HUD
[] execVM "cly_hud.sqf";

//Public variable event handlers
"CLY_z_noisepv" addPublicVariableEventHandler {
	_var=_this select 1;
	_zombie=_var select 0;
	_zombie say3D (_var select 1);
};
"CLY_z_attackpv" addPublicVariableEventHandler {
	_var=_this select 1;
	_zombie=_var select 0;
	_sound=_var select 1;
	_anim=if (count _var>2) then {_var select 2} else {""};
	_object="HeliHEmpty" createVehicleLocal [0,0,0];
	_object attachTo [_zombie,[0,0,1.5]];
	_object say3D _sound;
	if (_anim!="") then {_zombie switchMove _anim};
	[_object] spawn {sleep 5;deleteVehicle (_this select 0)};
};
"CLY_z_victimpv" addPublicVariableEventHandler {
	_var=_this select 1;
	_victim=_var select 0;
	_sound=_var select 1;
	_claw=_var select 2;
	_object="HeliHEmpty" createVehicleLocal [0,0,0];
	_object attachTo [_victim,[0,0,1.5]];
	_object say3D _sound;
	[_object] spawn {sleep 5;deleteVehicle (_this select 0)};
	if (_claw>0) then {[_victim,_claw] call CLY_z_claw};
};
"CLY_z_radiopv" addPublicVariableEventHandler {
	_var=_this select 1;
	_talker=_var select 0;
	_radio=_var select 1;
	_say=if (count _var>2) then {_var select 2} else {""};
	if (isPlayer _talker) then {
		if (_say!="") then {_talker say _say};
		_talker commandRadio _radio;
	} else {
		if (_say!="") then {_talker say _say};
		_talker globalRadio _radio;
	};
};



sleep 3;

//CLY Heal
_bandages=(paramsArray select 5);

//Load player state
if !(typeOf player in CLY_deadcharacters) then {
	_array=[];
	_index=0;
	{
		if (typeOf player in _x) then {_array=_x;_index=_forEachIndex};
	} forEach CLY_playerstates;
	if (count _array>0) then {
		_damage=_array select 2;
		_bandages=_array select 3;
		_magazines=_array select 4;
		_weapons=_array select 5;
		_items=_array select 6;
		
		//2/3 of the original magazines
		_newmagazines=[];
		{
			if !(_x in _newmagazines) then {
				_mag=_x;
				for "_x" from 1 to round (({_x==_mag} count _magazines)*0.66) do {
					_newmagazines set [count _newmagazines,_mag];
				};
			};
		} forEach _magazines;
		
		removeAllWeapons player;
		removeAllItems player;
		player setDamage _damage;
		{player addMagazine _x} forEach _newmagazines;
		{player addWeapon _x} forEach _weapons;
		if (count _weapons>0) then {
			_gun=_weapons select 0;
			_muzzles=getArray (configFile/"CfgWeapons"/_gun/"muzzles");
			_muzzle=if !("this" in _muzzles) then {_muzzles select 0} else {_gun};
			player selectWeapon _muzzle;
			if (vehicle player==player) then {
				_anim="";
				_guntype=getNumber (configFile/"CfgWeapons"/_gun/"type");
				if (_guntype in [1,5]) then {_anim="amovpercmstpsraswrfldnon"};
				if (_guntype==2) then {_anim="amovpercmstpsraswpstdnon"};
				if (_guntype==4) then {_anim="amovpercmstpsraswlnrdnon"};
				if (_anim!="") then {player switchMove _anim};
			};
		};
		{player addWeapon _x} forEach _items;
		CLY_playerstates set [_index,[player,typeOf player,_damage,_bandages,_newmagazines,_weapons,_items]];
		publicVariable "CLY_playerstates";
	};
};

//CLY Heal continued
if !(typeOf player in ["Fin","Pastor","Citizen1"]) then {[player,0.1,0,_bandages,false] execVM "cly_heal.sqf"};



//Option to set terrain detail at start
if (CLY_terraingrid==0) then {
	CLY_terrainaction0=player addAction ["Confirm terrain detail","terraingrid.sqs",0,2.5,true,true,"",""];
	CLY_terrainaction1=player addAction ["Terrain detail: very low","terraingrid.sqs",50,2.5,true,true,"",""];
	CLY_terrainaction2=player addAction ["Terrain detail: low","terraingrid.sqs",25,2.5,true,true,"",""];
	CLY_terrainaction3=player addAction ["Terrain detail: medium","terraingrid.sqs",12.5,2.5,true,true,"",""];
	CLY_terrainaction4=player addAction ["Terrain detail: high","terraingrid.sqs",6.25,2.5,true,true,"",""];
	CLY_terrainaction5=player addAction ["Terrain detail: very high","terraingrid.sqs",3.125,2.5,true,true,"",""];
} else {
	if (CLY_terraingrid>0) then {setTerrainGrid CLY_terraingrid};
};

//CLY Spectate cameraView script (spectator sees aiming mode when player aims)
[] spawn {
	player setVariable ["cameraview","INTERNAL",true];
	while {true} do {
		if (alive player and cameraView!=(player getVariable "cameraview")) then {player setVariable ["cameraview",cameraView,true]};
		sleep 0.1;
	};
};

//Friendly fire damage modifier
if (CLY_friendlyfire!=1) then {
	player addEventHandler ["HandleDamage",{if (isPlayer (_this select 3) and (_this select 3)!=(_this select 0)) then {damage (_this select 0)+(_this select 2)*(CLY_friendlyfire*0.1)} else {_this select 2}}];
};

//Set players captive - prevents zombies from fleeing in MP
player setCaptive true;

null=[player,100,20,10,7,15,-0.4,0.1,0.2,1,1,1,13,12,15,false,0.1,0.1,0.1,0.1,0.2,0,19,5] execFSM "Fog.fsm";
if !(isServer) exitwith {};
if (isServer) then {
null = [] execVM "ZombieTest.sqf";
"Heli1" setmarkeralpha 0;
Bouncer = 1;
};