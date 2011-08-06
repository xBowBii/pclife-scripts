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
//           KEYBINDS CONFIG FILE             //
//                                            //
//////////////////////////////////////////////*/
 
							// IMPORTANT: THIS FILE SHOULD BE IN YOUR
							//		ARMA2 MAINDIRECTORY
							//							USERCONFIG FOLDER
							//												ACE FOLDER
							// IF NOT, ITS THE WRONG ONE - COPY IT THERE IF NOT PRESENT
 

// Make sure to store this file in your "..\ArmA2\userconfig\ace" folder.

// Accepted values: ONLY NUMBERS

	// Afterburner
	class ace_sys_afterburner {
		class Afterburner {
			key = 58;	// CAPS
		};
	};
	
	// ILS
	class ace_sys_ofpec_ils {
		class ILS {
			key = 37; // K (compass)
		};
	};

	// Sight adjustment: AT weapons
	class ace_sys_sight_adjustment_at {
		class Elevation_Up {
			key = 72;  	// Up
		};
		class Elevation_Down {
			key = 80;	// Down
		};
	};
	
	// Sight adjustment: Rifle scopes
	class ace_sys_sight_adjustment_rifle {
		class Open_Adjustment_Dialog {
			key = 47;  	// Shift+V
			shift = 1;
		};
	};
	
	// Sight adjustment: Underbarrel grenade launcher
	class ace_sys_sight_adjustment_gl {
		class Toggle_Elevation_Info {
			key = 47;	// Shift + 0 (Numpad) /v
			shift = 1; //1 - shift-combination, 0 - just the plain key
		};
		class Elevation_Up {
			key = 72;  	// Up
		};
		class Elevation_Down {
			key = 80;	// Down
		};
	};
	
	// NVG brightness
	class ace_sys_nvg {
		class brightnessUP {
			key = 201; // pageup
		};
		class brightnessDOWN {
			key = 209; // PageDown
		};
	};
	
	// CQB sight mode
//	class ace_sys_attachments {
//		class cqb {
//			key = 33; 	// F
//			shift = 1; 	// SHIFT
//		};
//	};
	
	// Grenadethrow modes
//	class ace_sys_grenadethrow {
//		class Change_mode {
//			key = 35;	// Shift + H
//			shift = 1; 	// 1 - shift-combination, 0 - just the plain key
//			reset = 1 ; 	// 1 - reset back to normal throw mode automatically after each throw
//		};
//	};
	
	// Clear jammed rifle
	class ace_sys_overheating {
		class Unjam {
			key = 19;	// R
			shift = 1; 	// 1 - shift-combination, 0 - just the plain key
		};
	};
	
	// Flashlight on/off
//	class ace_sys_flashlight {
//		class Flashlight {
//			key = 38;
//		};
//	};
	
	// Rest weapon / Deploy bipod
	class ace_sys_weaponrest {
		class Rest_weapon {
			key = 46;	// space /c
			shift = 1; 	// 1 - shift-combination, 0 - just the plain key
		};
	};
	
	// Interaction
	class ace_sys_interaction {
		class Interaction_Menu {
			key = 220;	// win l
			shift = 0;	
		};
		class Self_Interaction_Menu {
			key = 221;	// app
			shift = 0;	
		};
	};
	
	// Guesstimate wind direction and speed
	class ace_sys_wind_deflection {
		class Toggle_Wind_Info {
			key = 46;  	// K /C
			shift = 0;
			alt = 1;
		};
	};
	
	// 
	class ace_sys_stamina {
		class Panic_Button {
			key = 69;	// Num - Whatever
		};
	};
	
	// Toggle TI mode
//	class ace_sys_thermal {
//		class TI_on {
//			key = 20;	// T, Switching TI mode WHITE - BLACK with SHIFT
//		};
//	};
	
	// Rangefinder / SOFLAM
	class ace_sys_rangefinder {
		class Toggle_Power {
			key = 19;  	// R, Toggle Power to Rangefinding Devices
			shift = 0;
			ctrl = 0;
			alt = 0;
		};
		class Cycle_Mils {
			key = 19;  	// R, Cycle between Mils for Azimuth (and Elevation)
			shift = 0;
			ctrl = 0;
			alt = 1;
		};
		class Preload_Battery {
			key = 19;  	// R, Load battery or replace existing battery
			shift = 1;
			ctrl = 1;
			alt = 1;
			always=1; // Perform function even if device is not selected
		};
	};
	
	// Maptools
    class ace_sys_maptools { // These binds are specific to the map. Other keys will work, but might cause actions out side of the map. 
        class Place_Ruler {
            key = 35; // H Default
        };
        class Align_Ruler {
            key = 36; // J Default
        };
        class Start_Drawing {
            key = 26; // [ Default, holding to free hand draw, clicking once to place origin.
        };
        class End_Straight_Line {
            key = 27; // ] Default, holding while draging will drag straight line around origin, clicking will draw from origin to that point.
        };
        class Delete_Line {
            key = 43; // \ Default. Do not try to bind this to backspace or delete because the map over rides their calls and it wont work.
        };
    };

	// FCS for gunships
	class ace_sys_air_fcs
	{
		class Lase	//lase
		{
			key = 15;  	// Tab
			shift = 0;
			ctrl = 0;
			alt = 0;
		};
	};
	
	// FCS for tanks
	class ace_sys_tankfcs
	{
		class Lase	//lase or turn on FCS
		{
			key = 15;  	// Tab
			shift = 0;
			ctrl = 0;
			alt = 0;
		};
		class Battlesight	 //set to battle sight range
		{
			key = 48;  	// B
			shift = 0;
			ctrl = 0;
			alt = 0;
		};
		class Dump	//dump lead
		{
			key = 37;  	// K
			shift = 0;
			ctrl = 0;
			alt = 0;
		};
	};

class ace_sys_missileguidance
	{
		class Lase_Kh29	//lase target for Kh29 missile (Su-25, Su-34)
		{
			key = 57;  	// Space
			shift = 0;
			ctrl = 0;
			alt = 0;
		};
		class Lase_Gunship	// turn gunship's designator or rangefinder on/off
		{
			key = 38;  	// L
			shift = 0;
			ctrl = 0;
			alt = 0;
		};
	};
	
	// DAGR
	class ace_sys_dagr {
		class Toggle_dagr {
			key = 199;	// Home
			shift = 0;
		};
		class Dagr_Menu {
			key = 199;
			shift = 1;
		};
	};
	
	// Roundcount
	class ace_sys_roundcount {
		class Roundcount {
			key = 40;	// Ä, '
			shift = 0;
			ctrl = 0;
			alt = 0;
		};
	};

// weapon select
	class ace_sys_weaponselect
	{
		class Safe	//Safety On
		{
			key = 41;  	// `
			shift = 1;
			ctrl = 0;
			alt = 0;
		};
		class Rifle	//Switch to rifle/pistol (whichever is in hands)
		{
			key = 2;  	// 1
			shift = 1;
			ctrl = 0;
			alt = 0;
		};
		class GL //Switch to rifle's GL
		{
			key = 3;  	// 2
			shift = 1;
			ctrl = 0;
			alt = 0;
		};
		class Throw //Switch to first available grenade type
		{
			key = 4;  	// 3
			shift = 1;
			ctrl = 0;
			alt = 0;
		};
		class Put //Switch to first available satchel/mine type
		{
			key = 5;  	// 4
			shift = 1;
			ctrl = 0;
			alt = 0;
		};
		class Firemodes //Should be the same as the toggle firemode/weapon key in game options
		{
			key = 33;  	// F
			shift = 0;
			ctrl = 0;
			alt = 0;
		};
	};

/* KEY LIST // Tastendruckzuweisung // Le key de la baguette // Russian? // Zorro key // Lista klawiszy // Billentyû lista // whatever */
/* ================================================================================================================= */
/*
		KEY LIST FOR US KEYBOARD LAYOUT BELOW THIS LIST


ESC = 1 
F1 = 59 
F2 = 60 
F3 = 61 
F4 = 62 
F5 = 63 
F6 = 64 
F7 = 65 
F8 = 66 
F9 = 67 
F10 = 68 
F11 = 87 
F12 = 88 
PRINT = 183 
SCROLL = 70 
PAUSE = 197 
^ = 41 
1 = 2 
2 = 3 
3 = 4 
4 = 5 
5 = 6 
6 = 7 
7 = 8 
8 = 9 
9 = 10 
0 = 11 
ß = 12 
´ = 13 
Ü = 26 
Ö = 39 
Ä = 40 
# = 43 
< = 86 
, = 51 
. = 52 
- = 53 
+ = NOT DEFINED
POS1 = 199 
TAB = 15 
ENTER = 28 
DELETE = 211 
BACKSPACE = 14 
INSERT = 210 
END = 207 
PAGEUP = 201 
PAGEDOWN = 209 
CAPS = 58 
A = 30 
B = 48 
C = 46 
D = 32 
E = 18 
F = 33 
G = 34 
H = 35 
I = 23 
J = 36 
K = 37 
L = 38 
M = 50 
N = 49 
O = 24 
P = 25 
Q = 16 
U = 22 
R = 19 
S = 31 
T = 20 
V = 47 
W = 17 
X = 45 
Y = 44 
Z = 21 
SHIFTL = 42 
SHIFTR = 54 
UP = 200 
DOWN = 208 
LEFT = 203 
RIGHT = 205 
NUM_0 = 82 
NUM_1 = 79 
NUM_2 = 80 
NUM_3 = 81 
NUM_4 = 75 
NUM_5 = 76 
NUM_6 = 77 
NUM_7 = 71 
NUM_8 = 72 
NUM_9 = 73 
NUM_+ = 78 
NUM = 69 
NUM_/ = 181 
NUM_* = 55 
NUM_- = 74 
NUM_, = 83 
NUM_ENTER = 156 
STRGL = 29 
STRGR = 157  
WINL = 220 
WINR = 219  
ALT = 56 
SPACE = 57 
ALTGR = 184 
APP = 221 
*/


/* KEY LIST // English (US) 104-key    provided by tcp */ 
/* ================================================================================================================= */
/*
ESC = 1 
F1 = 59 
F2 = 60 
F3 = 61 
F4 = 62 
F5 = 63 
F6 = 64 
F7 = 65 
F8 = 66 
F9 = 67 
F10 = 68 
F11 = 87 
F12 = 88 
PRINT = 183 
SCROLL = 70 
PAUSE = 197 
` = 41  
1 = 2 
2 = 3 
3 = 4 
4 = 5 
5 = 6 
6 = 7 
7 = 8 
8 = 9 
9 = 10 
0 = 11 
- = 12 
= = 13 
, = 51 
. = 52 
/ = 53
; = 39
' = 40
[ = 26
] = NOT DEFINED
\ = 43
HOME = 199 
TAB = 15 
ENTER = 28 
DELETE = 211 
BACKSPACE = 14 
INSERT = 210 
END = 207 
PAGEUP = 201 
PAGEDOWN = 209 
CAPS = 58 
A = 30 
B = 48 
C = 46 
D = 32 
E = 18 
F = 33 
G = 34 
H = 35 
I = 23 
J = 36 
K = 37 
L = 38 
M = 50 
N = 49 
O = 24 
P = 25 
Q = 16 
R = 19 
S = 31 
T = 20 
U = 22 
V = 47 
W = 17 
X = 45 
Y = 21 
Z = 44 
SHIFTL = 42 
SHIFTR = 54 
UP = 200 
DOWN = 208 
LEFT = 203 
RIGHT = 205 
NUM_0 = 82 
NUM_1 = 79 
NUM_2 = 80 
NUM_3 = 81 
NUM_4 = 75 
NUM_5 = 76 
NUM_6 = 77 
NUM_7 = 71 
NUM_8 = 72 
NUM_9 = 73 
NUM_+ = 78 
NUM = 69 
NUM_/ = 181 
NUM_* = 55 
NUM_- = 74 
NUM_. = 83
NUM_ENTER = 156 
CTRLL = 29 
CTRLR = 157 
WINL = 219 
WINR = 220 
ALTL = 56
ALTR = 184
SPACE = 57 
APP = 221
*/

ACE_KEYS_VER = 8; //DO NOT EDIT