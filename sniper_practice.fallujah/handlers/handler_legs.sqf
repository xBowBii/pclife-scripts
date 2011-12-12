_target = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_shooter = _this select 3;

_delta = _damage - LEGS_DMG;

if (_delta > 0.45) then {
  [_target, "legs", _delta, _shooter] call reportDamage;
};

LEGS_DMG = _damage;