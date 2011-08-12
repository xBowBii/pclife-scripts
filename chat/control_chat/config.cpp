
class CfgPatches {

	class Sln_Chat_1 {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.100000;
		requiredAddons[] = {"CAUI"};
	};
};
class RscButton;
class RscText;
class RscPicture;
class RscEdit;

class RscDisplayChat {
idd = 24;
	onLoad = "_as = [] spawn Fn_chat_Creat";
	onUnLoad = "closeDialog 0";
	onKeyDown = "if ((_this select 1) == 28 || (_this select 1) == 156) then {_as = [] spawn Fn_chat_exit}";
	class controls {
	class Line : RscText {idc = 101; x=0;y=0;h=0;w=0;};
	class Background : RscText {x=0;y=0;h=0;w=0;};
	class Ca_Line : RscText {idc = 101; x=0;y=0;h=0;w=0;};
	class Ca_Background : RscText {x=0;y=0;h=0;w=0;};
	};
};

class RscDisplayChannel  {
        idd = 63;
 
        class controls  {
        class Channel;
 
    class CA_Channel : RscText {
                        idc = 101;
						x=0;y=0;h=0;w=0;
                };
    class Background : RscText {
						x=0;y=0;h=0;w=0;
                };
    class Picture : RscPicture {
						x=0;y=0;h=0;w=0;
                };
        };
};

class Sln_ChatIn_N3 {
idd = 5063;
movingEnable = true;
enableSimulation = true;
class controls  {

class Channel : RscText {
			idc = 50100;
			x = "SafeZoneX + SafeZoneW*0.01";
			y = "SafeZoneY + SafeZoneH*0.9";
			w = "SafeZoneW*0.15";
			h = "SafeZoneH*0.03";
			colorText[] = {1,1,1,1 };
			colorBackground[] = {0.188200,0.258800,0.149000,0.760000 };
			text = "";
			};
class edit : Channel {
			idc = 50101;
			type = 2;
			style = 0;
			sizeEx = 0.034000;
			x = "SafeZoneX + SafeZoneW*0.17";
			y = "SafeZoneY + SafeZoneH*0.9";
			//Добавлено
			w = "SafeZoneW*0.3";
			h = "SafeZoneH*0.03";
			colorSelection[] = {1,1,1,0.850000};
			autocomplete = "general";
		};

class bt : RscButton {
			idc = 50200;
			style = 0;
			x = "SafeZoneX + SafeZoneW*0.01";
			y = "SafeZoneY + SafeZoneH*0.8";
			w = "SafeZoneW*0.05";
			h = "SafeZoneH*0.03";
			sizeEx = 0.03;
			color[] = {0.543000,0.574200,0.410200,1.000000 };
			color2[] = {0.950000,0.950000,0.950000,1 };
			colorBackground[] = {1,1,1,1 };
			colorbackground2[] = {1,1,1,0.400000 };
			colorDisabled[] = {1,1,1,0.250000 };
			periodFocus = 1.200000;
			periodOver = 0.800000;
			text = "Admin";
			action = "_as = [] spawn Fn_chat_admin";
		};
	};
};

class Sln_Chat_admin {
idd = 5064;
movingEnable = true;
enableSimulation = true;
class controls  {
class bt0 : RscButton {
			idc = 50200;
			style = 0;
			x = "SafeZoneX + SafeZoneW*0.01";
			y = "SafeZoneY + SafeZoneH*0.8";
			w = "SafeZoneW*0.2";
			h = "SafeZoneH*0.025";
			text = "Общий доступ";
			action = "_as = 0 spawn Fn_chat_select";
		};
class bt1 : bt0 {
		idc = 50201;
		text = "Без раций";
		y = "SafeZoneY + SafeZoneH*0.829";
		action = "_as = 1 spawn Fn_chat_select";
		};
class bt2 : bt0 {
		idc = 50202;
		text = "Для трупов";
		y = "SafeZoneY + SafeZoneH*0.858";
		action = "_as = 2 spawn Fn_chat_select";
		};
class bt3 : bt0 {
		y = "SafeZoneY + SafeZoneH*0.887";
		text = "Exit";
		action = "closeDialog 0";
		};
	};
};

class RscTitles
{
	titles[]={}; 

class Sln_Chat_Out_N3 {
idd = 5064;
movingEnable = true;
enableSimulation = true;
duration=500;
fadein=0;
fadeOut=1;
onLoad = "_as = _this Spawn Fn_chat_Tim";
class controls
		{
class Sln_List : RscText
			{
			idc = 50102;
			style = 16;
			lineSpacing = 1;
			x = "SafeZoneX + SafeZoneW*0.01";
			y = "SafeZoneY + SafeZoneH*0.3";
			w = "SafeZoneW*0.3";
			h = "SafeZoneH*0.5";
			colorText[] = {1,1,1,1 };
			text = "CHAT";
			};
		};
	};
};

class CfgVehicles  {
	class Logic;
	class Sln_Management_Chat  : Logic {
		displayName = "CHAT";
		vehicleClass = "Modules";

		class Eventhandlers  {
			init = "(_this select 0) execVM '\control_chat\serv.sqf';";
		};
	};
};