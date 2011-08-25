//Gear
respawnWeapons   = weapons player;
respawnMagazines = magazines player;  
startWeapon      = primaryWeapon player; 

//Injured
bloodloss		= 0; 

//Limiting
#ifdef __BAF__
	quantityBAF_LRR_scoped = 2;
#endif
#ifndef __BAF__
	quantitym107 = 1;
#endif
quantityJavelin = 1;

//Misc
isAdmin 		= false;
playerNames		= ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]; 
serverLoadHint	= false; 
mapInUse        = false;
startTime       = time;
startGroup      = group player;
oldGroup        = group player;

ppEffectsOn 	= false;
ppUnconscious 	= ppEffectCreate [["radialblur", 170], ["colorcorrections", 1580]];
mapClickBool 	= false;


//Timers
_A10Timer  		= 0;
_ArtyTimer 		= 0;

//Respawn
camPlayer       = objNull;
enterSpawn      = false; 
respawnCamera   = objNull;
camMap          = false;
deadPos         = CENTERPOS;

//Support
A10available     = false;
artyAvailable    = false;
requestingPlayer = objNull;

//User Interface
keyblock 		= false; 
tagsOn			= true;
