HaveWaterP=0;
while {true} do {
if ("DGN_GrapeDrank_M" in (magazines player)) then
{
[] execVM "GrapeCheck2.sqf";
sleep 1;
}
else
{
[] execVM "GrapeCheck2.sqf";
};
sleep 2;
};
