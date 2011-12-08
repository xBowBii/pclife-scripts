_target = _this select 0;
_damage = _this select 2;
_part = _this select 1;
_shooter = _this select 3;
_grp = group _target;

_healthStatus = "";
_localTime = time - HIT_TIME;
player globalchat format ["T: %1",_localtime];
player globalchat format ["Damage: %1",_damage];
if (_localTime > 0.5) then {
  HIT_TIME = time;

//  if (_damage > 1) then {

  if (alive _target) then {
    _health = damage _target;
    if (_health <= 0.2) then {_healthStatus = "in good health"};
    if ((_health >= 0.2) && (_health < 0.5)) then {_healthStatus = "wounded"};
    if ((_health >= 0.5) && (_health < 0.8)) then {_healthStatus = "badly wounded"};
    if (_health >= 0.8) then {_healthStatus = "almost dead"};
    _shooter addScore _damage;
  }
  else {
    _healthStatus = "killed";
    _target removeAllEventHandlers "HandleDamage";
    _shooter addScore _damage + 1;
    deleteVehicle _target;
    deleteGroup _grp;
  };
  
/*  if (_damage <= 1.5) then {_dmgCondition = "light wound"};
  if ((_damage > 1.5) && (_damage <= 2.5)) then {_dmgCondition = "moderate wound"};
  if ((_damage > 2.5) && (_damage <= 3.5)) then {_dmgCondition = "a severe wound"};
  if (_damage > 3.5) then {_dmgCondition = "critical wound"};
*/
  
  [-2, {player sideChat _this}, format ["Target hit by %2 in %3. Target is %4.",_target, _shooter, _part, _healthStatus]] call CBA_fnc_globalExecute;
//  [-2, {player sideChat _this}, format ["%2 inflicted %5 to target by hit in %3. Target is %4.",_target, _shooter, _part, _healthStatus, _dmgCondition]] call CBA_fnc_globalExecute;
//  };
};