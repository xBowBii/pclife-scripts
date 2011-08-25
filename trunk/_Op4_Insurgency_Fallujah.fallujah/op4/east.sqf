//by Strikor, op4gaming.com

if (isServer) exitWith {};
player removeweapon "itemmap";
sleep 2.5;
player sidechat "CHECKING OP4 STATUS";
addonclear = false;
naughty = false;
player enablesimulation false;
sleep 1;

is13th = isClass(configFile >> "CfgPatches" >> "op4_13thcrate");

sleep 1;

while {!addonclear} do
{

if (is13th) then {
player sidechat "***Op4 13th TOC access granted***";
naughty = false;
};
sleep 0.5;

if (!is13th) then {
hintc "***Op4 13th TOC access denied***";
player sidechat "***Op4 13th TOC access denied***";
naughty = true;
};
sleep 0.5;

if (naughty) then {
player action ["eject", vehicle player];
removeallweapons player;
removeallitems player;
player setPos (getmarkerpos "jail");
player enablesimulation false;
hintc "OPFOR UNITS ARE FOR {Op4} MEMBERS ONLY.  JUST LIKE IT SAYS IN THE LOBBY.";
player sidechat "OPFOR UNITS ARE FOR {Op4} MEMBERS ONLY.  JUST LIKE IT SAYS IN THE LOBBY.";
};

if (!naughty) exitWith {
addonclear = true;
player sidechat "INITIALIZATION COMPLETE";
player addweapon "itemmap";
player enablesimulation true;
execVM "op4\iedtrack.sqf";
};

sleep 0.5;
};