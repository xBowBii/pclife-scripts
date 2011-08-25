//Vars
westDeaths = 0; 
publicVariable "westDeaths";

#define vclCrewClass		"TK_INS_Soldier_AT_EP1"
#define staticClass			"TK_INS_Soldier_3_EP1"
#define eastVehiclesFreq	["LandRover_MG_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1","Pickup_PK_INS"]
#define eastLightVehicles	["LandRover_MG_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1","Pickup_PK_INS"]
#define stationaryGunsHigh 	["KORD_high_UN_EP1","DSHKM_TK_INS_EP1"]
#define stationaryGunsMed	["ZU23_TK_INS_EP1"]
#define stationaryGunsLow	["DSHKM_TK_INS_EP1","ZU23_TK_INS_EP1"]
#define eastVclRspnTime		600
#define eastInfCount		(count(CENTERPOS nearObjects [eastInfClasses, AORADIUS]))
#define maxStaticGuns		9

//Markers
#define intelMarkerType		"hd_unknown"

//Misc
#define isEast(X)			(typeOf X in eastInfClasses)
#define isWest(X)			(typeOf X in westSoldierClasses)
