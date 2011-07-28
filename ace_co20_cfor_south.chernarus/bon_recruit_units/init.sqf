//by Bon_Inf*


BON_RECRUIT_PATH = "bon_recruit_units\";

bon_recruit_queue = [];
bon_max_units_allowed = tfor_maxgroupsize;

if(isServer) then{
	"bon_recruit_newunit" addPublicVariableEventHandler {
		_newunit = _this select 1;
		[_newunit] execFSM (BON_RECRUIT_PATH+"unit_lifecycle.fsm");
	};
};
if(isDedicated) exitWith{};


// Client stuff...