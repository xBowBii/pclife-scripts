//by Strikor, op4gaming.com

if (isServer) exitWith {};
sleep 2.5;
player sidechat "INITIALIZING";
addonclear = false;
naughty = false;
hint "Remember to check the ''Op4 Mission Information'' section in your briefing notes for information on unique features.";
player sidechat "Remember to check the ''Op4 Mission Information'' section in your briefing notes for information on unique features.";
sleep 2.5;

#include "mando.h"

is13th = isClass(configFile >> "CfgPatches" >> "op4_13thcrate");

da_lostkey = isClass(configFile >> "CfgPatches" >> "Loki_Lost_Key");

da_inkodisp = isClass(configFile >> "CfgPatches" >> "inko_disposable_oa");

sleep 2.5;

while {!addonclear} do
{

if (da_mando) then {
hintc "***ADDON DISALLOWED***\n\nMando Missile\n\nPlease disable this if you wish to play here.\n\nREASON: Undesired behavior";
player sidechat "***ADDON DISALLOWED***  Mando Missile   Please disable this if you wish to play here.   REASON: Undesired behavior";
player say "DBrian_Oh_no";
naughty = true;
};
sleep 0.5;

if (da_lostkey) then {
hintc "***ADDON DISALLOWED***\n\nLost Key\n\nPlease disable this if you wish to play here.\n\nREASON: Undesired behavior";
player sidechat "***ADDON DISALLOWED***   Lost Key   Please disable this if you wish to play here.   REASON: Undesired behavior";
player say "DBrian_Oh_no";
naughty = true;
};
sleep 0.5;

if (da_inkodisp) then {
hintc "***ADDON DISALLOWED***\n\nINKO Disposable\n\nPlease disable this if you wish to play here.\n\nREASON: ACE already does this, why are you running this addon?";
player sidechat "***ADDON DISALLOWED***   INKO Disposable   Please disable this if you wish to play here.   REASON: ACE already does this, why are you running this addon?";
player say "DBrian_Oh_no";
naughty = true;
};
sleep 0.5;

if (naughty) then {
player action ["eject", vehicle player];
removeallweapons player;
removeallitems player;
player setPos (getmarkerpos "jail");
};

if (!naughty) exitWith {
addonclear = true;
player sidechat "INITIALIZATION COMPLETE";
};

sleep 0.5;
};