Hint "Checking...";
HaveFood=0;
while {true} do {
if ("DGN_Food_M" in (magazines player)) then
{
[] execVM "FoodCheck2.sqf";
sleep 1;
}
else
{
[] execVM "FoodCheck2.sqf";
};
sleep 2;
};
sleep 1;