#include "init_common_setup.sqf"

_coin = _this select 0;


_build_classes = tfor_commanders; //[];


if(typeOf player in _build_classes || count _build_classes == 0) then {

	_coin setvariable ["BIS_COIN_funds","tfor_artifunds"];
	_coin setvariable ["BIS_COIN_fundsDescription","A"];
	_coin setvariable ["BIS_COIN_categories",["Artillery"]];
	_coin setvariable ["BIS_COIN_items",[[tfor_artitype,"Artillery",1]]];
	_coin setvariable ["BIS_COIN_areasize",[150,50]];
	//_coin setvariable ["BIS_COIN_actionCondition",format["(count (units group player) + count bon_recruit_queue) <= ((Server getVariable 'tfor_artifunds') + 1) && (typeof player in %1 || count %1 == 0)",_build_classes]];
	_coin setvariable ["BIS_COIN_actionCondition",format["typeof player in %1 || count %1 == 0",_build_classes]];
	_coin setvariable ["BIS_COIN_onconstruct",{(_this select 1) execVM (BON_CONSTRUCTION_PATH+"buildhandle.sqf")}];
	_coin setvariable ["BIS_COIN_rules",[tfor_friendly_side]];

	[_coin] execVM (BON_CONSTRUCTION_PATH+"coin.sqf");
};