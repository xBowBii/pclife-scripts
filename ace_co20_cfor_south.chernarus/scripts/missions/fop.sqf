// by Bon_Inf*


_location = _this select 0;
if(position _location distance getMarkerPos format["respawn_%1",tfor_friendly_side] < 3000) exitWith{};

private ["_last_fop_pos"];

_last_fop_pos = Server getVariable "tfor_fop_position";
if(isNil "_last_fop_pos") then {
	_last_fop_pos = [0,0,0];
};
if(_last_fop_pos distance position _location < 3000) exitWith{};


_get_distant_pos = {

	_pos = position _this;
	_ang = random 360;
	_rad = 1500 + random 500;

	_a = (_pos select 0)+(sin(_ang)*_rad);
	_b = (_pos select 1)+(cos(_ang)*_rad);

	_pos = [_a,_b,_pos select 2];

	_pos
};


private ["_pos"];
for "_i" from 1 to 10000 do {

	_pos = _location call _get_distant_pos;

	_pos = _pos isflatempty [10, 0, 0.1, 20, 0, false, ObjNull];

	if(
		if(count _pos > 0) then{
			_pos set [2,0];
			if(count (_pos nearRoads 50) == 0 && count nearestLocations[_pos,["Name","NameVillage","NameCity","NameCityCapital"],1000] == 0) then{
				true
			} else{
				false
			}
		} else{false}
	) exitWith{};

};
if(count _pos == 0) exitWith{

};

if(not isNil "tfor_fop_objects") then {
	{
		if(count crew _x == 0) then {deleteVehicle _x};
	} foreach (tfor_fop_objects + nearestObjects[_last_fop_pos,["LandVehicle","Air"],100]);
};
["fop_0",round random 360,_pos] execVM "dyno\objectMapper.sqf";

sleep 10;
_fop_objects = ("fop_0" call (compile (preprocessFileLineNumbers "dyno\getObjects.sqf")));
tfor_fop_objects = nearestObjects[_pos,_fop_objects,150];

_boxtype = tfor_ammobox;
{deleteVehicle _x} foreach nearestObjects [_last_fop_pos,[_boxtype],100];

_boxpos = position (nearestObjects [_pos,["Land_CamoNetVar_NATO","Land_CamoNetVar_NATO_EP1"],150] select 0); _boxpos set [2,0];
_box = _boxtype createVehicle _boxpos; _box setPos _boxpos;
_box setVehicleInit "
	this addAction [""<t color='#FFFFFF'>Recruit Units</t>"",""bon_recruit_units\open_dialog.sqf""];
	this addAction [""<t color='#668AFF'>Save Loadout</t>"",""scripts\saveloadout.sqf"",[],-99,false,true,"""",""""];
	this addAction [""<t color='#FFFFFF'>Get Equipment Preset</t>"",""bon_loadoutpresets\bon_loadout_presets.sqf""];
	[this] execVM ""scripts\ammocrate_filler.sqf"";

	if(not isNull this) then {
		deleteMarker 'tfor_fop_marker';
		_marker = createMarker ['tfor_fop_marker',position this];
		_marker setMarkerType 'FOB';
		_marker setMarkerText 'FOB';
		_marker setMarkerColor 'ColorBlue';
	};
"; processInitCommands;

_vecs = nearestObjects[_pos,["LandVehicle","Air"],150];
{
	//[_x,60] execFSM "fsm\vehicle_lifecycle.fsm";
	_x addEventHandler ["Killed",{(_this select 0) spawn {sleep 120; deleteVehicle _this}}];
	_x addEventHandler ["GetOut",{
		(_this select 0) spawn {
			_time = time;
			While{count crew _this == 0 && time - _time < 3600} do{sleep 20};
			if(count crew _this == 0) then{deleteVehicle _this};
		};
	}];
} foreach _vecs;

//tfor_sidechat = format["New FOB created at grid %1.",mapGridPosition _pos]; publicVariable "tfor_sidechat";
//[tfor_friendly_side,"HQ"] sideChat tfor_sidechat;

Server setVariable ["tfor_fop_position",_pos,true];