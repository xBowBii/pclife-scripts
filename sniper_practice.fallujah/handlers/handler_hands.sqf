_target = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_shooter = _this select 3;

_delta = _damage - HANDS_DMG;

if (_delta > 0.3) then {
  [_target, "hands", _delta, _shooter] call reportDamage;
};

HANDS_DMG = _damage;