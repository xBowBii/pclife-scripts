// by Bon_Inf*

startLoadingScreen ["Подгрузка инициализации..."];


#include "config.sqf"
#include "funcs\compile_funcs.sqf"

if(isNil "tfor_deathcount") then {tfor_deathcount = 0};
Server setVariable ["tfor_artifunds",tfor_artifunds,false];


if(isNil "paramsArray") then{
    paramsArray = [
        11, // Time of Day
        0, // ACRE radios
        15,  // max. missions
        16, // max death per mission
        10,  // Enemy Skill
        2,  // Number enemy Inf
        1,  // Number enemy Vecs
        1,  // MHQ respawn
        0,  // Time speedup
        2,  // Marker system
        25, // ieds
        15, // Dynamic Respawndelay
        2,  // rallypoints, fobs
        0,  // Ambient Civilians,
        1,  // Dynamic Weather,
        2,  // enemy Patrols
        1,  // enemy AA
        1,  // enemy Camps
        1,  // enemy reinf
        1,  // advanced aircraft
        1  // advanced vehicles
    ];
};
tfor_daytime            = paramsArray select 0;
tfor_acre            = paramsArray select 1;
//tfor_maxgroupsize        = paramsArray select 1;    //Server setVariable ["tfor_maxgroupsize",tfor_maxgroupsize,false];
tfor_maxmissions        = paramsArray select 2;
tfor_max_death_per_mission    = paramsArray select 3;
tfor_enemyskill            = (paramsArray select 4)/10;
tfor_amount_enemyinfantry    = paramsArray select 5;
tfor_amount_enemytanks        = paramsArray select 6;
tfor_mhqrespawn            = paramsArray select 7;
tfor_timespeedup        = paramsArray select 8;
tfor_markersystem        = paramsArray select 9;
tfor_ieds            = paramsArray select 10;
//tfor_injurysystem        = paramsArray select 10;
tfor_dynamic_respawn        = paramsArray select 11;
tfor_rallypoints        = paramsArray select 12;
tfor_ambient_civs        = paramsArray select 13;
tfor_dynamic_weather        = paramsArray select 14;
tfor_enemy_patrols        = paramsArray select 15;
tfor_enemy_aa            = paramsArray select 16;
tfor_enemy_camps        = paramsArray select 17;
tfor_enemy_reinforcements    = paramsArray select 18;
tfor_adv_aircraft        = paramsArray select 19;
tfor_adv_vehicles        = paramsArray select 20;


TFOR_INIT = true; // yay all variables set!!!


if(not isDedicated) then{WaitUntil{not isNull player}};
//[] execVM "bon_artillery\bon_arti_init.sqf";
//[] execVM "bon_recruit_units\init.sqf";
//[] execVM "bon_loadoutpresets\bon_init_loadoutpresets.sqf";
[] execVM "bon_settings\bon_settings_init.sqf";
//[] execVM "bon_lasertargeting\init.sqf";
[] execVM "bon_ieds\init.sqf";
//[TFOR_TERMINAL] execVM "uav\init.sqf";
//[TFOR_TERMINAL] execVM "bon_supplydrop\init.sqf";
[tfor_timespeedup] execFSM "fsm\skiptime.fsm";
[] execFSM "fsm\vehicledrivercheck.fsm";

if(tfor_dynamic_weather == 1) then {[] execFSM "fsm\dynamicweather.fsm"};

[] execVM "initserver.sqf";
[] execVM "initplayer.sqf";

_null = [r_box] execVM "boxes\rifle_filler.sqf";
_null = [mg_box] execVM "boxes\mg_filler.sqf";
_null = [l_box] execVM "boxes\launcher_filler.sqf";
_null = [m_box] execVM "boxes\misc_filler.sqf";
_null = [s_box] execVM "boxes\sniper_filler.sqf";
_null = [ruck_box] execVM "boxes\ammo_rucks.sqf";
_null=[] execVM "mediaplayer.sqf";


endLoadingScreen;