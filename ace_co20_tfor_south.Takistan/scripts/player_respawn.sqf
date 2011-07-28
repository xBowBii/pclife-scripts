

tfor_lastrespawn_time = time;

TFOR_SET_RESPAWNDELAY = {

	_max_delay = 120; // the max. respawn delay (dying right after respawn)

	_time_alive = time - tfor_lastrespawn_time;

	//linearly decreasing delay
	_m = (_max_delay/3600) * -1;
	_new_respawndelay = 5 max (_time_alive * _m + _max_delay);

	setPlayerRespawnTime _new_respawndelay;
	tfor_lastrespawn_time = time + _new_respawndelay;
	
};


player addEventHandler ["Killed",{

	if(tfor_dynamic_respawn == 1) then {
		[] call TFOR_SET_RESPAWNDELAY;
	} else {setPlayerRespawnTime tfor_dynamic_respawn};

	player spawn {

		tfor_deathcount = tfor_deathcount + 1;
		publicVariable "tfor_deathcount";

		_livesleft = tfor_max_death_per_mission - tfor_deathcount;
		if(_livesleft <= 5 && _livesleft >= 0) then {
			hintSilent parseText format["<t size='1.25' font='Zeppelin33' color='#ff0000'>%1 lives remaining.</t>",floor (tfor_max_death_per_mission - tfor_deathcount)];
		};

		_unit = _this;

		private ['_magazines','_weapons','_backpack','_backpackweap','_backpackmags'];
		if(isNil "tfor_savedloadout") then {
			_weapons = weapons _unit;
			_magazines = magazines _unit;
			_backpack = typeOf unitBackpack _unit;
			_backpackmags = getMagazineCargo unitBackpack _unit;
			_backpackweap = getWeaponCargo unitBackpack _unit;
		} else {
			_weapons = tfor_savedloadout select 0;
			_magazines = tfor_savedloadout select 1;
			_backpack = tfor_savedloadout select 2;
			_backpackmags = tfor_savedloadout select 3;
			_backpackweap = tfor_savedloadout select 4;
		};

		WaitUntil{alive player};

		tfor_lastrespawn_time = time;

		removeAllWeapons player;
		removeAllItems player;
		removeBackpack player;
		{player addMagazine _x} foreach _magazines;
		{player addWeapon _x} foreach _weapons;
		if (primaryWeapon player != "") then {
       			player selectWeapon (primaryWeapon player);
	        	_muzzles = getArray(configFile>>"cfgWeapons" >> primaryWeapon player >> "muzzles"); // Fix for weapons with grenade launcher
		        player selectWeapon (_muzzles select 0);
		};
		if(_backpack != "") then {
			player addBackpack _backpack; clearWeaponCargo (unitBackpack player); clearMagazineCargo (unitBackpack player);

			for "_i" from 0 to (count (_backpackmags select 0) - 1) do {
				(unitBackpack player) addMagazineCargo [(_backpackmags select 0) select _i,(_backpackmags select 1) select _i];
			};
			for "_i" from 0 to (count (_backpackweap select 0) - 1) do {
				(unitBackpack player) addWeaponCargo [(_backpackweap select 0) select _i,(_backpackweap select 1) select _i];
			};
		};

		if(tfor_ACE && not isNil "tfor_savedloadout") then {
			_ace_ruck = tfor_savedloadout select 5;
			_ruckweapons = tfor_savedloadout select 6;
			_ruckmags = tfor_savedloadout select 7;
			_weapononback = tfor_savedloadout select 8;

			if(_weapononback != "") then{player setVariable ["ACE_weapononback",_weapononback]};
			if(_ace_ruck != "") then {
				 {[player,_x select 0,_x select 1] call ACE_fnc_PackWeapon} foreach _ruckweapons;
				 {[player,_x select 0,_x select 1] call ACE_fnc_PackMagazine} foreach _ruckmags;
			};
		};

		sleep 120;
		hidebody _unit; sleep 3;
		deleteVehicle _unit;

	};
}];