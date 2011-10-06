//if (not(_this select 0)==player) exitwith {}; //this is for checking if unit is player, this makes the loop local on a client

hunger=0;

while {alive player} do {

hunger=hunger+1;

if (hunger>10) then {player setdammage (getdammage player) + hunger/100;};
sleep 1;
}; 