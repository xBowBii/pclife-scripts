_target = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_shooter = _this select 3;

player globalchat "Hands hit detected";

_delta = _damage - HANDS_DMG;

if (_delta > 0.1) then {
  player globalchat "hands damage confirmed";
  [_target, "hands", _delta, _shooter] call reportDamage;
}
else {player globalchat "Phantom hands hit detected!";};

HANDS_DMG = _damage;