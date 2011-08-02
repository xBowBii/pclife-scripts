/****************************************************/
/****************************************************/
/****************************************************/

_object = Server;
if(not isNull player) then {_object = player};

if(tfor_endmission_fail) then {
	tfor_currenttask setTaskState "FAILED";

	//Kamera erzeugen

	_x = getPos _object select 0;
	_y = getPos _object select 1;

	_camera = "camera" camCreate [_x,_y,25];
	_camera camSetTarget _object;
	_camera camSetPos [0,0,0];
	_camera camSetFOV 0.700;
	_camera camCommit 0;
	WaitUntil{camCommitted _camera};

	_camera cameraEffect ["internal","back"];
	showcinemaborder false;
	if(daytime < 5 && daytime > 21) then {camUseNVG true};

	// im FOLGENDEN:
	// _dx legt fest, wie weit vor oder hinter dem Object;
	// _dy legt fest, wie weit links oder rechts vom Object;
	// _dz legt die Hwhe ausgehend vom Object fest



	//**************
	//FOLLOWOBJECT
	//**************
	playMusic "EP1_Track12"; [] spawn {sleep 10; 5 fadeMusic 0};
	cutText ["Вы провалили слишком много заданий.", "BLACK OUT",15];

	_dx = 5;
	_dy = 5;
	_dz = 20;
	_x = getPos _object select 0;
	_y = getPos _object select 1;

	_camera camSetPos [_x + _dx*sin(getDir _object) - _dy*cos(getDir _object), _y + _dx*cos(getDir _object) + _dy*sin(getDir _object), (getpos _object select 2)+_dz];
	_camera camSetTarget _object;
	_camera camSetFOV 0.900;
	_camera camCommit 0;
	WaitUntil{camCommitted _camera};
	_dx = 50; _dy = 50; _dz = 35;
	_camera camSetPos [_x + _dx*sin(getDir _object) - _dy*cos(getDir _object), _y + _dx*cos(getDir _object) + _dy*sin(getDir _object), (getpos _object select 2)+_dz];
	_camera camSetTarget _object;
	_camera camSetFOV 0.900;
	_camera camCommit 15;
	WaitUntil{camCommitted _camera};

	player cameraEffect ["terminate","back"];
	camDestroy _camera;

	endMission "LOSER";

};

if(tfor_endmission_success) then {
	tfor_currenttask setTaskState "SUCCEEDED";
	[_object,120] execVM "scripts\outro.sqf";
};