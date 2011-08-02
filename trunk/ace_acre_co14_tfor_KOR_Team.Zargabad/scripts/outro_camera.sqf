
_object = _this select 0;
_totaltime = _this select 1;

_x = getPos _object select 0;
_y = getPos _object select 1;

_camera = "camera" camCreate [_x + random 15,_y + random 15,5 + random 15];
_camera camSetTarget _object;
//_camera camSetPos [0,0,0];
_camera camSetFOV 0.700;
_camera camCommit 0;
WaitUntil{camCommitted _camera && time > 0};

_camera cameraEffect ["internal","back"];
showcinemaborder false;

CAM_STATIC = {
	_time = _this;

	_xpos = getPos _object select 0;
	_ypos = getPos _object select 1;
	_zpos = getPosATL _object select 2;

	_camera camSetPos [_xpos + _dx*sin(getDir _object) - _dy*cos(getDir _object), _ypos + _dx*cos(getDir _object) + _dy*sin(getDir _object), _zpos+_dz];
	_camera camSetTarget _object;
	_camera camSetFOV 0.900;
	_camera camCommit 0; //(_currtime/(4*2));
	WaitUntil{camCommitted _camera};

	_dx = (sizeof typeof vehicle player)/2.0;
	_camera camSetPos [_xpos + _dx*sin(getDir _object) - _dy*cos(getDir _object), _ypos + _dx*cos(getDir _object) + _dy*sin(getDir _object), _zpos+_dz];
	_camera camSetTarget _object;
	_camera camSetFOV 0.900;
	_camera camCommit _time;
	WaitUntil{camCommitted _camera};
};

_playersNumber = {isPlayer _x} count allUnits;
{
	_dx = (sizeof typeof vehicle player) * 2.00;
	_dy = 5 - random 10;
	_dz = random 5;
	if(isPlayer _x) then{
		_object = vehicle _x;
		cutText [format["%1",name _x],"PLAIN DOWN",0];
		(_totaltime/_playersNumber) call CAM_STATIC;
	};
} foreach allUnits;

_camera camSetPos [_x + 2000*sin(getDir _object) - 2000*cos(getDir _object), _y + 2000*cos(getDir _object) + 2000*sin(getDir _object), 250];
_camera camSetTarget _object;
_camera camSetFOV 0.900;
_camera camCommit 10;
WaitUntil{camCommitted _camera};

if(true) exitWith{
	player cameraEffect ["terminate","back"];
	camDestroy _camera;
};