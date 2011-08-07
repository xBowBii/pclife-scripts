/*
Simple script that builds a square fence at the per... OH MY GOD IT BUILDS A FENCE! RUN FOR YOUR LIFE! RUUUUUUUUUN!!!
at the perimeter of square marker.
Call syntax: ["markerName",["top","bottom","left","right"],"Land_arrows_desk_L",2] execVM "curtain.sqf"; where:
["top","bottom"...] - sides of square, that should be fortificated, "Land_arrows_desk_L" - fortification object name,
"2" - step between objects, should be set manually for every fence object. Have fun!
*/

_marker = _this select 0;
_sides = _this select 1;
_fenceType = _this select 2;
_step = _this select 3;

_centerX = getMarkerPos _marker select 0;
_centerY = getMarkerPos _marker select 1;
_sizeX = getMarkerSize _marker select 0;
_sizeY = getMarkerSize _marker select 1;

_freeSpaceX=_sizeX;
_freeSpaceY=_sizeY;

while {_freeSpaceX>0} do {
  if ("bottom" in _sides) then {
    _cur1 = createVehicle [_fenceType, [_centerX, _centerY, 0], [], 0, "FORM"];
    _cur1 setPos [(_centerX-0.5*_sizeX)+_freeSpaceX -_step/2, (_centerY-0.5*_sizeY),0];
    sleep 0.1;
  };
  if ("top" in _sides) then {
    _cur2 = createVehicle [_fenceType, [_centerX, _centerY, 0], [], 0, "FORM"];
    _cur2 setPos [(_centerX-0.5*_sizeX)+_freeSpaceX -_step/2, (_centerY+0.5*_sizeY),0];
    sleep 0.1;
  };
  _freeSpaceX = _freeSpaceX - _step;
};

while {_freeSpaceY>0} do {
  if ("right" in _sides) then {
    _cur1 = createVehicle [_fenceType, [_centerX, _centerY, 0], [], 0, "FORM"];
    _cur1 setPos [(_centerX-0.5*_sizeX), (_centerY-0.5*_sizeY)+_freeSpaceY -_step/2,0];
    _cur1 setDir (markerDir _marker + 90);
    sleep 0.1;
  };
  
  if ("left" in _sides) then {
    _cur2 = createVehicle [_fenceType, [_centerX, _centerY, 0], [], 0, "FORM"];
    _cur2 setPos [(_centerX+0.5*_sizeX), (_centerY-0.5*_sizeY)+_freeSpaceY -_step/2,0];
    _cur2 setDir (markerDir _marker - 90);
    sleep 0.1;
  };
  _freeSpaceY = _freeSpaceY - _step;
};