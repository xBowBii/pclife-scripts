_MagazineP = "DGN_GrapeDrank_M" in (magazines player);
_Magazine2P = !("DGN_GrapeDrank_M" in (magazines player));
_HaveWaterCheckP = HaveWaterP == 0;
_HaveWaterCheck2P = HaveWaterP ==1;	
if (_MagazineP && _HaveWaterCheckP) then
{
WaterP = player addAction ["Drink Purple Drank", "DrinkPurple.sqf", [], 0, false, false, ""];
HaveWaterP=1;
}
else
{
if (_Magazine2P && _HaveWaterCheck2P) then {
player removeaction WaterP;
HaveWaterP=0;
};
};
if !("DGN_GrapeDrank_M" in (magazines player)) then
{
player removeaction _WaterP;
HaveWaterP=0;
}
else
{
};
