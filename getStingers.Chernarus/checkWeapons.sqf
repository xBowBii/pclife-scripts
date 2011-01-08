_array = _this select 0;
_itemArray = ["ItemCompass", "ItemRadio", "ItemWatch", "ACE_Earplugs", "ItemMap", "ItemGPS", "ItemRadio", "ACE_DAGR", "ACE_Map"];

for "_i" from 0 to count _array do {	
	_man = _array select _i;
	if (_man in units group ins1) then {
		_result = weapons _man - _itemArray;
//		{player globalchat format ["%1", _x];} foreach _result;
		if (count _result == 0) then {_man setCaptive true;};
		if (count _result == 1) then {
			_beer= [_result select 0, "ACRE"] call CBA_fnc_find;
			if (_beer != -1) then {_man setCaptive true;}
			else {_man setCaptive false;};	
		};
		if (count _result > 1) then {_man setCaptive false;};
	};
};