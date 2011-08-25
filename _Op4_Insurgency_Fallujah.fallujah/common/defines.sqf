#define DEBUG		false

//Constants
#define VIEWDISTANCE		2500
#define SPAWNRANGE 			500
#define WEP_DESPAWN_RANGE	100
#define REM_PLAYER_BODY		180

//Misc Functions
// getDirTo - vector of X towards Y in degrees while Y can be either a position or an object; 
// if X is in the East of Y, vector is from 0.01° to 179.99° and if on the West it's from -0.01° to -179.99° (N is 0°, S is 180°)
#define getDirTo(X,Y)       (((if(typeName Y == "OBJECT")then{getPosATL Y}else{Y} select 0) - (getPosATL X select 0)) atan2 ((if(typeName Y == "OBJECT")then{getPosATL Y}else{Y} select 1) - (getPosATL X select 1)))  

//Params
if (isNil "paramsArray") then {
    if (isClass (missionConfigFile/"Params")) then {
        for "_i" from 0 to (count (missionConfigFile/"Params") - 1) do {
            _paramName = configName ((missionConfigFile >> "Params") select _i);
            missionNamespace setVariable [_paramName, getNumber (missionConfigFile >> "Params" >> _paramName >> "default")];
        };
    };
} else {
    for "_i" from 0 to (count paramsArray - 1) do {
        missionNamespace setVariable [configName ((missionConfigFile >> "Params") select _i), paramsArray select _i];
    };
}; 

#define startLocation       (if(isDead(MHQ))then{HQ}else{MHQ})
#define startPos            (getPosATL fieldHospital)
#define livesLeft           (startLives - westDeaths)

//AI
#define infDeleteTime		30

//String Functions
#define squadNumber(X)      call compile toString[toArray(str X) select 7]
#define squadString(X)      ("Corsair1" + str squadNumber(X))
#define squadUnitStrings(X)	[X+"1",X+"2",X+"3",X+"4",X+"5"]
#define unitNumber(X)		call compile toString[toArray(str X) select (count toArray(str X) - 1)]
#define vehicleSquad(X)     (call compile ("Corsair1" + str unitNumber(X)))
#define getName(X)          (playerNames select (westPlayerStrings find str X))
#define squadLeader(X)      (squadString(X)+"1")

// these macros do NOT return the actual name of the unit - these are only for text references
#define squadVictor(X)      ("Victor-1-" + str squadNumber(X))
#define vehicleID(X)		("Corsair-1-" + str unitNumber(X))
#define squadID(X)          ("Corsair-1-" + str squadNumber(X))
#define unitID(X)           ("Corsair-1-" + str squadNumber(X) + "-" + str unitNumber(X))

#define victorID(X)         (\
if(typeOf X == ATVTYPE)then{"ATV-1-" + str unitNumber(X)}else{\
if(typeOf X == HELITYPE)then{"Heli"}else{\
if(typeOf X == MHQTYPE)then{"MHQ"}else{\
"Victor-1-" + str unitNumber(X)}}})

#define IEDList             ["BAF_ied_v1","BAF_ied_v2","BAF_ied_v3","BAF_ied_v4"]
#define cacheType 			"GuerillaCacheBox_EP1"
#define ammoBoxType			"UNBasicWeapons_EP1"
#define westVehicles 		[humv11,humv12,humv13,humv14,humv15,humv16,atv11,atv12,atv13,atv14,heli,MHQ]
#define westVehicleStrings	["humv11","humv12","humv13","humv14","humv15","humv16","atv11","atv12","atv13","atv14","heli","MHQ"]
#define westPlayerStrings	["Corsair111","Corsair112","Corsair113","Corsair114","Corsair115",\
							"Corsair121","Corsair122","Corsair123","Corsair124","Corsair125",\
							"Corsair131","Corsair132","Corsair133","Corsair134","Corsair135",\
							"Corsair141","Corsair142","Corsair143","Corsair144","Corsair145",\
							"Corsair151","Corsair152","Corsair153","Corsair154","Corsair155",\
							"Corsair161","Corsair162","Corsair163","Corsair164","Corsair165"]
#define eastPlayerStrings   ["east1","east2","east3","east4"]
#define westAllClasses		(westSoldierClasses + westVehicleClasses)
#define eastStationaryGuns	["KORD_high_UN_EP1","DSHKM_TK_INS_EP1","ZU23_TK_INS_EP1"]
#define eastVclClasses		["LandRover_MG_TK_INS_EP1","Pickup_PK_INS",\
							"LandRover_SPG9_TK_INS_EP1","KORD_high_UN_EP1",\
							"DSHKM_TK_INS_EP1","ZU23_TK_INS_EP1"]
#define eastRanks			["CAPTAIN","LIEUTENANT","SERGEANT","CORPORAL","PRIVATE"] 
#define eastInfClasses		[\
"TK_INS_Warlord_EP1",\
"TK_INS_Soldier_TL_EP1",\
"TK_INS_Bonesetter_EP1",\
"TK_INS_Soldier_AT_EP1",\
"TK_INS_Soldier_AT_EP1",\
"TK_INS_Soldier_AT_EP1",\
"TK_INS_Soldier_MG_EP1",\
"TK_INS_Soldier_AR_EP1",\
"TK_INS_Soldier_AAT_EP1",\
"TK_INS_Soldier_EP1",\
"TK_INS_Soldier_2_EP1",\
"TK_INS_Soldier_3_EP1",\
"TK_INS_Soldier_4_EP1"\
]

#define eastAllClasses      (eastInfClasses + eastStationaryGuns + eastVclClasses)

#define legalMagazines [\
"30Rnd_556x45_Stanag"\
]
