// Written by Mondkalb
// hides the Hostage in a random building position in near a randomly selected marker

if (not isserver) exitwith {};

_hpos = getmarkerpos (["hostagePos1", "hostagePos1_1", "hostagePos1_2", "hostagePos1_3", "hostagePos1_4", "hostagePos1_5", "hostagePos1_6", "hostagePos1_7", "hostagePos1_8"] select (floor (random 8)));


_hideout = (nearestObjects [_hpos, ["Land_MBG_Killhouse_1"], 20]) select 0;

_TotalBPositions = 0;
	
while {(str (_hideout buildingPos _TotalBPositions)) != "[0,0,0]"} do {_TotalBPositions = _TotalBPositions + 1;};
		
Hostage setpos (_hideout buildingPos (random (floor (random _TotalBPositions))));
