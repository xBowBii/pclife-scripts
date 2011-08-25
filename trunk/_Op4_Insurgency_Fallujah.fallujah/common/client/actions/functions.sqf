addActions = { 
		
//	if !isNil "actionLoadout" then { HQ removeAction actionLoadout; actionLoadout = nil; };
//	actionLoadout = HQ addAction ["Loadout","common\client\actions\noScript.sqf","[] spawn gearDialog;",1,false,true,"",""]; 
	
	if !isNil "actionHQDeploy" then { player removeAction actionHQDeploy; actionHQDeploy = nil; };
	actionHQDeploy = player addAction ["Deploy HQ","common\client\actions\noScript.sqf",'
		_pos = getPosATL MHQ;
		if (count (_pos isFlatEmpty [0,0,0.2,20,0,false,MHQ]) == 0) exitWith { player groupChat "Cannot deploy here. The terrain is unsuitable"; };
		{ moveOut _x } forEach crew MHQ;
		MHQ setPosATL spawnPos;
		sleep 0.5;
		HQ setPosATL _pos;
		HQ setDir getDir MHQ;
		HQ setVariable ["hqdT",time,true];
	',1,false,true,"",'vehicle _target == _target && _target distance MHQ < 4'];
	
	if !isNil "actionHQMobilise" then { HQ removeAction actionHQMobilise; actionHQMobilise = nil; };
	actionHQMobilise = HQ addAction ["Mobilise HQ","common\client\actions\noScript.sqf",'
		if (lifeState player == "UNCONSCIOUS") exitWith {};
		_timePassed = HQ getVariable ["hqdT",0]; 
		_dT = mhqDeployTimer - (time - _timePassed);
		if (_dT > 0 && _timePassed != 0) exitWith { player groupChat format ["You have to wait approx. %1 minutes to mobilize the MHQ.", (round((abs _dT)/60))]; }; 
		_leader = call compile squadLeader(player);
		_str = "You need a squad leader to mobilise the HQ";
		if (isNil "_leader") exitWith { player groupChat _str; };
		if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
		if (!alive _leader || isDead(_leader)) exitWith { player groupChat "Your squad leader is dead!"; };
		player sideChat format["Sent request to %1 (%2).", unitID(_leader), getName(_leader)];
		[nil,_leader,"loc",rSPAWN,player,{
			requestingPlayer = _this; 
			player sideChat format["%1, (%2) is requesting permission to mobilise the HQ. Accept?", unitID(_this), getName(_this)];
			showCommandingMenu "#USER:query_Menu_MHQ"; 
		}] call RE;	
	',1,false,true,"",''];
	
//	if !isNil "actionBagsDeploy" then { player removeAction actionBagsDeploy; actionBagsDeploy = nil; };
//	actionBagsDeploy = player addAction ["Deploy sandbags","common\client\actions\noScript.sqf","
//		_cT = cursorTarget;
//		_bags = call compile format[""bags%1"", _cT];
//		_pos = _cT modelToWorld [0,-5,0];
//		_bags setDir (getDir _cT);
//		_bags setPosATL [_pos select 0,_pos select 1,0];
//	",1,false,true,"",'
//		_cT = cursorTarget; 		
//		if !isNull _cT then { 
//			if (!(typeOf _cT in (westVehicleClasses-[ATVTYPE]-[HELITYPE])) || !alive _cT) exitWith {};
//			_pos = _cT modelToWorld [0,-3,0];
//			_bags = call compile format["bags%1", _cT];
//			alive _cT && player distance _pos < 3 && _bags distance spawnPos < 50
//		};
//	']; 	
//	
//	if !isNil "actionBagsLoad" then { player removeAction actionBagsLoad; actionBagsLoad = nil; };
//	actionBagsLoad = player addAction ["Load sandbags","common\client\actions\noScript.sqf","
//		cursorTarget setPosATL [0,0,0];
//	",1,false,true,"",'
//		_cT = cursorTarget; 		
//		if !isNull _cT then { 
//			if !(typeOf _cT == "Land_BagFenceRound") exitWith {};
//			_vcl = call compile format["humv1%1", unitNumber(_cT)];
//			player distance _cT < 3 && _cT distance _vcl < 10
//		};
//	']; 
		
	if !isNil "actionTyre" then { player removeAction actionTyre; actionTyre = nil; };
	actionTyre = player addAction ["Change tire","common\client\actions\noScript.sqf","[] spawn changeTyre",1,false,true,"",'
		_cT = cursorTarget;
		if !isNull _cT then { 
			if !(typeOf _cT in westVehicleClasses) exitWith {};
			alive _cT && !canMove _cT && _cT call getTyre != "";
		};
	']; 
	
	if !isNil "actionPullout" then { player removeAction actionPullout; actionPullout = nil; };
	actionPullout = player addAction ["Pull Out Injured","common\client\actions\noScript.sqf",'
	_anim = "AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInLow";
	player playMove _anim;
	waitUntil { animationState player == _anim };
	waitUntil { animationState player != _anim };
	{	if (lifestate _x == "UNCONSCIOUS") then { moveOut _x; }; } foreach crew cursorTarget;	
	',1,false,true,"",'
		_cT = cursorTarget; 
		if !isNull _cT then { 
			if !(_cT isKindOf "LandVehicle") exitWith {};
			_crew = crew _cT;
			_bool = false;
			{	if (lifestate _x == "UNCONSCIOUS") exitWith {	_bool = true;	}; } foreach _crew;			
			_bool && _target distance _cT < 4
		};
	']; 
	
	if !isNil "actionLoadInjured" then { player removeAction actionLoadInjured; actionLoadInjured = nil; };
	actionLoadInjured = player addAction ["Load Injured Into Vehicle","common\client\actions\noScript.sqf",'
	_dragged = (nearestPlayers(getPosATL player,5,false,"array") - [player]);
		{ 
			_anim = animationState _x;
			if (_anim in carriedAnims) exitWith { _dragged = _x; }; 
		} forEach _dragged;
		if (typeName _dragged == "ARRAY") then { _dragged = _dragged select 0; };		
		detach _dragged;
		player playAction "released";
		[nil,_dragged,"loc",rSWITCHACTION,"released"] call RE;
		sleep 0.8;
		[nil,_dragged,"loc",rSPAWN,cursorTarget,{player moveInCargo _this;}] call RE;
	',1,false,true,"",'
		_cT = cursorTarget; 
		if !isNull _cT then { 
			if !(_cT in westVehicles) exitWith {};
			_cT distance player < 4 && _cT emptyPositions "Cargo" > 0 && animationState player == carrierAnim
		};
	'];
	
	if !isNil "actionDrag" then { player removeAction actionDrag; actionDrag = nil; };
	actionDrag = player addAction ["Drag","common\client\actions\noScript.sqf",'
		_cT = cursorTarget;
		player playActionNow "grabdrag";
		sleep 1;
		[nil,_cT,"loc",rSPAWN,player,{
		  detach player;
			player switchMove "ainjppnemstpsnonwrfldb_still";
			player attachTo [_this, [0.1, 1.01, 0]];
			sleep 0.001;
			player setDir 180;
		}] call RE;		
	',1,false,true,"",'
		_cT = cursorTarget; 
		if !isNull _cT then { _target distance _cT < 3 && lifeState _cT == "UNCONSCIOUS" && !(animationState _target in (draggerAnims+[carrierAnim])) && animationState _cT == "ainjppnemstpsnonwrfldnon" }
	'];
	
	if !isNil "actionCarry" then { player removeAction actionCarry; actionCarry = nil; };
	actionCarry = player addAction ["Carry","common\client\actions\noScript.sqf",'
		_dragged = (nearestPlayers(getPosATL player,5,false,"array") - [player]);
		{ if (animationState _x == draggedAnim) exitWith { _dragged = _x; }; } forEach _dragged;
		if (typeName _dragged == "ARRAY") then { _dragged = _dragged select 0; };		
		detach _dragged;
		[nil,_dragged,rSWITCHMOVE,"ainjpfalmstpsnonwrfldnon_carried_up"] call RE;
		player switchMove "acinpknlmstpsraswrfldnon_acinpercmrunsraswrfldnon";
		sleep 10;
		_dragged attachTo [player,[0,-0.1,-1.2], "RightShoulder"];
		[nil, _dragged, rSETDIR, 180] call RE;		
	',1,false,true,"",'animationState _target in draggerAnims'];

	if !isNil "actionDrop" then { player removeAction actionDrop; actionDrop = nil; };	
	actionDrop = player addAction ["Drop","common\client\actions\noScript.sqf",'
		_dragged = (nearestPlayers(getPosATL player,5,false,"array") - [player]);
		{ 
			_anim = animationState _x;
			if (_anim == draggedAnim || _anim in carriedAnims) exitWith { _dragged = _x; }; 
		} forEach _dragged;
		if (typeName _dragged == "ARRAY") then { _dragged = _dragged select 0; };		
		detach _dragged;
		player playAction "released";
		if (animationState _dragged in carriedAnims) exitWith { 
			[nil,_dragged,"loc",rSWITCHMOVE,"AinjPfalMstpSnonWrflDnon_carried_down"] call RE;				
		};
		[nil,_dragged,"loc",rSWITCHACTION,"released"] call RE;		
		',1,false,true,"",'animationState _target in (draggerAnims+[carrierAnim])'
	];

	if !isNil "actionRearm" then { player removeAction actionRearm; actionRearm = nil; };
	actionRearm = player addAction ["Rearm stationary weapon","common\client\actions\noScript.sqf","
	_vcl = cursorTarget;
	player groupChat ""rearming..."";
	player playMove ""ainvpknlmstpslaywrfldnon_medic"";
	curTime = time;
	waitUntil{ animationState player == ""ainvpknlmstpslaywrfldnon_medic""};  
	waitUntil{ animationState player != ""ainvpknlmstpslaywrfldnon_medic""}; 
	if (time - curTime > 7) then { _vcl setVehicleAmmo 1; };
	",1,false,true,"",'
	_cT = cursorTarget;
	if !isNull _cT then { _cT isKindOf "staticWeapon" && alive _cT }
	']; 

}; 

changeTyre = {	
    private ["_vcl","_tyre"];
    _vcl    = cursorTarget;
	_tyre	= _vcl call getTyre; 	
	player groupChat "changing tire..."; 
	player playMove "ainvpknlmstpslaywrfldnon_medic"; 
	sleep 3; 
	waitUntil { animationState player != "ainvpknlmstpslaywrfldnon_medic"}; 
	[nil, nil, rSPAWN, [_vcl, _tyre], { 
		(_this select 0) setHit [_this select 1, 0]; 	
		(_this select 0) setVelocity[0,0,1]; 	
	}] call RE; 
};

getTyre = { 
    private ["_offset","_pos"];
    _offset = 	[-1,1.7,-2];
	_pos = _this modelToWorld _offset;
	if (player distance _pos < 1.5 && canSee(player,_pos,45)) exitWith { "wheel_1_1_steering" };
	_offset = 	[-1,-1.7,-2];
	_pos = _this modelToWorld _offset; 
	if (player distance _pos < 1.5 && canSee(player,_pos,45)) exitWith { "wheel_1_2_steering" }; 
	_offset = 	[1,1.7,-2]; 
	_pos = _this modelToWorld _offset;
	if (player distance _pos < 1.5 && canSee(player,_pos,45)) exitWith { "wheel_2_1_steering" }; 
	_offset = 	[1,-1.7,-2];
	_pos = _this modelToWorld _offset;
	if (player distance _pos < 1.5 && canSee(player,_pos,45)) exitWith { "wheel_2_2_steering" };
};