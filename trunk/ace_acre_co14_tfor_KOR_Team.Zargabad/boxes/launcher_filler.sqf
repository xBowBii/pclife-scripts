//launcher_filler.sqf

if (isServer) then {
  launcherBox = _this select 0;
  publicVariable "launcherBox";
};

_weapons = [
        "ACE_RMG",
        "ACE_RPG22",
        "ACE_RPG27",
        "ACE_RPG29",
        "ACE_RPG7V_PGO7",
        "RPG7V",
        "ACE_RPOM",
        "ACE_RSHG1",        
        "ACE_M136_CSRS",
        "ACE_M72A2",
        "M136",
        "ACE_Javelin_CLU",
        "ACE_Javelin_Direct",
        "MAAWS",
        "Stinger",
        "M47Launcher_EP1",
        "Igla",
        "MetisLauncher",
        "Strela",
        "M47Launcher_EP1",
        "SMAW"
];

_magazines = [
       "SMAW_HEAA",
       "SMAW_HEDP",
       "ACE_SMAW_NE",
       "MAAWS_HEAT",
       "MAAWS_HEDP",
       "PG7VL",
       "PG7VR",
       "OG7",
       "ACE_TBG7V",
       "ACE_PG7VM",
       "ACE_MAAWS_HE",
       "ACE_RPG29_PG29",
       "ACE_RPG29_TBG29",
       "ACE_AT13TB",
       "AT13",
//       "ACE_Javelin_Direct",
       "Strela",
       "Igla",
       "Stinger",
       "Dragon_EP1"
];

tfor_loadable_magazines = _magazines;

while {alive launcherBox} do {

    {deleteVehicle _x} foreach nearestObjects [position launcherBox,["WeaponHolder"],100];

    clearMagazineCargo launcherBox;
    clearWeaponCargo launcherBox;

    {
      launcherBox addWeaponCargo [_x, 3];
    } foreach _weapons;

    {
      launcherBox addMagazineCargo [_x, 10];
    } foreach _magazines;


    // restock time.
    sleep 3600;
}; 
