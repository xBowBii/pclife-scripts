_vampire = _this select 0;
_dmg = _this select 1;
_vampireDmg = damage _vampire;

player globalchat "You drunk some drops of blood.";
_hp = _vampire getVariable ["healthPool", 0];
player globalchat format ["Healthpool was: %1", _hp*100];
player globalchat format ["Amount of blood: %1", _dmg*100];

if (_vampireDmg > 0) then {
  if (_dmg > _vampireDmg) {
    _vampire setDamage 0;
    _hp = _hp + (_dmg - _vampireDmg);
    player globalchat format["Your healthpool: %1",_hp*100];
    _vampire setVariable ["healthPool", _hp];
   }   
else {
  _vampire setDamage (_vampireDmg - _dmg);
  player globalchat format["You healed by %1 hp",_dmg*100];
};

