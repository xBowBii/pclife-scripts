_tDir = 0;
_tDistance = 0;

if (isServer) then {
_place = round random 7;
_offset = 0;

switch (_place) do 
{
  case 0:
    {_offset = 38};  
  case 1:
    {_offset = 20};  
  case 2:
    {_offset = 20};
  case 3:
    {_offset = 6};
  case 4:
    {_offset = 0};
  case 5:
    {_offset = 0};
  case 6:
    {_offset = 20};
  case 7:
    {_offset = 0};
};

_marker = format ["xlwp_%1",_place];
_grp = createGroup resistance;
_target = _grp createUnit ["GUE_Commander", position _pad, [], 1, "FORM"];
TEH_TARGET = _target;
_target setPosATL [getMarkerPos _marker select 0, getMarkerPos _marker select 1, (getMarkerPos _marker select 2) + _offset];
sleep 0.2;
_target addEventHandler ["HandleDamage",{if ((_this select 4 != "") and (_this select 1 != "")) then {[TEH_TARGET, _this select 1, _this select 2, _this select 3] call reportDamage};_this select 2}];
_target setDir round random 360;
_tDistance = spotter distance _target;
_tDistance = (round (_tDistance/100)) * 100;
_tDir = ((((getPos _target select 0) - (getPos spotter select 0)) atan2 ((getPos _target select 1) - (getPos spotter select 1))) + 360) % 360;
};

player globalchat format ["New target: man, %1, about %2 meters",_tDir,_tDistance];
