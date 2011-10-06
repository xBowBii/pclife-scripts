_Magazine = "DGN_Water_M" in (magazines player);
_Magazine2 = !("DGN_Water_M" in (magazines player));
_HaveWaterCheck = HaveWater == 0;
_HaveWaterCheck2 = HaveWater ==1;	
if (_Magazine && _HaveWaterCheck) then
{
Water = player addAction ["Drink Water", "DrinkA.sqf", [], 0, false, false, ""];
HaveWater=1;
}
else
{
if (_Magazine2 && _HaveWaterCheck2) then {
player removeaction Water;
HaveWater=0;
};
};
if !("DGN_Water_M" in (magazines player)) then
{
player removeaction _Water;
HaveWater=0;
}
else
{
};
