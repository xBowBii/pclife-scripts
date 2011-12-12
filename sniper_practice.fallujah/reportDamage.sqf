_target = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_shooter = _this select 3;

_healthStatus = "";
_dmgCondition = "";

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
    HEAD_DMG = 0;
    BODY_DMG = 0;
    HANDS_DMG = 0;
    LEGS_DMG = 0;
  };

//player globalchat format ["damage: %1",_damage];  
  if (_damage <= 1) then {_dmgCondition = "light wound"};
  if ((_damage > 1) && (_damage <= 2)) then {_dmgCondition = "moderate wound"};
  if ((_damage > 2) && (_damage <= 3)) then {_dmgCondition = "a severe wound"};
  if (_damage > 3) then {_dmgCondition = "critical wound"};

  
  [-2, {player sideChat _this}, format ["%2 inflicted %5 to target by hit in %3. Target is %4.",_target, _shooter, _part, _healthStatus, _dmgCondition]] call CBA_fnc_globalExecute;