_target = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_shooter = _this select 3;

player globalchat "head hit detected";

_delta = _damage - HEAD_DMG;

if (_damage != 1) then {
  if (_delta > 0.3) then {
    player globalchat "head damage confirmed";
    [_target, "head_hit", _delta, _shooter] call reportDamage;
  }
  else {player globalchat "Phantom hit detected!";};
};
HEAD_DMG = _damage;