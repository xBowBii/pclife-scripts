//by Bon_Inf*


_objects = _this;

{

	_x addEventHandler ["HandleDamage", {
		_damage = _this select 2;
		_projectile = _this select 4;

		if(_projectile != "PipeBomb") then {
			0
		} else {
			1
		};
	}];

} foreach _objects;