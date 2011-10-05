if (isserver) then {
  _pads = [H,H_1,H_2,H_3,H_4,H_5,H_6,H_7,H_8,H_9,H_10,H_11,H_12,H_13,H_14,H_15,H_16,H_17,H_18,H_19];
  _dest = _pads select (floor (random count _pads));
  [Site1,_dest,150] execvm "moveobjects.sqf";
};
sleep 2;
if (isserver) then {
  _pads = [H,H_1,H_2,H_3,H_4,H_5,H_6,H_7,H_8,H_9,H_10,H_11,H_12,H_13,H_14,H_15,H_16,H_17,H_18,H_19];
  _dest = _pads select (floor (random count _pads));
  [Site2,_dest,150] execvm "moveobjects.sqf";
};
sleep 2;
if (isserver) then {
  _pads = [OC2,OC3,OC4,OC5,OC6,OC7,OC8,OC9,OC10,OC11,OC12,OC13,OC14,OC15,OC16,OC17,OC18,OC19,OC20,OC21,OC22,OC23];
  _dest = _pads select (floor (random count _pads));
  [HeliStart,_dest,30] execvm "moveobjects.sqf";
};
sleep 2;
if (isserver) then {
  _pads = [OC2,OC3,OC4,OC5,OC6,OC7,OC8,OC9,OC10,OC11,OC12,OC13,OC14,OC15,OC16,OC17,OC18,OC19,OC20,OC21,OC22,OC23];
  _dest = _pads select (floor (random count _pads));
  [HeliStart_1,_dest,30] execvm "moveobjects.sqf";
};
if (isserver) then {
  _pads = [OC2,OC3,OC4,OC5,OC6,OC7,OC8,OC9,OC10,OC11,OC12,OC13,OC14,OC15,OC16,OC17,OC18,OC19,OC20,OC21,OC22,OC23];
  _dest = _pads select (floor (random count _pads));
  [HeliStart_2,_dest,30] execvm "moveobjects.sqf";
};
sleep 2;
if (isserver) then {
  _pads = [OC2,OC3,OC4,OC5,OC6,OC7,OC8,OC9,OC10,OC11,OC12,OC13,OC14,OC15,OC16,OC17,OC18,OC19,OC20,OC21,OC22,OC23];
  _dest = _pads select (floor (random count _pads));
  [HeliStart_3,_dest,30] execvm "moveobjects.sqf";
};
if (isserver) then {
  _pads = [OC2,OC3,OC4,OC5,OC6,OC7,OC8,OC9,OC10,OC11,OC12,OC13,OC14,OC15,OC16,OC17,OC18,OC19,OC20,OC21,OC22,OC23];
  _dest = _pads select (floor (random count _pads));
  [HeliStart_4,_dest,30] execvm "moveobjects.sqf";
};
sleep 2;
if (isserver) then {
  _pads = [OC2,OC3,OC4,OC5,OC6,OC7,OC8,OC9,OC10,OC11,OC12,OC13,OC14,OC15,OC16,OC17,OC18,OC19,OC20,OC21,OC22,OC23];
  _dest = _pads select (floor (random count _pads));
  [HeliStart_5,_dest,30] execvm "moveobjects.sqf";
};
if (isserver) then {
  _pads = [FoodM_1,FoodM_2,FoodM_3,FoodM_4,FoodM_5,FoodM_6,FoodM_7,FoodM_8,FoodM_9,FoodM_10,FoodM_11,FoodM_12,FoodM_13,FoodM_14,FoodM_15,FoodM_16,FoodM_17,FoodM_18,FoodM_19,FoodM_20];
  _dest = _pads select (floor (random count _pads));
  [FoodM_Start,_dest,50] execvm "moveobjects.sqf";
};
sleep 2;
"Heli1" setmarkerpos (getpos OC1);
"Gear" setmarkerpos (getpos Site_1);
"Gear_2" setmarkerpos (getpos L1);
"Part1" setmarkerpos (getpos O2);
"FoodM_Marker" setmarkerpos (getpos A1);