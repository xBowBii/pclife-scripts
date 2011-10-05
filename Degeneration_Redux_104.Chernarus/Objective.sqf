"Heli1" setmarkeralpha 1;
while {true} do {
sleep 10;
if ((OC1 distance P1) <30 && (OC1 distance P2) <30 && (OC1 distance P3) <30 && (OC1 distance P4) <30 && (OC1 distance P5) <30) then {OC1 setfuel 1; OC1 setdamage 0; OC1 setvehicleammo 1;OC1 allowdamage true;} else {};
sleep 10;
};
