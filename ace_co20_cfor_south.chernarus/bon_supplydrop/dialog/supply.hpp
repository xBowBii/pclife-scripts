// by Bon_Inf*

#include "definitions.sqf"

class bon_SupplyDialog {
	idd = BON_SUPPLY_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground
	{
		class Mainbackgrnd : HW_RscPicture {
			moving = true;
			idc = 0;
			x = 0.1; y = 0.101;
			w = 1.0; h = 0.5;
			text = "\ca\ui\data\ui_background_controls_ca.paa";
		};

		class supplytitle : HW_RscText {
		   	idc = 0;
			x = 0.09; y =  0.0825;
			w = 0.3; h = 0.1;
			colorText[] = { 1, 1, 1, 0.8 };
			colorBackground[] = { 1, 1, 1, 0 };
			sizeEx = 0.03;
			text = "Manage Supplies";
		};
	};

	class controls
	{
		class Supplymap : RscMap {
			idc = BON_SUPPLY_MAP;
			colorBackground[] = { 1, 1, 1, 1 };
			x = 0.425; y = 0.15;
			w = 0.45; h = 0.38;
			default = true;
			showCountourInterval = false;
		};

		class Requestortitle : HW_RscText {
		   	idc = 0;
			style = ST_LEFT;
			x = 0.135; y = 0.17;
			w = 0.125; h = 0.1;
			colorText[] = { 1, 1, 1, 0.8 };
			colorBackground[] = { 1, 1, 1, 0 };
			sizeEx = 0.03;
			text = "Requestors:";
		};
		class Requestorlist : HW_RscComboBox {
			idc = BON_SUPPLY_REQUESTORS;
			style = ST_LEFT;
			colorText[] = { 1, 1, 1, 1 };
			colorSelect[] = { 1.0, 0.35, 0.3, 1 };
			colorBackground[] = { 0, 0, 0, 0.6 };
			colorSelectBackground[] = { 0, 0, 0, 1 };
			font = "BitStream";
			sizeEx = 0.028;
			onLBSelChanged = "[] call bon_supply_fnc_lbselchange_supply";
			x = 0.14; y = 0.17 + 0.08;
			w = 0.25; h = 0.045;
		};

		class Supplementdesc : Requestortitle {
			idc = BON_SUPPLY_SUPPLEMENTTYPE;
			style = ST_LEFT;
			x = 0.135; y = 0.29;
			w = 0.3;
			text = "";
		};
		class Supplementicon : HW_RscPicture {
			idc = BON_SUPPLY_SUPPLEMENTICON;
			x = 0.175; y = 0.29 + 0.08;
			w = 0.125; h = 0.125;
			text = "";
		};


		class AcceptButton: HW_RscGUIShortcutButton {
			x = 0.42; y = 0.55;
			w = 0.15; h = 0.05;
			text = "Grant";
			onButtonClick = "[] execVM 'bon_supplydrop\drop_accept.sqf'";
		};
		class DeclineButton: AcceptButton {
			x = 0.57;
			text = "Decline";
			onButtonClick = "[] execVM 'bon_supplydrop\drop_decline.sqf'";
		};
		class CloseButton: AcceptButton {
			x = 0.72;
			text = "Close";
			onButtonClick = "CloseDialog 0;";
		};
	};
};


class bon_SupplyRequestDialog {
	idd = BON_SUPPLY_REQUESTDIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground
	{
		class Mainbackgrnd : HW_RscPicture {
			moving = true;
			idc = 0;
			x = 0.1; y = 0.101;
			w = 1.0; h = 0.5;
			text = "\ca\ui\data\ui_background_controls_ca.paa";
		};

		class supplyrequesttitle : HW_RscText {
		   	idc = 0;
			style = ST_LEFT;
			x = 0.11; y =  0.0825;
			w = 0.75; h = 0.1;
			colorText[] = { 1, 1, 1, 0.8 };
			colorBackground[] = { 1, 1, 1, 0 };
			sizeEx = 0.03;
			text = "Request Supply Drop (click on map to specify drop position)";
		};
	};

	class controls
	{
		class Supplyrequestmap : RscMap {
			idc = BON_SUPPLY_REQUESTMAP;
			colorBackground[] = { 1, 1, 1, 1 };
			x = 0.425; y = 0.15;
			w = 0.45; h = 0.38;
			default = true;
			showCountourInterval = false;
		};

		class Supplementtitle : HW_RscText {
		   	idc = 0;
			style = ST_LEFT;
			x = 0.135; y = 0.17;
			w = 0.125; h = 0.1;
			colorText[] = { 1, 1, 1, 0.8 };
			colorBackground[] = { 1, 1, 1, 0 };
			sizeEx = 0.03;
			text = "Supplements:";
		};
		class Supplementlist : HW_RscComboBox {
			idc = BON_SUPPLY_SUPPLEMENTLIST;
			style = ST_LEFT;
			colorText[] = { 1, 1, 1, 1 };
			colorSelect[] = { 1.0, 0.35, 0.3, 1 };
			colorBackground[] = { 0, 0, 0, 0.6 };
			colorSelectBackground[] = { 0, 0, 0, 1 };
			font = "BitStream";
			sizeEx = 0.028;
			onLBSelChanged = "[] call bon_supply_fnc_lbselchange_request";
			x = 0.14; y = 0.17 + 0.08;
			w = 0.25; h = 0.045;
		};

		class Supplementicon : HW_RscPicture {
			idc = BON_SUPPLY_REQUESTSUPPLEMENTICON;
			x = 0.2; y = 0.29 + 0.08;
			w = 0.125; h = 0.125;
			text = "";
		};



		class RequestButton: HW_RscGUIShortcutButton {
			x = 0.57; y = 0.55;
			w = 0.15; h = 0.05;
			text = "Request";
			onButtonClick = "[] execVM 'bon_supplydrop\request.sqf'";
		};
		class CloseButton: RequestButton {
			x = 0.72;
			text = "Close";
			onButtonClick = "CloseDialog 0;";
		};
	};
};