// by Bon_Inf*

if(bon_arti_global) then{

	// First we register for the artillery.
	// There won't be two units setting up arty at the same time for the same side.

	_arty_requestor = Server getVariable format["Arti_%1_requestor",playerSide];
	if(not (isNull _arty_requestor) && alive _arty_requestor && isPlayer _arty_requestor && not (player == _arty_requestor)) exitWith{[playerSide,"HQ"] sideChat format["Negative. %1 has registered for a fire mission already.",name _arty_requestor]; CloseDialog 0;};
	Server setVariable [format["Arti_%1_requestor",playerSide],player,true];
	if(_arty_requestor != player) then{
		bon_arti_registration_message = [name player, playerSide];
		publicVariable "bon_arti_registration_message";
	};
};

HW_Arti_CannonNumber = {(typeOf vehicle _x == tfor_artitype)} count (units group player);
_dlg = createDialog "ArtilleryDialog";