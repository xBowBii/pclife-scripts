usEra = 0;
rusEra = 0;
specEra = 0;
_null = [] execVM "briefing.sqf";
_null = ["ammocrate1"] execVM "fillCrateUs.sqf";
_null = ["ammocrate2"] execVM "fillCrateRus.sqf";
_null = ["ammocrate3"] execVM "fillCrateLaunchers.sqf";
_null = ["ammocrate4"] execVM "fillCrateSpec.sqf";
_null = [] execVM "chooseObjective.sqf";
ace_wounds_prevtime = 300;