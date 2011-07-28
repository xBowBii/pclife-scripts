_object = _this;



/****************************************************************************/
/********************* Artillery ********************************************/
/****************************************************************************/
if(_object isKindOf "StaticCannon" || _object isKindOf "StaticMortar") exitWith{
	_object allowDamage false;
	_object addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];
	_object addEventHandler ["GetIn",{
		_unit = _this select 2;
		_unit allowDamage false;
		if(not (_unit in (units group player))) then {
			_unit action ["eject",vehicle _unit];
		};
	}];
	_object addEventHandler ["GetOut",{
		_unit = _this select 2;
		_unit allowDamage true;
	}];

	private ['_tfor_cannons_uid'];
	_tfor_cannons_uid = Server getVariable format["tfor_cannons_%1",getPlayerUID player];
	if(isNil "_tfor_cannons_uid") then {
		_tfor_cannons_uid = [_object];
	} else {
		_tfor_cannons_uid = _tfor_cannons_uid + [_object];
	};
	Server setVariable [format["tfor_cannons_%1",getPlayerUID player],_tfor_cannons_uid,true];

	_object addAction ["<t color='#949494'>decompose cannon</t>",BON_CONSTRUCTION_PATH+"decompose.sqf"];
	//tfor_maxgroupsize = tfor_artifunds + 1 + count (_tfor_cannons_uid);
};





/****************************************************************************/
/********************* Commander ********************************************/
/****************************************************************************/
if(_object isKindOf "Base_WarfareBBarracks") exitWith {
	publicVariable "tfor_current_commander_funds";
	_object allowDamage false;
	_object setVehicleInit format["
		this addAction [""<t color='#FFFFFF'>Recruit Units</t>"",""%1""+""open_dialog.sqf""];
		this addAction [""<t color='#949494'>decompose barracks</t>"",""%2""+""decompose.sqf"",[],-1,false,true,"""",""typeof player in tfor_commanders""];
	",BON_RECRUIT_PATH,BON_CONSTRUCTION_PATH]; processInitCommands;
};

if(_object isKindOf "BASE_WarfareBFieldhHospital") exitWith{
	publicVariable "tfor_current_commander_funds";
	tfor_mash = _object; publicVariable "tfor_mash";
	_object allowDamage false;
	_object setVehicleInit format["
		this addAction [""<t color='#949494'>decompose MASH</t>"",""%1""+""decompose.sqf"",[],-1,false,true,"""",""typeof player in tfor_commanders""];
	",BON_CONSTRUCTION_PATH]; processInitCommands;
};

if(_object isKindOf "Reammobox") exitWith{
	publicVariable "tfor_current_commander_funds";
	_object setVehicleInit format["
		this addAction [""<t color='#949494'>decompose Ammobox</t>"",""%1""+""decompose.sqf"",[],-1,false,true,"""",""typeof player in tfor_commanders""];
		this addAction [""<t color='#668AFF'>Save Loadout</t>"",""scripts\saveloadout.sqf"",[],-99,false,true,"""",""""];
		this addAction [""<t color='#FFFFFF'>Get Equipment Preset</t>"",""bon_loadoutpresets\bon_loadout_presets.sqf""];
		[this] execVM ""scripts\ammocrate_filler.sqf"";
	",BON_CONSTRUCTION_PATH]; processInitCommands;
};

if(_object isKindOf "Base_WarfareBVehicleServicePoint") exitWith{
	publicVariable "tfor_current_commander_funds";
	_object setVehicleInit format["
		this addAction [""<t color='#949494'>decompose Vehicle Service Point</t>"",""%1""+""decompose.sqf"",[],-1,false,true,"""",""typeof player in tfor_commanders""];
		this setFuelCargo 0; this setRepairCargo 0; this setAmmoCargo 0;
	",BON_CONSTRUCTION_PATH]; processInitCommands;
};

if(_object isKindOf "Base_WarfareBUAVterminal") exitWith{
	publicVariable "tfor_current_commander_funds";
	if(not isNil "bon_uav_logic") then {
		_terminals = bon_uav_logic getVariable "uav_terminals";
		bon_uav_logic setVariable ["uav_terminals",_terminals+[_object]];
	};
	_object setVehicleInit format["
		this addAction [""<t color='#949494'>decompose UAV terminal</t>"",""%1""+""decompose.sqf"",[],-1,false,true,"""",""typeof player in tfor_commanders""];
		this addAction [""Supply Drop"",""%2""+""open_supplydialog.sqf"",[],-1,false,true,"""",""typeof player in tfor_commanders""];
		this spawn {
			While{alive _this} do{
				_marker = createMarkerLocal [format['tfor_commander_HQ_%1',random 999999],position _this];
				_marker setMarkerTypeLocal 'Headquarters';
				sleep 60;
				deleteMarkerLocal _marker;
			};
		};
	",BON_CONSTRUCTION_PATH,BON_SUPPLY_PATH]; processInitCommands;
};

if(_object isKindOf "StaticWeapon") exitWith{
		_object setVehicleInit format["
			this addAction [""<t color='#949494'>decompose static</t>"",""%1""+""decompose.sqf"",[],-1,false,true,"""",""typeof player in tfor_commanders""];
		",BON_CONSTRUCTION_PATH]; processInitCommands;
};