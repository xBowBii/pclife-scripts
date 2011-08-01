//func_keyspressed.sqf
private ['_handled','_button','_dlg'];

_handled = false;
_button = _this select 1;


if(_button in actionKeys "NetworkStats" && if(isNil "tfor_deathcount_shown") then {true} else {not tfor_deathcount_shown}) then{
        cutText [format["Жизней осталось: %1",floor (tfor_max_death_per_mission - tfor_deathcount)],"PLAIN DOWN",0];
        tfor_deathcount_shown = true;
};

(time + 2) spawn 
    { 
        while {time < _this} do 
        { 
        if (!isNull (findDisplay 49)) exitWith 
            { 
                ((findDisplay 49) displayCtrl 1010) ctrlEnable false; 
            }; 
        }; 

};

_handled