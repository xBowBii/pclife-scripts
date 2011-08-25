if (isServer) then {
execVM "op4\cleanup.sqf";
nul= [i1,z1,1000,3600] execVM "op4\ied.sqf";
nul= [i2,z2,1000,3600] execVM "op4\ied.sqf";
nul= [i3,z3,1000,3600] execVM "op4\ied.sqf";
nul= [i4,z4,1000,3600] execVM "op4\ied.sqf";
nul= [i5,z5,1000,3600] execVM "op4\ied.sqf";
nul= [i6,z6,1000,3600] execVM "op4\ied.sqf";
nul= [i7,center,3000,3600] execVM "op4\ied.sqf";
nul= [i8,center,3000,3600] execVM "op4\ied.sqf";
nul= [i9,center,3000,3600] execVM "op4\ied.sqf";
nul= [i10,center,3000,3600] execVM "op4\ied.sqf";
};

#include "defines.sqf"
#include "common\initserver-common.sqf"
