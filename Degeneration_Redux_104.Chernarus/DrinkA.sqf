disableSerialization;
_gen = _this select 0;
_caller = _this select 1;
_id = _this select 2;

if (not((_this select 1)==player)) exitwith {};
HaveWater=0;
thirst=thirst-2;
cuttext["              Your thirst went down 20 percent!","plain down",2];
player removeMagazine "DGN_Water_M";
2 cutRsc ["hud3","PLAIN"];
_ui=uiNamespace getVariable "hud3";
_hud=_ui displayCtrl 23501;
_hud ctrlSetPosition [safeZoneX+SafeZoneW-.2,safeZoneY+safeZoneH-0.034];
_Water="";
if (thirst<0) then {_Water="WaterFull.jpg";thirst=0;};
if (thirst==0) then {_Water="WaterFull.jpg";};
if (thirst==1) then {_Water="Water10.jpg";};
if (thirst==2) then {_Water="Water20.jpg";};
if (thirst==3) then {_Water="Water30.jpg";};
if (thirst==4) then {_Water="Water40.jpg";};
if (thirst==5) then {_Water="Water50.jpg";};
if (thirst==6) then {_Water="Water60.jpg";};
if (thirst==7) then {_Water="Water70.jpg";};
if (thirst==8) then {_Water="Water80.jpg";};
if (thirst==9) then {_Water="Water90.jpg";};
if (thirst==10) then {player setdammage (getdammage player) + thirst/100;_Water="Water100.jpg";};
if (thirst>10) then {thirst=10;_Water="Water100.jpg";};
_hud ctrlSetText _Water;
_hud ctrlCommit 0;
_gen removeAction _id;