_target = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_shooter = _this select 3;

_delta = _damage - BODY_DMG;

if (_delta > 0.2) then {
  [_target, "body", _delta, _shooter] call reportDamage;
};

BODY_DMG = _damage;