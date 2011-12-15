_subject = _this select 1;
_direction = _this select 3;

if (_direction == "up") then {
  _subject setPosATL [(getPos _subject select 0) + 4, getPos _subject select 1, (getPos _subject select 2) + 14];
};

if (_direction == "down") then {
  _subject setPosATL [(getPos _subject select 0) - 4, getPos _subject select 1, (getPos _subject select 2) - 14];
};