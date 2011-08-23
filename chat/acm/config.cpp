class CfgPatches  {

	class ACM_Sln_Chat_1  {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.100000;
		requiredAddons[] = {"CAUI" };
	};
};
class RscButton;
class RscText;
class RscPicture;
class RscEdit;
class RscShortcutButton;
class RscListNBox;

class RscDisplayChat  {
idd = 24;
onLoad = "_as = _this execVM '\acm\acm_e_o.sqf'";
movingEnable = true;
enableSimulation = true;
	onKeyDown = "if ((_this select 1) == 28 || (_this select 1) == 156) then {_as = (ctrlText ((_this select 0) displayCtrl 101)) execVM '\acm\acm_edit.sqf'}";
	class controls  {
	class Ca_Line;
	class Ca_Background;
	};
};

class RscDisplayChannel  {
idd = 63;
onLoad = "if (isNil 'Ms_nCC') then {_as = [0] execVM '\acm\acm_n_o.sqf'}";
	class controls  {
		class Ca_Channel;
		class Background ;
		class Picture;
	};
};

#define Xps(a) 	x=SafeZoneX+SafeZoneW*a
#define Yps(a) 	y=SafeZoneY+SafeZoneH*a
#define Wps(a) 	w=SafeZoneW*a
#define Hps(a) 	h=SafeZoneH*a

class ACM_Sln_Chat_admin  {
	idd = 5064;
	movingEnable = 1;
onLoad = "_as = _this Spawn Fn_chat_select";
	
class controlsBackground  {	
	class fon : RscPicture {
	//main window
	Xps(0.05);
	Yps(0.05);
	Wps(1.1);
	Hps(0.8);
	text = "\ca\ui\data\ui_wiz_background_ca.paa";
	};
};

class Controls {
	class all_flag : RscListNBox {
	//checkbox global
		idc = 5001;
		Xps(0.055);
		Yps(0.2);
		Wps(0.255);
		Hps(0.4);
		sizeEx = 0.040000;
		columns[] = {0.0, 0.12};
		onLBSelChanged =  "_as = _this Spawn fn_chat_flag";
		};
		
	class Player_flag : all_flag {
	//checkbox personal
		idc = 5002;
		colorSelect[] = {0,0,0,0 };
		colorBackground[] = {0,0,0,0 };
		Xps(0.38);
		Wps(0.04);
		columns[] = {0.0};
		onLBSelChanged =  "_as = _this Spawn fn_chat_flagPlayer";
		};
	class players_name : all_flag {
	//selected player
		idc = 5003;
		Xps(0.47);
		Wps(0.35);
		columns[] = {0.0, 0.16};
		onLBSelChanged = "_as = _this Spawn fn_chat_selPlayer";
		colorScrollbar[] = {0.1,1,0.1,1 };
		};
	class canal_all : RscText  {
	//global list
		Xps(0.1);
		Yps(0.15);
		Wps(0.28);
		Hps(0.03);
		colorBackground[] = {0,0,0,0};
		text = "$STR_ACM_ALL_CHANNEL";
		};
	class canal_P0 : canal_all  {
	//personal
		Xps(0.37);
		Yps(0.15);
		text = "$STR_ACM_CHANNEL";
		};
	class canal_P1 : canal_all  {
	//players
		Xps(0.60);
		Yps(0.15);
		text = "$STR_ACM_PLAYERS";
		};
	class titl : canal_all  {
	//global control
		Yps(0.08);
		Xps(0.30);
		sizeEx = 0.050000;
		text = "$STR_ACM_SELECT_CHANNEL";
		};
	class bt0 : RscShortcutButton {
	//exit button
		Xps(0.67);
		Yps(0.62);
		Wps(0.18);
		Hps(0.1);
		text = "$STR_ACM_EXIT";
		action = "closeDialog 0";
		};
	class autor : canal_all  {
		Yps(0.64);
		Xps(0.07);
		sizeEx = 0.020000;
		text = "$STR_ACM_AUTHOR";
		};
		class copyright : canal_all  {
		Yps(0.66);
		Xps(0.07);
		sizeEx = 0.020000;
		text = "Copyright 2011";
		};
		
	};
};
