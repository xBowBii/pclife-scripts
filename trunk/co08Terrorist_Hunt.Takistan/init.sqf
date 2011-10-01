execVM "briefing.sqf";

//Init UPSMON scritp
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";

// needed for Ai Shoots Flares script.
AIsoldierFlare_units = [];

// this line is for adding the AI light part to any player launched flares in Multi Player missions, optional.
//{_x addEventHandler ["fired", {_this execVM "scripts\EH_lightflare.sqf"}]} forEach playableUnits;

skiptime (((paramsArray select 0) - daytime + 24) % 24);

switch (paramsArray select 1) do {
  case 0: { 0 setOvercast 0; 0 setRain 0; };
  case 1: { 0 setOvercast 0.8; 0 setRain 0.3; };
  case 2: { 0 setOvercast 0.9; 0 setRain 0.6; };
  case 3: { 0 setOvercast 1; 0 setRain 1; };
};

switch (paramsArray select 2) do {
  case 0: { 0 setFog 0; };
  case 1: { 0 setFog 0.3; };
  case 2: { 0 setFog 0.6; };
  case 3: { 0 setFog 1; };
};

viewparam = (paramsArray select 3);
if (viewparam == 0) then {setViewDistance 50};
if (viewparam == 1) then {setViewDistance 100};
if (viewparam == 2) then {setViewDistance 300};
if (viewparam == 3) then {setViewDistance 500};
if (viewparam == 4) then {setViewDistance 1000};
if (viewparam == 5) then {setViewDistance 2000};
if (viewparam == 6) then {setViewDistance 3000};
if (viewparam == 7) then {setViewDistance 4000};
if (viewparam == 8) then {setViewDistance 5000};
if (viewparam == 9) then {setViewDistance 6000};
if (viewparam == 10) then {setViewDistance 7000};
if (viewparam == 11) then {setViewDistance 8000};
if (viewparam == 12) then {setViewDistance 9000};
if (viewparam == 13) then {setViewDistance 10000};

if isserver then { 
_aiskill = paramsarray select 4;
  {
    call compile format ["_x setskill 0.%1",_aiskill];
  } foreach allunits;
};

//if (paramsArray select 11 == 1) then {[player,0,0,1,true] exec "cly_heal.sqs";};
//if (paramsArray select 11 == 2) then {[player,0,0,2,true] exec "cly_heal.sqs";};
//if (paramsArray select 11 == 3) then {[player,0,0,3,true] exec "cly_heal.sqs";};
//if (paramsArray select 11 == 5) then {[player,0,0,5,true] exec "cly_heal.sqs";};
//if (paramsArray select 11 == 10) then {[player,0,0,10,true] exec "cly_heal.sqs";};
//if (paramsArray select 11 == 5000) then {[player,0,0,-1,true] exec "cly_heal.sqs";};
[300,60] execVM "cly_removedead.sqf";

//if (paramsArray select 8 == 1) then {player execVM "scripts\regen1.sqf";};
//if (paramsArray select 8 == 2) then {player execVM "scripts\regen2.sqf";};
//if (paramsArray select 8 == 3) then {player execVM "scripts\regen3.sqf";};
//if (paramsArray select 8 == 5) then {player execVM "scripts\regen5.sqf";};
//if (paramsArray select 8 == 10) then {player execVM "scripts\regen10.sqf";};

//if (paramsArray select 9 == 1) then {player addEventHandler ["HIT",{(_this select 0) setDamage (0.75 * damage (_this select 0));}];};
//if (paramsArray select 9 == 2) then {player addEventHandler ["HIT",{(_this select 0) setDamage (0.5 * damage (_this select 0));}];};
//if (paramsArray select 9 == 3) then {player addEventHandler ["HIT",{(_this select 0) setDamage (0.25 * damage (_this select 0));}];};
//if (paramsArray select 9 == 4) then {player addEventHandler ["HIT",{(_this select 0) setDamage (0 * damage (_this select 0));}];};

//if (paramsArray select 10 == 1) then {east addEventHandler ["HIT",{(_this select 0) setDamage (0.75 * damage (_this select 0));}];};
//if (paramsArray select 10 == 2) then {east addEventHandler ["HIT",{(_this select 0) setDamage (0.5 * damage (_this select 0));}];};
//if (paramsArray select 10 == 3) then {east addEventHandler ["HIT",{(_this select 0) setDamage (0.25 * damage (_this select 0));}];};
//if (paramsArray select 10 == 4) then {east addEventHandler ["HIT",{(_this select 0) setDamage (0 * damage (_this select 0));}];};

ace_wounds_prevtime = 20;