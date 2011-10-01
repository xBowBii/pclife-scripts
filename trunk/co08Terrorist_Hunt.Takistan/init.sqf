execVM "briefing.sqf";

//Init UPSMON scritp
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";

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
if (viewparam == 0) then {setViewDistance 1000};
if (viewparam == 1) then {setViewDistance 1500};
if (viewparam == 2) then {setViewDistance 2000};
if (viewparam == 3) then {setViewDistance 2500};
if (viewparam == 4) then {setViewDistance 3000};
if (viewparam == 5) then {setViewDistance 4000};
if (viewparam == 6) then {setViewDistance 6000};
if (viewparam == 7) then {setViewDistance 8000};
if (viewparam == 8) then {setViewDistance 10000};

if isserver then { 
_aiskill = paramsarray select 4;
  {
    call compile format ["_x setskill 0.%1",_aiskill];
  } foreach allunits;
};

if (paramsArray select 8 == 4) then {player addEventHandler ["HIT",{(_this select 0) setDamage (0 * damage (_this select 0));}];};

[300,60] execVM "cly_removedead.sqf";

ace_wounds_prevtime = 60;