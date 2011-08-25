//by Strikor, op4gaming.com

_obj = _this select 0;
_pad = _this select 1;
_type = typeof _obj;
_wait = 1;

_long = ["LAV25","ACE_AH1W_AGM_D","ACE_AH1W_AGM_W","UH1Y","AAV"];

if (_type in _long) then {
_wait = 75; 
} else {
_wait = 30; 
};

if (_obj isKindOf "ParachuteBase") exitWith {};
if (!alive _obj) exitWith {};
_obj vehiclechat "StriCorp Vehicle Service 1.5";
_obj setfuel 0;
_obj setVelocity [0, 0, 0];
//_obj setposatl (getposatl _pad);
sleep 1;
if (!alive _obj) exitWith {};
sleep _wait;
_obj vehiclechat "Repairs completed.";
_obj setdamage 0;
_obj setvehiclearmor 1;
_obj setrepaircargo 1;
if (!alive _obj) exitWith {};
sleep _wait;
_obj vehiclechat "Rearming completed.";
_obj setvehicleammo 1;
_obj setammocargo 1;
if (!alive _obj) exitWith {};
sleep _wait;
_obj vehiclechat "Refueling completed.  Finished servicing vehicle.";
_obj setfuel 1;
_obj setfuelcargo 1;