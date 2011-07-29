// by Bon_Inf*

if(player distance position (tfor_currentmission select 0) < 600) exitWith{
	hint "Rallypoints can only be deployed at least 600m away from the current area of operation.";
};
if(count ((getMarkerPos "tfor_fop_marker") - [0]) != 0 && player distance getMarkerPos "tfor_fop_marker" < 500) exitWith{
	hint "You need to be at least 500m away from the next FOB to deploy a rallypoint.";
};


_id = _this select 2;
player removeAction _id;

_currentmission = tfor_currentmission select 1;

bon_rallypoint = bon_rallytype createVehicleLocal (player modelToWorld [0,2,0]);
bon_rallypoint addAction ["Remove Rallypoint",BON_SPAWN_PATH+"removerally.sqf",[],-1,false,true,"",""];
bon_rallypoint execVM (BON_SPAWN_PATH+"initrally.sqf");


deleteMarker format["bon_rallypoint_%1",getPlayerUID player];
_rallymarker = createMarkerLocal [format["bon_rallypoint_%1",getPlayerUID player],position bon_rallypoint];
_rallymarker setMarkerShapeLocal "ICON";
_rallymarker setMarkerTypeLocal "hd_flag";
_rallymarker setMarkerSizeLocal [0.75,0.75];
_rallymarker setMarkerColorLocal "ColorRed";


while{_currentmission == tfor_currentmission select 1 && not isNull bon_rallypoint} do {sleep 5};
if(not isNull bon_rallypoint) then{[bon_rallypoint] execVM (BON_SPAWN_PATH+"removerally.sqf")};