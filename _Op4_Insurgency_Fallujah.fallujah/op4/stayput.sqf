if (!isServer) exitWith {};

_vec = _this select 0;
_startpos = getpos _vec;
_startdir = getdir _vec;

while {(alive _vec)} do {
sleep 60;
_vec setpos _startpos;
_vec setdir _startdir;
};