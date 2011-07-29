private ['_handled','_button','_dlg'];

_handled = false;
_button = _this select 1;


if(_button in actionKeys "NetworkStats") then{
	cutText ["","PLAIN DOWN",0];
	tfor_deathcount_shown = false;
};




_handled
