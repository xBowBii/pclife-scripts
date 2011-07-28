//by Bon_Inf*

if(not isServer) exitWith{};

_allHills = nearestLocations [position Server,["Hill"],30000];


{
	_pos = position _x;
	_pos set [2,0];

	if(random 3 > 2) then {
		["antiair_0",round random 360,_pos] execVM "dyno\objectMapper.sqf";
		_unit = leader ([EAST,1,_pos,5] call spawnInf);

		sleep 1;
		_static = nearestObject [_pos,"StaticWeapon"];
		_static addEventHandler ["GetOut",{(_this select 2) setDamage 1}];
		_unit moveInGunner _static;
	};
} foreach _allHills;