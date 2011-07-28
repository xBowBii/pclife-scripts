_logic = _this select 0;
_spawnpos = [0,0,500]; //position _logic;

_uavtype = _this select 1;
_side = _this select 2;


_crewtype = (getArray (configFile >> "CfgVehicles" >> _uavtype >> "typicalCargo")) select 0;

_grp = createGroup _side;
_pilot = _grp createUnit [_crewtype,_spawnpos,[],0,"NONE"];
_gunner = _grp createUnit [_crewtype,_spawnpos,[],0,"NONE"];

_uav = createVehicle [_uavtype,_spawnpos,[],0,"FLY"];
_pilot moveInDriver _uav;
_gunner moveInGunner _uav;

_uav setVehicleAmmo 0; _uav addMagazine "Laserbatteries";
_uav flyinheight 500;
_uav setSpeedMode "LIMITED";
_uav setCaptive true;
_uav allowDamage false;
_uav disableAI "TARGET";
_uav disableAI "AUTOTARGET";

_uav spawn {
	While{alive _this} do {
		_this setFuel 1;
		sleep 300;
	};
};


[_uav,[_pilot,_gunner],_grp]