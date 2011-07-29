// by Bon_Inf*

/*
   - put in _bon_supply_classes all types of soldiers being able to deploy supply drops
   - call this script with all objects as parameters serving as terminals
   - place a logic named "server" on the map
*/


BON_SUPPLY_PATH = "bon_supplydrop\";

if(isNil "_this") exitWith{hint "BON SUPPLY: no terminals given"};
if(count _this < 1) exitWith{hint "BON SUPPLY: no terminals given"};
if(isNil "Server") exitWith{hint "BON_SUPPLY: missing game logic called 'Server'"};
if(isNull Server) exitWith{hint "BON_SUPPLY: missing game logic called 'Server'"};


_bon_supply_classes = tfor_commanders; //["US_Soldier_Officer_EP1"];
_bon_supply_supplements = [  // refilled after each hour
	["USBasicWeapons_EP1",1],
	["USBasicAmmunitionBox_EP1",2],
	["USOrdnanceBox_EP1",2],
	["USLaunchers_EP1",1],
	["HMMWV_MK19_DES_EP1",2],
	["HMMWV_DES_EP1",5],
	["HMMWV_M1151_M2_DES_EP1",2],
	["ATV_US_EP1",10],
	["MTVR_DES_EP1",1],
	["MtvrRepair_DES_EP1",2],
	["MtvrReammo_DES_EP1",1],
	["MtvrRefuel_DES_EP1",1],
	["HMMWV_Ambulance_DES_EP1",1]
];

bon_supply_plane = "C130J_US_EP1";
bon_supply_pilot = "US_Soldier_Pilot_EP1";

_bon_supply_terminals = _this;

if(isServer) then {
	"bon_supply_dosupplydrop" addPublicVariableEventHandler {(_this select 1) execVM (BON_SUPPLY_PATH+"createplane.sqf")};

	_bon_supply_supplements spawn {
		while{true} do {
			Server setVariable ["bon_supply_supplements",_this,true];
			sleep 3600;
		};
	};
};
if(isDedicated) exitWith{};
WaitUntil{not isNull player};

bon_supply_side = side player;

"bon_supply_declined" addPublicVariableEventHandler {
	_requestor = (_this select 1) select 0;
	_supplytype = (_this select 1) select 1;
	if(player == _requestor) then {
		hint parseText format["Your request for an %1 drop has been <t color='#ef2525'>declined</t>.",getText (configFile >> "cfgVehicles" >> _supplytype >> "displayname")];
	};
};
"bon_supply_accepted" addPublicVariableEventHandler {
	_requestor = (_this select 1) select 0; _supplytype = (_this select 1) select 1; _droppos = (_this select 1) select 2;
	if(player == _requestor) then {
		hint parseText format["Your request for an %1 drop at grid %2 has been <t color='#008aff'>granted</t>.",getText (configFile >> "cfgVehicles" >> _supplytype >> "displayname"),mapGridPosition _droppos];
	};
};

bon_supply_fnc_lbselchange_supply = compile (preprocessFileLineNumbers (BON_SUPPLY_PATH+"fnc_lbselchange_supply.sqf"));
bon_supply_fnc_lbselchange_request = compile (preprocessFileLineNumbers (BON_SUPPLY_PATH+"fnc_lbselchange_request.sqf"));
bon_supply_fnc_dlgUpdate = compile (preprocessFileLineNumbers (BON_SUPPLY_PATH+"fnc_dlgUpdate.sqf"));
sleep 0.1;


if(isNil "bon_supply_commanders") then {bon_supply_commanders = []} else {
	{
		if(isNull _x) then {bon_supply_commanders = bon_supply_commanders - [_x]};
	} foreach bon_supply_commanders;
};

if(typeOf player in _bon_supply_classes || count _bon_supply_classes == 0) then {
	bon_supply_commanders = (bon_supply_commanders - [player]) + [player];
	publicVariable "bon_supply_commanders";
	{
		_x addAction ["Supply Drop",BON_SUPPLY_PATH+"open_supplydialog.sqf"];
	} foreach _bon_supply_terminals;

	"bon_supply_request" addPublicVariableEventHandler {
		_requestor = (_this select 1) select 0;	_supplytype = (_this select 1) select 1;
		hint format["New Request: %1 needs %2.",name _requestor,getText (configFile >> "CfgVehicles" >> _supplytype >> "displayname")];
	};

	player addEventHandler ["Killed",{
		(_this select 0) spawn {
			WaitUntil{alive player};
			bon_supply_commanders = (bon_supply_commanders - [_this]) + [player];
			publicVariable "bon_supply_commanders";
		};
	}];
} else {
	bon_supply_action = player addAction ["Request Supply Drop",BON_SUPPLY_PATH+"open_requestdialog.sqf",[],-1,false,true,"","{side _x == bon_supply_side && not isNull _x} count bon_supply_commanders > 0"];
	player addEventHandler ["Killed",{
		player removeAction bon_supply_action;
		[] spawn {
			WaitUntil{alive player || not isMultiplayer};
			bon_supply_action = player addAction ["Request Supply Drop",BON_SUPPLY_PATH+"open_requestdialog.sqf",[],-1,false,true,"","{side _x == bon_supply_side && not isNull _x} count bon_supply_commanders > 0"];
		};
	}];
};