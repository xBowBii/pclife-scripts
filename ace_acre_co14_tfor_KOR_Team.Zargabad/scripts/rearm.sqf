//rearm.sqf
// by Bon_Inf*. Dirty fixes by Operator.

_point = _this select 0;
_radius = _this select 1;

_unit = ObjNull;
_minDistance = _radius +1;

{
  _unitDistance = _x distance getMarkerPos _point;
  if (_unitDistance < _minDistance) then {_unit = _x; _minDistance = _unitDistance};
} foreach nearestObjects [getMarkerPos _point, ["Car", "Tank", "Helicopter"], _radius];

//Ремонт
[_unit, _point, _radius] spawn {

    _unit = _this select 0;
    _point = _this select 1;
    _radius = _this select 2;

    _unit setVelocity [0, 0, 0];
    _dmge = getDammage _unit;
    
    _repairtime = (_dmge*60) max 1;
    _repairvalue_per_step = _dmge/_repairtime;
    

    _unit vehicleChat "Начинаем ремонт. Пилоты вертолётов должны совершить посадку.";

    while{_unit distance getMarkerPos _point <= _radius && getPos _unit select 2 < 1 && damage _unit > 0} do {    
        _unit setDamage ((damage _unit) - _repairvalue_per_step);
        sleep 1;
    };
    if(damage _unit == 0) then {_unit vehicleChat "Ремонт выполнен!"}
    else{_unit vehicleChat "Ремонт отменен."};
};

//Заправка
[_unit, _point, _radius] spawn {

    _unit = _this select 0;
    _point = _this select 1;
    _radius = _this select 2;

    _fuel_to_fill = 1 - (fuel _unit);

    _refueltime = 1 max (_fuel_to_fill*60);
    _refuelvalue_per_step = _fuel_to_fill/_refueltime;

    _unit vehicleChat "Заправка...";

    while{_unit distance getMarkerPos _point <= _radius && getPos _unit select 2 < 1 && fuel _unit < 0.99} do {
        _unit setFuel (fuel _unit) + _refuelvalue_per_step;
        sleep 1;
    };
    if(fuel _unit >= 0.99) then {_unit vehicleChat "Бак полностью заправлен!"}
    else{_unit vehicleChat "Заправка отменена."};
};

//Боезапас
[_unit, _point, _radius] spawn {

    _unit = _this select 0;
    _point = _this select 1;
    _radius = _this select 2;

    _reload_timefactor = 5; // seconds each step requires when refilling
    _unit vehicleChat "Перевооружение: сейчас боезапас будет выгружен, проверен и пополнен.";
    _loadedAmmo = 0;
    while{_unit distance getMarkerPos _point <= _radius && getPos _unit select 2 < 1 && _loadedAmmo < 1} do {
    _loadedAmmo = _loadedAmmo + 0.1;
    _unit setVehicleAmmo _loadedAmmo;
        sleep _reload_timefactor;
    };
    if(_loadedAmmo == 0) then {_unit vehicleChat "Боезапас пополнен!";};    
};

