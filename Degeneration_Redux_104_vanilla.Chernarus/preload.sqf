if (isServer) then {
startLoadingScreen ["Loading Zombies and Vehicles..."];
/*
This is to try to make it up to you for buying me Modern RageFare 2
*/

private ["_spawnnumber","_newPos","_cartype","_guntype","_car","_debug","_townpos","_carnumber","_towns"];


    if (isNil "BIS_functions_mainscope") then
{
    _side = createCenter sideLogic;
    _group = createGroup _side;
    _logic = _group createUnit ["FunctionsManager", [0,0,0], [], 0, "NONE"];
};

waitUntil {!isnil "bis_fnc_init"};
_pos = [0,0];
_towns = ["CityCenter",[_pos,50000]] call bis_fnc_locations;
_debug = 1;
_spawnnumber = 0;
_mannumber = 0;
_manspawnnumber = 0;
_caramount = 0;
cararray = []; publicVariable "cararray";
cararray2 = []; publicVariable "cararray2";
{
        _townpos = getpos _x;
        _carnumber = floor (random 7) +7 ; //Generates a car number between 5 and 10;
        _carnumber = _carnumber + 1; // adds one to carnumber to account for the < in the next command
        while {_spawnnumber < _carnumber} do
        {
                _cartype = ["tractorOld","DGN_Ikarus","DGN_SkodaBlue","DGN_SkodaGreen","DGN_SkodaRed","DGN_Skoda","DGN_VWGolf","DGN_TT650_Civ","DGN_MMT_Civ","DGN_hilux1_civil_2_covered","DGN_hilux1_civil_1_open","DGN_hilux1_civil_3_open","DGN_car_hatchback","DGN_datsun1_civil_1_open","DGN_datsun1_civil_2_covered","DGN_datsun1_civil_3_open","DGN_V3S_Civ","DGN_car_sedan","DGN_Tractor","DGN_UralCivil","DGN_UralCivil2","DGN_Lada_base","DGN_LadaLM","DGN_Lada2","DGN_Lada1","DGN_UAZ_CDF","DGN_Ural_CDF","DGN_SUV_PMC","DGN_SUV_PMC_BAF","DGN_hilux1_civil_3_open_EP1","DGN_Ikarus_TK_CIV_EP1","DGN_Lada1_TK_CIV_EP1","DGN_Lada2_TK_CIV_EP1","DGN_LandRover_TK_CIV_EP1","DGN_Old_bike_TK_CIV_EP1","DGN_Old_moto_TK_Civ_EP1","DGN_S1203_TK_CIV_EP1","DGN_SUV_TK_CIV_EP1","DGN_TT650_TK_CIV_EP1","DGN_UAZ_Unarmed_TK_CIV_EP1","DGN_Volha_1_TK_CIV_EP1","DGN_Volha_2_TK_CIV_EP1","DGN_VolhaLimo_TK_CIV_EP1","DGN_HMMWV"] call BIS_fnc_selectRandom; //picks a cartype
                _guntype = ["rifleload.sqf","sniperload.sqf","rifleload.sqf","machineload.sqf","pistolload.sqf","HEGLLoad.sqf","launcherload.sqf","GearLoad.sqf"] call BIS_fnc_selectRandom;
                _food = ["FoodLoad.sqf","FakeFood.sqf"] call BIS_fnc_selectRandom;
				_car = createVehicle [_cartype,_townpos, [], 175, "None"] ; 	// creates car
                _car setFuel (random .6);_car setDamage (random .9);
                _car setDir (random 360);
				cararray = cararray + [_car];
				_car setpos [getPos _car select 0, (getPos _car select 1) + 2, getpos _car select 2];
				_tipped = (random 100);
				if (_tipped < 10) then {_car setVectorUp [0,1,0]};//simulates chaos, rioting, zombies pushing cars over 
				_special = (random 200);
						if (_special < 2) then {
						_specialtype = ["DGN_ArmoredSUV_PMC","DGN_M1128_MGS_EP1","DGN_M2A3_EP1","DGN_LAV25"] call BIS_fnc_selectRandom;
						_specialveh = createVehicle [_specialtype,_townpos, [], 150, "None"]; 	// creates car
						cararray = cararray + [_specialVeh];
						cararray2 = cararray2 + [_specialVeh];
						_specialveh setFuel (random .6);_specialveh setDamage (random .5);
						_specialveh setDir (random 360);
					    _aa12 = (random 100);
						if (_aa12 < 50) then { 
								_specialveh addWeaponCargoGlobal ["AA12_PMC",1];
								_specialveh addMagazineCargoGlobal ["20Rnd_B_AA12_Pellets",(random 5)];
								_specialveh addMagazineCargoGlobal ["20Rnd_B_AA12_HE",(random 5)];
								_specialveh addMagazineCargoGlobal ["20Rnd_B_AA12_74Slug",(random 5)];							
						};// aa12 was dans idea
				};
	            _static = (random 100);
				if (_static < 5) then {
				_statictype = ["SearchLight","MK19_TriPod","M2StaticMG","M119"] call BIS_fnc_selectRandom;
				_staticveh = createVehicle [_statictype,_townpos, [], 150, "None"];
				_staticveh setDir (random 360);
				};
                _spawnnumber = _spawnnumber + 1;
				_caramount = _caramount + 1;
				[_car] execVM _guntype;
				[_car] execVM _food;
                if (_debug == 0) then {
                        player sideChat format ["Vehicle %1 spawned",_spawnnumber];
                        _marker= createMarker [format ["mark%1",random 100000],getpos _specialveh];
                        _marker setMarkerType "Dot";
                        _marker setMarkerColor "ColorBlue";
                        _marker setMarkerSize [1,1];
                };
        };
        _spawnnumber = 0;
} forEach _towns;

cararray = cararray; publicVariable "cararray";
cararray2 = cararray2; publicVariable "cararray2";
_mapVehicles = 50;
_spawnedMapVehicles = 0;
_newPos = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
while {_spawnedMapVehicles < _mapVehicles} do {
        _cartype = ["tractorOld","DGN_Ikarus","DGN_SkodaBlue","DGN_SkodaGreen","DGN_SkodaRed","DGN_Skoda","DGN_VWGolf","DGN_TT650_Civ","DGN_MMT_Civ","DGN_hilux1_civil_2_covered","DGN_hilux1_civil_1_open","DGN_hilux1_civil_3_open","DGN_car_hatchback","DGN_datsun1_civil_1_open","DGN_datsun1_civil_2_covered","DGN_datsun1_civil_3_open","DGN_V3S_Civ","DGN_car_sedan","DGN_Tractor","DGN_UralCivil","DGN_UralCivil2","DGN_Lada_base","DGN_LadaLM","DGN_Lada2","DGN_Lada1","DGN_UAZ_CDF","DGN_Ural_CDF","DGN_SUV_PMC","DGN_SUV_PMC_BAF","DGN_hilux1_civil_3_open_EP1","DGN_Ikarus_TK_CIV_EP1","DGN_Lada1_TK_CIV_EP1","DGN_Lada2_TK_CIV_EP1","DGN_LandRover_TK_CIV_EP1","DGN_Old_bike_TK_CIV_EP1","DGN_Old_moto_TK_Civ_EP1","DGN_S1203_TK_CIV_EP1","DGN_SUV_TK_CIV_EP1","DGN_TT650_TK_CIV_EP1","DGN_UAZ_Unarmed_TK_CIV_EP1","DGN_Volha_1_TK_CIV_EP1","DGN_Volha_2_TK_CIV_EP1","DGN_VolhaLimo_TK_CIV_EP1","DGN_HMMWV"] call BIS_fnc_selectRandom; //picks a cartype
		_guntype = ["rifleload.sqf","sniperload.sqf","rifleload.sqf","machineload.sqf","pistolload.sqf","HEGLLoad.sqf","launcherload.sqf","GearLoad.sqf"] call BIS_fnc_selectRandom;
		_food = ["FoodLoad.sqf"] call BIS_fnc_selectRandom;
		_car = createVehicle [_cartype,_newPos, [], 10000, "None"] ; 	// creates car
		_car setpos [getPos _car select 0, (getPos _car select 1) + 2, getpos _car select 2];
		_car setDir (random 360);
		_car setFuel (random .6);
		_car setDamage (random .9);
		[_car] execVM _guntype;
		[_car] execVM _food;
		_spawnedMapVehicles = _spawnedMapVehicles + 1;
};
if (_debug == 1) then {
		hint format ["%1 cars spawned",_caramount];
};
endLoadingScreen;
};
sleep 0.5;
{
_x addAction ["Tow Static Weapon", "attachVehicle.sqf", [], 1, false, true, "", "driver _target == player"];
} forEach cararray;
{
_x addAction ["Tow Vehicle", "attachVehicle2.sqf", [], 1, false, true, "", "driver _target == player"];
} forEach cararray;
Hint "Starting essential scripts...";
[] execVM "HelicopterIntro.sqf";
[] exec "Afterinit.sqs";
[] execVM "Afterinit.sqf";