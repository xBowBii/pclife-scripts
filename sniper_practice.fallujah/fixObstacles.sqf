if(isServer) then {
_pad = _this select 0;

fnc_getNearestAvailableHouse = {
  _nabb = _this;
  _houses = nearestObjects[getPosATL _nabb,["House"],300];
  _houses_enterable=[];
  _minDistance = 999;
  
  {
    _house = _x;
    _i = 0;
    while{count ((_house buildingPos _i)-[0]) > 0} do {_i = _i+1};
    _maxbuildingpos = _i - 1;
    if(_maxbuildingpos>0) then{_houses_enterable = _houses_enterable + [[_house,_maxbuildingpos]]};
  } foreach _houses;
  _minHouse = [];
  {
    _currHouse = _x select 0;
    _houseDistance = _nabb distance _currHouse;
    if (_houseDistance < _minDistance) then {_minHouse = _x; _minDistance = _houseDistance;};
  } foreach _houses_enterable;
  
//  player globalchat format ["Closest house returned: %1, position: %2", _minHouse select 0, _minHouse select 1];
  _minHouse;
};

fnc_get_rnd = {
  _array = _this;
  _pos = random ((count _array) - 1);
  _array select _pos;  
}; 

_houses = nearestObjects[getPosATL _pad,["House"],100];
_LOSbroken = false;

{
	_house = _x;
	if (((getPosATL _house select 1) < (getPosATL _pad select 1)) && ((abs((getPos _pad select 0) - (getPos _house select 0))) < 15)) exitWith {_LOSbroken = true;};
} foreach _houses;

if (_LOSbroken) then {
  _avHouse = _pad call fnc_getNearestAvailableHouse;
  _pad setPos ((_avHouse select 0) buildingPos (_avHouse select 1));
  
  _stringCheck = [format ["%1",_avHouse select 0], "istan3_pumpa"] call CBA_fnc_find; //medium grau 2-floor house
  if (_stringCheck >= 0) then {_pad setPos ((_avHouse select 0) buildingPos ([2,3,4] call fnc_get_rnd));}; //valid 2,3,4
  
  _stringCheck = [format ["%1",_avHouse select 0], "istan3_hromada"] call CBA_fnc_find; //3-floor grey house
  if (_stringCheck >= 0) then {_pad setPos ((_avHouse select 0) buildingPos ([1,4,9,10] call fnc_get_rnd));}; //valid 1,4,9,10
  
  _stringCheck = [format ["%1",_avHouse select 0], "dum_istan2"] call CBA_fnc_find; //brown-yellow 2-floor house
  if (_stringCheck >= 0) then {_pad setPos ((_avHouse select 0) buildingPos ([0,1,2,6,7,8] call fnc_get_rnd));}; //valid 0 1 2 6 7 8
};

_LOSbroken;
};