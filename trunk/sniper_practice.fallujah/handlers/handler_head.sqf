_target = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_shooter = _this select 3;

_delta = _damage - HEAD_DMG;

if (_damage != 1) then {
  if (_delta > 0.3) then {
    [_target, "head", _delta, _shooter] call reportDamage;
  };
};
HEAD_DMG = _damage;