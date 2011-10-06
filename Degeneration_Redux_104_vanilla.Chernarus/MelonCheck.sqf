HaveFoodM=0;
while {true} do {
if ("DGN_Watermelon_M" in (magazines player)) then
{
[] execVM "MelonCheck2.sqf";
sleep 1;
}
else
{
[] execVM "MelonCheck2.sqf";
};
sleep 2;
};