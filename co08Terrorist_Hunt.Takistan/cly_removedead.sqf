/*
	CLY Remove Dead by Celery
	Removes dead units and vehicles from the battlefield.
	Version 2011.7.14
	
	The script has different routines for Arma 2 and Operation Arrowhead due to new commands in the latter.
	The Arma 2 version of the script:
	- is a little heavier and less flexible
	- doesn't remove vehicles or animals
	- lacks the hideBody transition due to its bugged nature in Arma 2 Free

	Execute in init script:
	[wait time for men,wait time for vehicles] execVM "cly_removedead.sqf";
	A value of 0 prevents that type from being removed.
	Prevent an individual unit from being removed:  this setVariable ["CLY_removedead",false,true]
	Remove an individual unit immediately upon death:  this setVariable ["CLY_removedead",true,true]
*/

if (!isServer) exitWith {};

_oa=isClass (configFile/"CfgPatches"/"CA_E");

_manwait=_this select 0;
_vehiclewait=if (count _this>1) then {_this select 1} else {_manwait};
CLY_removedeadpending=[];
CLY_dontremovedead=[];

//Spawnable script
_removedead={
	_unit=_this select 0;
	_wait=_this select 1;
	sleep _wait;
	if (_unit in CLY_dontremovedead) exitWith {
		CLY_removedeadpending=CLY_removedeadpending-[_unit];
	};
	waitUntil {isNull flag _unit};
	if (getPosATL _unit select 2<1.5 and _unit isKindOf "Man" and isClass (configFile/"CfgPatches"/"CA_E")) then {
		hideBody _unit;
		sleep 10;
	};
	CLY_removedeadpending=CLY_removedeadpending-[_unit];
	deleteVehicle _unit;
};

//OA loop
while {_oa} do {
	sleep 1;
	{
		if (isNil {_x getVariable "CLY_removedead"}) then {
			if !(_x in CLY_dontremovedead or _x in CLY_removedeadpending) then {
				_wait=if (_x isKindOf "Man") then {_manwait} else {_vehiclewait};
				if (_wait>0 and vehicle _x==_x) then {
					[_x,_wait] spawn _removedead;
					CLY_removedeadpending set [count CLY_removedeadpending,_x];
				};
			};
		} else {
			if (_x getVariable "CLY_removedead" and vehicle _x==_x) then {
				CLY_removedeadpending set [count CLY_removedeadpending,_x];
				[_x,0] spawn _removedead;
				_x setVariable ["CLY_removedead",nil];
			} else {
				CLY_dontremovedead set [count CLY_dontremovedead,_x];
				_x setVariable ["CLY_removedead",nil];
			};
		};
	} forEach allDead;
};

//A2 loop
_pendingunits=[];
while {!_oa} do {
	_units=allUnits;
	_deadunits=[];
	sleep 1;
	{
		if !(_x in allUnits) then {
			_deadunits set [count _deadunits,_x];
			CLY_removedeadpending set [count CLY_removedeadpending,_x];
		};
	} forEach _units;
	{
		if (isNil {_x getVariable "CLY_removedead"}) then {
			if (_manwait>0) then {
				if (vehicle _x==_x) then {
					[_x,_manwait] spawn _removedead;
				} else {
					_pendingunits set [count _pendingunits,_x];
				};
			};
		} else {
			if (_x getVariable "CLY_removedead") then {
				if (vehicle _x==_x) then {
					[_x,0] spawn _removedead;
				} else {
					_pendingunits set [count _pendingunits,_x];
				};
			};
		};
	} forEach _deadunits;
	{
		if (vehicle _x==_x) then {
			_pendingunits=_pendingunits-[_x];
			[_x,_manwait] spawn _removedead;
		};
	} forEach _pendingunits;
};