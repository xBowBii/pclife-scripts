_vampire = _this select 0;
_dmg = _this select 1;

_hp = _vampire getVariable ["healthPool", 0];

if (_hp > 0) then {
  _hp = _hp - _dmg;
  player globalchat format["Your healthpool: %1",_hp*100];
  _vampire setVariable ["healthPool", _hp];
  _vampire setDamage 0;
}
else {_vampire setDamage _dmg};