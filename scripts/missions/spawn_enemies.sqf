// by Bon_Inf*

if(not isServer) exitWith{};

EnemiesSpawned = false;
_Enemies = [];

_location = _this select 0;
_pos = position _location; _pos set [2,0];

_spawnpos = _pos;


_forcetype = "DEFAULT";
if(count _this > 1) then {
	if(typeName (_this select 1) == "STRING") then{_forcetype = _this select 1};
};


if(_forcetype == "REINFORCEMENTS") then {

	_radius = 800; // minimum distance from location enemy reinforcements spawn

	While{_radius < 1500} do {

		_random_angl = round random 360;
		_spawnpos_found = false;
		for "_i" from 1 to 3600 do {

			_angle = ((_i * 0.1) + _random_angl) % 360;
			_a = (_pos select 0) + (sin(_angle) * (_radius + random 200));
			_b = (_pos select 1) + (cos(_angle) * (_radius + random 200));
			_spawnpos = [_a,_b,0];

			if(not surfaceiswater [_a,_b] && {isPlayer (driver vehicle _x)} count nearestObjects [_spawnpos,["Man","LandVehicle","Air"],500] == 0) exitWith{_spawnpos_found=true};
		};

		if(_spawnpos_found) exitWith{};
		_radius=_radius+100; // no area found of current radius that is at least 500m away from player units. increase radius and try it again!
	};
};


// returns y = x*a + b
// x <- playersnumber
// a,b consist of given minimum, maximum (in config.sqf)
_linear_equation = {
	_min = _this select 0;
	_max = _this select 1;
	_players = 1 max (playersNumber tfor_friendly_side);

	_a = (_max-_min)/(tfor_max_players-1);
	_b = _min - _a;

	_result = round(_players * _a + _b);
	_result
};

_reinf_prob = {
	if(_forcetype == "REINFORCEMENTS") then{
		round random 1
	} else {1}
};

_reinf_movement = {

	// somewhat tricky: the ai group may spawn at a position she can't find a route to
	// destination. we try to shift her 25m around all 5 seconds if this case happens...

	private ["_grp","_pos","_wp"];
	_grp = _this select 0;
	_pos = _this select 1;

	{_x allowFleeing 0} foreach units _grp;

	_wp = [_grp,99];
	While{{_x distance _pos < 200} count units _grp == 0 && {alive _x} count units _grp > 0} do {

		if(currentWaypoint _grp != _wp select 1) then {

			_xpos = (position leader _grp) select 0;
			_ypos = (position leader _grp) select 1;
			_shift = [_xpos + 25 - random 50,_ypos + 25 - random 50,0];
			while{surfaceIsWater [_shift select 0, _shift select 1]} do {
				_shift = [_xpos + 25 - random 50,_ypos + 25 - random 50,0];
			};
			{vehicle _x setPos _shift} foreach units _grp;

			deleteWaypoint _wp;
			_wp = _grp addWaypoint [_pos,200];
			_wp setWaypointBehaviour "AWARE";
			_wp setWaypointSpeed "NORMAL";
			_wp setWaypointFormation "LINE";
		};

		sleep 5;

	};

	if({alive _x} count units _grp > 0) then {
		[_grp,_pos,"patrol"] execFSM "fsm\bon_ai_movement.fsm";
	};
};


_tankweight = ([tfor_min_amount_armor,tfor_max_amount_armor] call _linear_equation) * tfor_amount_enemytanks * (call _reinf_prob);
_apcweight = ([tfor_min_amount_apc,tfor_max_amount_apc] call _linear_equation) * tfor_amount_enemytanks * (call _reinf_prob);
_carweight = ([tfor_min_amount_car,tfor_max_amount_car] call _linear_equation) * tfor_amount_enemytanks * (call _reinf_prob);
_aaweight = ([tfor_min_amount_aa,tfor_max_amount_aa] call _linear_equation) * tfor_amount_enemytanks * (call _reinf_prob);
_infweight = ([tfor_min_amount_inf,tfor_max_amount_inf] call _linear_equation) * tfor_amount_enemyinfantry * (call _reinf_prob);

private ["_armortypes","_apctypes","_cartypes","_aatypes"];
call compile format["
	_armortypes = tfor_%1_armor;
	_apctypes = tfor_%1_apc;
	_cartypes = tfor_%1_car;
	_aatypes = tfor_%1_aa;
",tfor_enemy_side];


/********************************* SPAWN ENEMIES **********************************************/
for "_i" from 1 to (_tankweight max (_apcweight max (_carweight max (_aaweight max _infweight)))) do {

	if(_i <= _tankweight) then{
		_j = (count _armortypes - 1) min (round random (count _armortypes));
		_tank = _armortypes select _j;
		_Grp = [_tank,tfor_enemy_side,_spawnpos,200] call spawnVehicle;
		_Enemies = _Enemies + units _Grp;

		if(_forcetype == "REINFORCEMENTS") then {[_Grp,_pos] spawn _reinf_movement}
		else {[_Grp,_pos,"standby"] execFSM "fsm\bon_ai_movement.fsm"};
	};

	if(_i <= _apcweight) then{
		_j = (count _apctypes - 1) min (round random (count _apctypes));
		_apc = _apctypes select _j;
		_Grp = [_apc,tfor_enemy_side,_spawnpos,200] call spawnVehicle;
		_Enemies = _Enemies + units _Grp;

		if(_forcetype == "REINFORCEMENTS") then {[_Grp,_pos] spawn _reinf_movement}
		else {[_Grp,_pos,"standby"] execFSM "fsm\bon_ai_movement.fsm"};
	};

	if(_i <= _carweight) then{
		_j = (count _cartypes - 1) min (round random (count _cartypes));
		_car = _cartypes select _j;
		_Grp = [_car,tfor_enemy_side,_spawnpos,200] call spawnVehicle;
		_Enemies = _Enemies + units _Grp;

		if(_forcetype == "REINFORCEMENTS") then {[_Grp,_pos] spawn _reinf_movement}
		else {[_Grp,_pos,"patrol"] execFSM "fsm\bon_ai_movement.fsm"};
	};

	if(_i <= _aaweight) then{
		_j = (count _aatypes - 1) min (round random (count _aatypes));
		_aa = _aatypes select _j;
		_Grp = [_aa,tfor_enemy_side,_spawnpos,200] call spawnVehicle;
		_Enemies = _Enemies + units _Grp;

		if(_forcetype == "REINFORCEMENTS") then {[_Grp,_pos] spawn _reinf_movement}
		else {[_Grp,_pos,"standby"] execFSM "fsm\bon_ai_movement.fsm"};
	};

	if(_i <= _infweight) then{
		_Grp = [tfor_enemy_side,(5 + round random (tfor_maxgroupsize-5)),_spawnpos,200] call spawnInf;
		_Enemies = _Enemies + units _Grp;

		if(_forcetype == "REINFORCEMENTS") then {[_Grp,_pos] spawn _reinf_movement}
		else {
			if(random 2 < 1.25) then {[_grp,_pos,"hide"] execFSM "fsm\bon_ai_movement.fsm"}
			else {[_Grp,_pos,"patrol"] execFSM "fsm\bon_ai_movement.fsm"};
		};
	};
};
/*********************************************************************************************/



/******************************** SPAWN STATIC MGs ********************************************
_ang = round random 360;
_bcount = 1 + (round random 2); //#MGs
_inc = 360/_bcount; 

for "_i" from 0 to _bcount do {
	_radius = 50 + (random 150);
	_a = (_pos select 0)+(sin(_ang)*_radius);
	_b = (_pos select 1)+(cos(_ang)*_radius);

	_mgpos = [_a,_b,0];
	_ang = _ang + _inc;

	if(not surfaceIsWater [_mgpos select 0, _mgpos select 1]) then{
		_mg = "DSHKM_Ins" createVehicle _mgpos;
		_Grp = [tfor_enemy_side,1,_pos,10] call spawnInf; leader _Grp moveInGunner _mg;
		_Enemies = _Enemies + units _Grp;
	};
};
*********************************************************************************************/


_Enemies spawn tfor_cleanup_after_mission;
sleep 5;


WaitUntil{isNil "ReinfSpawn"};
ReinfSpawn=false;

EnemiesSpawned=true; // message to mission scripts

if(tfor_enemy_reinforcements == 1 && not (_forcetype == "MAIN FORCE")) then {

	_total = (count _Enemies) / ([tfor_min_amount_inf,tfor_max_amount_inf] call _linear_equation);
	While {tfor_missionstate == "IN PROGRESS" && {alive _x} count _Enemies >= _total*1.5} do{sleep 2.345};
	ReinfSpawn=nil;

	if(tfor_missionstate != "IN PROGRESS") exitWith{};
	[_location,"REINFORCEMENTS"] execVM "scripts\missions\spawn_enemies.sqf";
} else{ReinfSpawn=nil};