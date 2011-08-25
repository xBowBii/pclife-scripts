if ((side player == west)) then
{
nul= [player] execVM "op4\check.sqf";
_cr01 = "USVehicleBox" createvehiclelocal (getpos server);
sleep 1;
_cr01 allowdamage false;
_cr01 setammocargo 0;
nul=[_cr01] execVM "op4\crate.sqf";
	while {true} do {
	_cr01 setpos (getpos mhqbox);
	sleep 60;
	};
};

if ((side player == east)) then
{
nul= [player] execVM "op4\east.sqf";
};