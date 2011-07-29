// ACRE Key Config 
							// IMPORTANT: THIS FILE SHOULD BE IN YOUR
							//		ARMA2 MAINDIRECTORY
							//							USERCONFIG FOLDER
							//												ACRE FOLDER
							// IF NOT, ITS THE WRONG ONE - COPY IT THERE IF NOT PRESENT
 

// Make sure to store this file in your "..\ArmA2\userconfig\acre" folder.

// Accepted values: ONLY NUMBERS

// Talk key for radio... This gets translated from DIK to 
// a windows virtual key. If you have any issues with an
// incorrect mapping please make a ticket for us!
class acre_sys_core
{
	class Interact 
	{
		key = 16; 
		shift = 1;
		ctrl = 0;
		alt = 1;
	};
	
	class InteractSelf 
	{
		key = 18; 
		shift = 1;
		ctrl = 0;
		alt = 1;
	};

	class PTTRadio	// Talk over radio
	{
		key = 33;  	// CAPSLOCK (please unbind from your normal PTT key)
		shift = 0;
		ctrl = 0;
		alt = 0;
	};
	
	class PTTRadioAlternate_1	// Talk over radio 2nd radio
	{
		key = 2;
		shift = 1;
		ctrl = 0;
		alt = 1;
	};
	class PTTRadioAlternate_2	// Talk over radio 3nd radio
	{
		key = 3; 
		shift = 1;
		ctrl = 0;
		alt = 1;
	};
	class PTTRadioAlternate_3	// Talk over your 4th radio
	{
		key = 4; 
		shift = 1;
		ctrl = 0;
		alt = 1;
	};
};
	
// Quick switch keys for radios
class acre_sys_list
{
	class Forward	// Move forward through your radios
	{
		key = 30;  	// ctrl-shift-a
		shift = 1;
		ctrl = 1;
		alt = 0;
	};
	class Backward	 // Move backwards through your radios
	{
		key = 31;  	// ctrl-shift-s
		shift = 1;
		ctrl = 1;
		alt = 0;
	};
	class OpenRadio	 // Open current radio
	{
		key = 45;  	// ctrl-shift-x
		shift = 1;
		ctrl = 1;
		alt = 0;
	};
	
};

class acre_sys_radio 
{				
	// SHIFT+CTRL+LEFT/RIGHT/UP
	class RadioSpatial_Left	
	{
		key = 203;  
		shift = 1;
		ctrl = 1;
		alt = 0;
	};
	class RadioSpatial_Right	
	{
		key = 205;  
		shift = 1;
		ctrl = 1;
		alt = 0;
	};
	class RadioSpatial_Center
	{
		key = 200;  
		shift = 1;
		ctrl = 1;
		alt = 0;
	};
};



/* KEY LIST // Tastendruckzuweisung // Le key de la baguette // Russian? // Zorro key // Lista klawiszy // Billenty? lista // whatever */
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
? = 12 
? = 13 
? = 26 
? = 39 
? = 40 
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
] = 27
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

ACRE_KEYS_VER = 1; //DO NOT EDIT