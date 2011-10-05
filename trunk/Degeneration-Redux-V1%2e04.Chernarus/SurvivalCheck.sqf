nul = player execVM "HPMonitor.sqf";

if (Survival == 1) then {
Hint "Food/Water system enabled!";
nul = player execVM "FoodCheck.sqf";
nul = player execVM "WaterCheck.sqf";
sleep 0.1;
nul = player execVM "MelonCheck.sqf";
nul = player execVM "GrapeCheck.sqf";
Hint "Starting Food/Water system!";
sleep 0.1;
nul = player execVM "FoodCountdown.sqf";
nul = player execVM "WaterCountdown.sqf";
} 
else 
{
Hint "Food/Water system disabled!";
sleep 5;
}
