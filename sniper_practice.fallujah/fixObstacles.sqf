if(isServer) then {
_pad = _this select 0;
_building = nearestObject [_pad, "House"];
  
while {abs((getPos _pad select 0) - (getPos _building select 0)) < 5} do 
{
  _pad setpos [(getPos _pad select 0) + 10, getPos _pad select 1, getPos _pad select 2];
  player sidechat "obstacle fixed";
};

while {(getPos _pad select 1) - (getPos _building select 1) < 35} do 
{
  _pad setpos [getPos _pad select 0, (getPos _pad select 1) + 10, getPos _pad select 2];
  player sidechat "obstacle fixed";
};
};