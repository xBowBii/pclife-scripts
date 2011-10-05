_MagazineM = "DGN_Watermelon_M" in (magazines player);
_Magazine2M = !("DGN_Watermelon_M" in (magazines player));
_HaveFoodCheckM = HaveFoodM == 0;
_HaveFoodCheck2M = HaveFoodM == 1;

if (_MagazineM && _HaveFoodCheckM) then
{
FoodM = player addAction ["Eat Watermelon", "EatMelon.sqf", [], 0, false, false, ""];
HaveFoodM=1;
}
else
{
if (_Magazine2M && _HaveFoodCheck2M) then {
player removeaction FoodM;
HaveFoodM=0;
};
};
if !("DGN_Watermelon_M" in (magazines player)) then
{
player removeaction _FoodM;
HaveFoodM=0;
}
else
{
};
