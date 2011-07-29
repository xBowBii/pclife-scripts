private['_handled','_button'];

_button = _this select 1;
_handled = false;

if(_button in actionKeys "TeamSwitch") then{
	if(not dialog) then{_dlg = createDialog "SettingsDialog"};
	_handled = true;
};

_handled