//rearm sqf. Should be called as: _null = ["servicePoint":Marker,repair radius:Number,thisTrigger] execVM "rearm.sqf";
// by Bon_Inf*. Dirty fixes by Operator.

_point = _this select 0;
_radius = _this select 1;
_activeTrigger = _this select 2;

_unit = ObjNull;
_minDistance = _radius +1;
_activeTrigger setTriggerArea [0,0,0,false];

{
  _unitDistance = _x distance getMarkerPos _point;
  if (_unitDistance < _minDistance) then {_unit = _x; _minDistance = _unitDistance};
} foreach nearestObjects [getMarkerPos _point, ["Car", "Tank", "Helicopter"], _radius];

//Ремонт (Установить слипы 5-10сек между секциями)
[_unit, _point, _radius] spawn {
    _unit = _this select 0;
    _point = _this select 1;
    _radius = _this select 2;

    _unit setVelocity [0, 0, 0];
    _dmge = getDammage _unit;
    
    _repairtime = (_dmge*240) max 1;
    _repairvalue_per_step = _dmge/_repairtime;
    

    _unit vehicleChat "**Ремонт начат. Заглушить двигатели!";

    while{_unit distance getMarkerPos _point <= _radius && getPos _unit select 2 < 0.3 && damage _unit > 0} do {    
        _unit setDamage ((damage _unit) - _repairvalue_per_step);
        sleep 1;
    };
    if(damage _unit == 0) then {_unit vehicleChat "**Ремонт выполнен!"}
    else{_unit vehicleChat "**Ремонт отменен."};
};
//Заправка (Установить слипы 5-10сек между секциями)
[_unit, _point, _radius] spawn {
    _unit = _this select 0;
    _point = _this select 1;
    _radius = _this select 2;

    _fuel_to_fill = 1 - (fuel _unit);

    _refueltime = 1 max (_fuel_to_fill*150);
    _refuelvalue_per_step = _fuel_to_fill/_refueltime;

    _unit vehicleChat "**Заправка...";

    while{_unit distance getMarkerPos _point <= _radius && getPos _unit select 2 < 1 && fuel _unit < 0.99} do {
        _unit setFuel (fuel _unit) + _refuelvalue_per_step;
        sleep 1;
    };
    if(fuel _unit >= 0.99) then {_unit vehicleChat "**Заправка окончена!"}
    else{_unit vehicleChat "**Заправка отменена."};
};
//Боезапас (Установить слипы 5-10сек между секциями), нельзя ставить значение меньше чем 0.5, иначе не реармятся парные ракеты и слоты у танков
[_unit, _point, _radius] spawn {
    _unit = _this select 0;
    _point = _this select 1;
    _radius = _this select 2;

    _reload_timefactor = 60; // seconds each step requires when refilling
    _unit vehicleChat "**Перевооружение: боезапас будет выгружен и заново пополнен.";
    _loadedAmmo = 0;
    while{_unit distance getMarkerPos _point <= _radius && getPos _unit select 2 < 1 && _loadedAmmo < 1} do {
    _loadedAmmo = _loadedAmmo + 0.5;
    _unit setVehicleAmmo _loadedAmmo;
        sleep _reload_timefactor;
    };
	//Наверное нужно \/ == 1 ?!
    if(_loadedAmmo == 0) then {_unit vehicleChat "**Боезапас пополнен!";};
	_unit vehicleChat "**Обслуживание окончено. Освободите техсервис!!!";
};
_activeTrigger setTriggerArea [8,8,0,false];



//ТУДУ - глушение двигателя во время начала обслуживания или дизмаунт всех изнутри и закрытие техники до полного ремонта! (это возможно)

//Где-то ошибка в конце, не выводится сообщение об окончании перезарядки наверное ( должно быть  if(_loadedAmmo == 1)  )

// на Танке, Страйкере, и Бредли пополняется только один набор ракет/пулеметов/гранат

//Паузы между секциями для вывода сообщений и сообщение об окончании полного ремонта

//Отлавливать первичный размер и форму триггера, по окончанию скрипта выставлять параметри триггера на изначалые (для квадратных, овальных, плюшевых)

//Сделано - увеличел количество армед юнит пер степ + время речарджа(смотри выше), уменьшил высору срабатывания, реарм в воздухе - пичаль

//Сократил размер сообщений в чате, процесс стал более понятен

//При таких параметрах работает всё ок как у вертов так и у техники, проверил...
