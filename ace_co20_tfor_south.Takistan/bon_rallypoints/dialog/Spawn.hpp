// by Bon_Inf*

#include "definitions.sqf"

class bon_SpawnDialog {
	idd = BON_SPAWN_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	__EXEC( _xSpacing = 0.0075;  _ySpacing = 0.01;)
	__EXEC( _xInit = 12 * _xSpacing; _yInit = 18 * _ySpacing;)
	__EXEC( _windowWidth = 101; _windowHeight = 64;)
	__EXEC( _windowBorder = 1;)

	class controlsBackground
	{
		class Blackback : HW_RscBackground {
			idc = 0; 
			colorBackground[] = { 0, 0, 0, 1 };
			colorText[] = { 0, 0, 0, 1 };
		}; 
		class Mainback : HW_RscPicture {
			idc = BON_SPAWN_BACKGRND;
			x = 0.042; y = 0.101;
			w = 1.2549; h = 0.836601;
			text = "\ca\ui\data\igui_background_debriefing_ca.paa";
		};
		class Mapback : Blackback {
			idc = 0;
			x = 0.49; y = 0.141;
			w = 0.485; h = 0.72;
			colorBackground[] = { 1, 1, 1, 1 };
		};
		class SpawnTitle : HW_RscText {
		   	idc = 0;
			x = 0.11; y =  0.1;
			w = __EVAL(15 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_White;
			colorBackground[] = { 1, 1, 1, 0 };
			sizeEx = 0.03;
			text = "Spawn Menu";
		};
	};

	class controls
	{
		class D_Map : RscMap {
			idc = BON_SPAWN_MAP;
			colorBackground[] = { 1, 1, 1, 1 };
			x = 0.49; y = 0.141;
			w = 0.485; h = 0.72;
			default = true;
			showCountourInterval = false;
		};
		class SpawnButton: HW_RscGUIShortcutButton {
			idc = 0;
			x = 0.695;
			y = 0.9;
			text = "Spawn";
			onButtonClick = "player setPos spawnpos; CloseDialog 0;";
		};
		class BaseButton: HW_RscGUIShortcutButton {
			idc = BON_SPAWN_BASEBUTTON;
			x = 0.115; y = 0.175;
			w = 0.125;
			text = "Base";
			onButtonClick = "['BASE'] call spawnDialogUpdate";
		};
		class RallyButton: BaseButton {
			idc = BON_SPAWN_RALLYBUTTON;
			y = 0.175 + 0.06;
			text = "Rally";
			onButtonClick = "['RALLY'] call spawnDialogUpdate";
		};
		class MashButton: BaseButton {
			idc = BON_SPAWN_MASHBUTTON;
			x = 0.115 + 0.17;
			text = "MASH";
			onButtonClick = "['MASH'] call spawnDialogUpdate";
		};
		class FOBButton: BaseButton {
			idc = BON_SPAWN_FOBBUTTON;
			x = 0.115 + 0.17; y = 0.175 + 0.06;
			text = "FOB";
			onButtonClick = "['FOB'] call spawnDialogUpdate";
		};
		class SpawnPicture : HW_RscPicture {
		   	idc = BON_SPAWN_PICTURE;
			x = 0.145; y = 0.375;
			w = 0.22; h = 0.22;
			text = "";
		};
		class Info1 : HW_RscText {
			style = ST_LEFT;
		   	idc = BON_SPAWN_INFO1;
			x = 0.14; y =  0.65;
			w = 0.4; h = 0.05;
			colorText[] = Color_White;
			colorBackground[] = { 1, 1, 1, 0 };
			sizeEx = 0.025;
			text = "";
		};
		class Info2 : Info1 {
		   	idc = BON_SPAWN_INFO2;
			y =  0.71;
		};
		class Info3 : Info1 {
		   	idc = BON_SPAWN_INFO3;
			y =  0.77;
		};
	};
};