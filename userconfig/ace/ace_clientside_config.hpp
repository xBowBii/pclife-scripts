/*//////////////////////////////////////////////
//       ___       ______   ______     ___    //
//      /   |     / ____/  / ____/    |__ \   //
//     / /| |    / /      / __/       __/ /   //
//    / ___ |   / /___   / /___      / __/    //
//   /_/  |_|   \____/  /_____/     /____/    //
//                                            //
//                                            //
////////////////////////////////////////////////
//                                            //
//          CLIENTSIDE CONFIG FILE            //
//                                            //
//////////////////////////////////////////////*/
/*//////////////////////////////////////////////
//      Save in UTF 8 / without BOM  Π         //
///////////////////////////////////////////////*/

/*//////////////////////////////////////////////
CONFIG SETTING FOR : ACE 2 MOD - NO VOICE, NO RADIO CHATTER
--------------------
FEATURES: Disables AI radio chatter as well as player radio chatter
---------
TO ENABLE: Remove the "//" in front of the #define to enable the NO VOICE, NO RADIO CHATTER feature. To disable, think vice versa.
----------
//////////////////////////////////////////////*/

#define ACE_NOVOICE


/*//////////////////////////////////////////////
CONFIG SETTING FOR : ACE 2 MOD - CROSSHAIRS
--------------------
FEATURES: Disables/Reduces crosshairs
---------

Possible selections as documented in ACE2 Wiki
//////////////////////////////////////////////*/

#define ACE_NOCROSS


/*//////////////////////////////////////////////
CONFIG SETTING FOR : ACE 2 MOD - MINIMALISTIC HUD
--------------------
FEATURES: More Screen information, less HUD stuff
---------
TO ENABLE: Remove the "//" in front of the #define to change your desired hud feature. To disable, think vice versa.
----------
//////////////////////////////////////////////*/

//#define ACE_MINIMALHUD


/*//////////////////////////////////////////////
//CONFIG SETTING FOR : ACE 2 MOD - Changeable glasses ingame
//--------------------
//FEATURES: Lets you choose different glasses
//---------
//TO ENABLE: Please ADD your Player Profile Name
//----------
//EXAMPLE:
//--------
//class Identity
//{
//	name = "John Doe";
//};
//
//
//
//
////////--E D I T below THIS LINE--//////////*/
class Identity {
name = "Dominges";
};


/*//////////////////////////////////////////////
CONFIG SETTING FOR : ACE 2 MOD - Ruckless
--------------------
FEATURES: Ruckless disables models with built-in Rucksacks on the models.
---------
TO RE-ENABLE the original models: please uncomment the define line below
----------
//////////////////////////////////////////////*/
//#define ACE_DISABLE_RUCKLESS


/*//////////////////////////////////////////////
CONFIG SETTING FOR : ACE 2 MOD - BALL TRACERS
--------------------
FEATURES: Alternative round tracers
---------
TO ENABLE: Remove the "//" in front of the #define to change your desired hud feature. To disable, think vice versa.
----------
//////////////////////////////////////////////*/

#define ACE_BALLTRACERS


//////////////////////////////////////
// DONT EDIT BELOW HERE !!!!!! ///////

//////////////////////////////////////
//////////////////////////////////////

ACE_CLIENTSIDE_CONFIG_VER = 9; //DO NOT EDIT
