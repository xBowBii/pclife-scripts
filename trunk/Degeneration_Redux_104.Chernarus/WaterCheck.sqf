HaveWater=0;
while {true} do {
if ("DGN_Water_M" in (magazines player)) then
{
[] execVM "WaterCheck2.sqf";
}
else
{
[] execVM "WaterCheck2.sqf";
};
sleep 2;
};
