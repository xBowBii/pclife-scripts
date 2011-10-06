for "_x" from 1 to 10 do {
 

	//_randName = random 52;
	//_randName = ceil _randName;
	//_point = format ["patrol_%1", _randName];

	_randName = random 14;
	//_randName = 1;
	_randName = ceil _randName;
	_zoneArray = [37,5,36,9,33,46,32,6,16,4,48,50,11,27];
	_n = _zoneArray select _randName;
	_point = format ["patrol_%1", _n];

	_rand = random 6;
	_rand = ceil _rand;
	_veh = "Lada1_TK_CIV_EP1";

	switch (_rand) do
	{
		case 1:
		{
			_veh = "Lada1_TK_CIV_EP1";
		};
		case 2:
		{
			_veh = "Lada2";
		};
		case 3:
		{
			_veh = "SkodaRed";
		};
		case 4:
		{
			_veh = "car_hatchback";
		};
		case 5:
		{
			_veh = "UAZ_INS";
		};
		case 6:
		{
			_veh = "Ikarus_TK_CIV_EP1";
		};	
	};	

	_car = createVehicle [_veh, getMarkerPos _point, [], 100, "FORM"];

	clearmagazinecargo _car;
	_car addMagazineCargo ["ACE_Rope_TOW_M_5", 1];
	_car addMagazineCargo ["ACE_Morphine", 2];
	_car addMagazineCargo ["ACE_Bandage", 3];
	_car setDamage random 0.6 + 0.2;
	_car setFuel random 0.2;

	//north insurgents stuff 22 23 2 4 25 5 21
	//if (_randName in [22, 23, 2, 4, 25, 21, 50, 1, 48, 17, 31]) then {
	if (_n in [4, 50, 48]) then {
		_r = random 2;
		if (_r > 1) then {
			_car addWeaponCargo ["AKS_74_U",1];
			_car addMagazineCargo ["30Rnd_545x39_AK", 5];
		} else {
			_car addWeaponCargo ["ACE_AKM",1];
			_car addMagazineCargo ["ACE_30Rnd_762x39_S_AK47", 5];
		};
	};

	//parking to building stuff
	//_nBuilding = nearestBuilding _car;
	//_car setPos (getPos _nBuilding);

	//_marker = createMarker [format ["carmarker_%1", _x], position _car];
	//_marker setMarkerShape "ICON";
	//_marker setMarkerType "mil_objective";
	//_marker setMarkerText "I'm a car";
};
