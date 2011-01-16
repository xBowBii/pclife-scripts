_group = _this select 0;
{switch (primaryWeapon _x) do {
	case ("AK_47_M"): {
		_x removeWeapon "AK_47_M";
		_x addWeapon "ACE_AKM";		
	};
	case ("AK_47_S"): {
		_x removeWeapon "AK_47_S";
		_x addWeapon "ACE_AKMS";
	};
};
} foreach units _group;