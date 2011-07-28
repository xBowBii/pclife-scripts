//by Bon_Inf*

// collaborates with ammocrate_filler.sqf by defining tfor_loadable_magazines


if(not local player) exitWith{};


_vec = _this select 0;
_id = _this select 2;


_boxloaded = _vec getVariable "tfor_ammoloaded";

if(if(isNil "_boxloaded") then {true} else {not _boxloaded}) then{
	hintSilent "Nothing to unload.";
} else {
	if(getPos _vec select 2 > 2 && getPos _vec select 2 < 160) exitWith {hint "either LAND or CLIMB >160m in order to unload."};

	if(getPos _vec select 2 < 2) then {
		if(abs (speed _vec) > 1) then {
			hintSilent "Too fast too deploy.";
		} else {
			_vecrightside = (_vec modelToWorld [3,-2,0]); _vecrightside set [2,0];
			tfor_unloadedbox = tfor_loadable_boxtype createVehicle _vecrightside;
			tfor_unloadedbox setPos _vecrightside;
			_vec setVariable ["tfor_ammoloaded",false,true];
		};
	} else {
		[_vec,tfor_loadable_boxtype] execVM "scripts\supplydrop.sqf";
		_vec setVariable ["tfor_ammoloaded",false,true];
	};

	WaitUntil{not isNil "tfor_unloadedbox"};

	_capacity = 0 max (getNumber (configFile >> "CfgVehicles" >> tfor_loadable_boxtype >> "transportMaxMagazines") - 100);
	tfor_unloadedbox setVehicleInit format["
		this spawn {
			WaitUntil{not isNil 'tfor_loadable_magazines'};
			clearMagazineCargo _this;
			clearWeaponCargo _this;
			{
				_this addMagazineCargo [_x,floor (%1 / count tfor_loadable_magazines)];
			} foreach tfor_loadable_magazines;
		};
	",_capacity - 100]; processInitCommands;

	if(isServer) then {
		[tfor_unloadedbox] spawn tfor_cleanup_after_mission;
	} else {
		tfor_remote_cleanup = [_unloadedbox]; publicVariable "tfor_remote_cleanup";
	};

	tfor_unloadedbox = nil;
};

if(true) exitWith{};