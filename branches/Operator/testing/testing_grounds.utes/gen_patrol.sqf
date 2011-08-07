//23571693 - icq Flanker
//http://uk-server.gsclan.co.uk/arma2sync/ace/yas.7z - yoma ACE 496
// init BIS funcs
waitUntil {!isNil "bis_fnc_init"};
_patrol = "patrol";
_point = "point";
_rose = "rose";

_centerX = getMarkerPos _marker select 0;
_centerY = getMarkerPos _marker select 1;
_sizeX = getMarkerSize _patrol select 0;
_sizeY = getMarkerSize _patrol select 1;
_pi=3.14159;

//_myGroup = [getMarkerPos "patrol", EAST, ["GUE_Commander", "GUE_Soldier_Medic", "GUE_Soldier_MG", "GUE_Soldier_AR", "GUE_Soldier_AT", "GUE_Soldier_GL"],[],[],[0.8, 0.75, 0.6, 0.5, 0.7, 0.55],[],[],0] call BIS_fnc_spawnGroup;
//_null = [leader _myGroup, "patrol","random"] execVM "UPS.sqf";

//waypoint generator
_a = 1;
_b = 0.011;
_x = 0;
_y = 0;
_radian = 0;

_car = createVehicle ["Land_arrows_desk_L", [(getmarkerpos _point select 0)+_x, (getmarkerpos _point select 1)+_y,0], [], 100, "CAN_COLLIDE"];


for "_i" from 0 to 720 step 30 do {
  _radian = _i*(180/_pi);
  _r = _a + _b * _radian;
  _x = _r * cos _i;
//  player globalchat format["X = %1",getmarkerpos _point select 0];
//  player globalchat format["X' = %1",(getmarkerpos _point select 0)+_x];
  _y = _r * sin _i;
//  player globalchat format["Y = %1",getmarkerpos _point select 1];
//  player globalchat format["Y' = %1",(getmarkerpos _point select 1)+_y];
  _car setPos [(getmarkerpos _point select 0)+_x, (getmarkerpos _point select 1)+_y,0];
  sleep 0.1;
  _marker = createMarker [format ["carmarker_%1", _i], position _car];
  _marker setMarkerShape "ICON";
  _marker setMarkerType "DOT";
};


//rose
_k = 2;

for "_i" from 0 to 360 step 10 do {
//  _radian = _i*(180/_pi);
  _r = 500*cos(_k*_i);
  _x = _r * cos _i;
  _y = _r * sin _i;
  _car setPos [(getmarkerpos _rose select 0)+_x, (getmarkerpos _rose select 1)+_y,0];
  sleep 0.1;
  _marker = createMarker [format ["marker_%1", _i], position _car];
  _marker setMarkerShape "ICON";
  _marker setMarkerType "DOT";
};

//circle
for "_i" from 0 to 180 step 10 do {
  _r = (_sizeY*3)*cos(_i);
  _x = _r * cos _i;
  _y = _r * sin _i;
  _car setPos [(getmarkerpos _patrol select 0)+_x-_sizeX*1.5, (getmarkerpos _patrol select 1)+_y,0];
  sleep 0.1;
  _marker = createMarker [format ["circle_%1", _i], position _car];
  _marker setMarkerShape "ICON";
  _marker setMarkerType "mil_dot";
};

deletevehicle _car;