BON_HC_PATH = "hc\";


if(isDedicated) exitWith{};
Waituntil{not isNull player};

_logic = _this select 0;
bon_hc_logic = _logic;


// this HC modification does not work with subordiantes logics.
// it grabs all groups of the players side and adds them to the high command groups,
// EXCEPT for those listed here.
bon_hc_blacklist = call {
	_nonplayablegroups = [];
	{
		if({_x in (playableUnits+switchableUnits)} count units _x == 0) then{_nonplayablegroups = _nonplayablegroups + [_x]};
	} foreach allGroups;
	_nonplayablegroups
};
//here all non-playable and all non-switchable groups are blacklisted




BON_HC_READD_GROUP = {

	_group = _this;
	_leader = bon_hc_logic getVariable "HC_Commander";

	if(not isNil "_leader") then{
		if(_leader != player) then{
			_leader HCsetgroup [_group,""];	
		};
	};

	addToHC = _group; publicVariable "addToHC";
};



_commander = _this select 1;
if(isNull _commander) then{_commander = _logic getVariable "HC_commander"};


if(player == _commander) then {
	[_logic,_commander] execVM (BON_HC_PATH+"HC.sqf");
	"addToHC" addPublicVariableEventHandler {
		_group = _this select 1;
		_group call BON_HC_READD_GROUP;
	};
	player addEventHandler ["Respawn",{bon_hc_logic setVariable ["HC_commander",player,true]}];
} else {
	//if(not isNil "bon_hc_respawneh") then {player removeEventhandler ["Respawn",bon_hc_respawneh]};
	//bon_hc_respawneh = player addEventHandler ["Respawn",{(group player) call BON_HC_READD_GROUP}];
	(group player) call BON_HC_READD_GROUP;
};