private ["_selection", "_control", "_selectedIndex", "_real_list", "_vlist"];

disableSerialization;

_selection = _this select 0;

_control = _selection select 0;
_selectedIndex = _selection select 1;

if (_selectedIndex == -1) exitWith {};

_real_list = [25, 50];
_vlist = ["Enabled", "Disabled"];
if (grasslayer != _selectedIndex) then {
	grasslayer = _selectedIndex;
	setTerrainGrid (_real_list select grasslayer);
};