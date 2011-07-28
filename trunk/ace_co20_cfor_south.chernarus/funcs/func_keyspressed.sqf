private ['_handled','_button','_dlg'];

_handled = false;
_button = _this select 1;


if(_button in actionKeys "NetworkStats" && if(isNil "tfor_deathcount_shown") then {true} else {not tfor_deathcount_shown}) then{
	cutText [format["Lives remaining: %1",floor (tfor_max_death_per_mission - tfor_deathcount)],"PLAIN DOWN",0];
	tfor_deathcount_shown = true;
};




_handled
