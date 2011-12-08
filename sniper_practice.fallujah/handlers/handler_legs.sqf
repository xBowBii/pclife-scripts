_target = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_shooter = _this select 3;

player globalchat "legs hit detected";

_delta = _damage - LEGS_DMG;

if (_delta > 0.05) then {
  player globalchat "legs damage confirmed";
  [_target, "legs", _delta, _shooter] call reportDamage;
}
else {player globalchat "Phantom legs hit detected!";};

LEGS_DMG = _damage;