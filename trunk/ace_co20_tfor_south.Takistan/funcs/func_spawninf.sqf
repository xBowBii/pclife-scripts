// by Bon_Inf*
// particulary stolen from EVO ;-)

private ["_side","_strength","_Grp","_unit","_allunits","_pos","_radius","_count","_inftype","_spawnpos"]; // stolen from EVO (a bit)

_side = _this select 0;
_strength = _this select 1;
_pos = _this select 2;
_radius = _this select 3;
_inftype = "DEFAULT";
if(count _this > 4) then{
	if(typeName (_this select 4) == "STRING") then {_inftype = _this select 4};
};

_x = _pos select 0;
_y = _pos select 1;


_Grp = createGroup _side;

_spawnpos = [0,0];
_count=0;
While{(surfaceIsWater _spawnpos || count (_spawnpos - [0]) == 0) && _count < 100} do {
	_spawnpos = [_x + _radius - random (_radius*2), _y + _radius - random (_radius*2)];
	_count = _count + 1;
};
if(_count == 100) exitWith{_Grp};
_spawnpos set [2,0];


switch _side do{
	case WEST : {_allunits = tfor_west_inf};
	case EAST : {
		_allunits = tfor_east_inf;
		if(_inftype == "militia") then {_allunits = tfor_east_militia};
	};
	case CIVILIAN : {_allunits = []};
};

_max = (count _allunits)-1;

for "_j" from 1 to _strength do {
	_unit = _Grp createUnit [_allunits select (round random _max),_spawnpos,[],0,"NONE"];
	if(tfor_enemyskill<=1) then{_unit setSkill tfor_enemyskill};
};


// Cleanup
_Grp spawn {
	_units = units _this;
	_hidetime = 300;

	While{({alive _x} count _units) > 0} do{sleep 5};

	sleep _hidetime;
	{
		hidebody _x;
		sleep 3;
		deleteVehicle _x;
	} foreach _units;

	sleep 10;
	deleteGroup _this;
};

_Grp