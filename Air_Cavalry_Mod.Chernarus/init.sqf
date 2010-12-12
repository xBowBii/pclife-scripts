usEra = 0;
rusEra = 0;
specEra = 0;
// FUCK THIS SHIT
_null = [] execVM "briefing.sqf";
_null = ["ammocrate1"] execVM "fillCrateUs.sqf";
_null = ["ammocrate2"] execVM "fillCrateRus.sqf";
_null = ["ammocrate3"] execVM "fillCrateSpec.sqf";
// WHAT THE FUCK IS THIS FUCKING SHIT
_null = [] execVM "chooseObjective.sqf";
// THIS IS SHIT
ace_wounds_prevtime = 300;

_EastHQ = createCenter east;

// AND FUCK ALL THIS SHIT