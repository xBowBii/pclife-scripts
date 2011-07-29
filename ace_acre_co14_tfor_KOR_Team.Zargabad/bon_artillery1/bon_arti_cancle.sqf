//by Bon_Inf*

_requestor = _this;

[playerSide,"HQ"] sideChat "Fire Mission canceled";
CloseDialog 0;

// clean up
Server setVariable [format["Arti_%1_requestor",playerSide],ObjNull,bon_arti_global];
_requestor setVariable ["requesting_cannons",nil,bon_arti_global];

for "_i" from 1 to HW_Arti_CannonNumber do {
	_requestor setVariable [format["Arti_%2_Cannon%1",_i,playerSide],nil,bon_arti_global];
	_requestor setVariable [format["Arti_%2_Cannon%1summary",_i,playerSide],nil,false];
};

arty_LastData = nil;
_requestor setVariable ["Arti_adj_splashpos",nil,false];


if(true) exitWith{};