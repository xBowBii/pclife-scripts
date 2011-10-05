_Magazine = "DGN_Food_M" in (magazines player);
_Magazine2 = !("DGN_Food_M" in (magazines player));
_HaveFoodCheck = HaveFood == 0;
_HaveFoodCheck2 = HaveFood == 1;
if (_Magazine && _HaveFoodCheck) then
{
Food = player addAction ["Eat Food", "EatA.sqf", [], 0, false, false, ""];
HaveFood=1;
sleep 1;
}
else
{
if (_Magazine2 && _HaveFoodCheck2) then {
player removeaction Food;
HaveFood=0;
};
};
if !("DGN_Food_M" in (magazines player)) then
{
player removeaction _Food;
HaveFood=0;
}
else
{
};
sleep 1;
