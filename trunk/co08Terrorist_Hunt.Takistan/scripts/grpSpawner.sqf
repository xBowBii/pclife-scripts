_soldierCount = _this select 0;
_point = _this select 1;
_soldiersArray = _this select 2;

_newGroup = createGroup east;
for "_i" from 0 to _soldierCount-1 do {
  _soldierType = _soldiersArray select _i;
  _soldier = _newgroup createUnit [_soldierType,getMarkerPos _point,[],0,"FORM"];
  _EHKilled = _soldier addEventHandler ["killed", {_null = call refreshCounter}];
};
_newGroup;