_target = _this select 0;
_damage = _this select 2;
_part = _this select 1;
_shooter = _this select 3;
  
_healthStatus = "";

if (_damage > 1) then {

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
  _shooter addScore _damage + 1;
  sleep 5;
  deleteVehicle _target;
};
  
player globalchat format ["Target hit by %2 in %3. Target is %4.",_target, _shooter, _part, _healthStatus];
};