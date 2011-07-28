// by Bon_Inf*
// executed by player action;

if(not local player || if(isNil "already_serving") then{false} else{already_serving}) exitWith{hintSilent "Bomber already serving."};

_laser = lasertarget player; //[] call getMyLaserTarget;
if(isNull _laser) exitWith{hint "Could not find your laser target. Try again."};

hint "Bomber approaching.";

already_serving = true;

_laser execFSM (BON_LASER_PATH+"bomber.fsm");

firedBomb=false;