ace_wounds_prevtime = 300;

ace_sys_wounds_no_rpunish = true;

if ( (!isServer) && (player != player) ) then
{
    waitUntil {player == player};
    waitUntil {time > 10};

};

[] exec "intro.sqs";
execVM "briefing.sqf";

if (isServer) then {one=false; publicVariable "one"};
if (isServer) then {two=false; publicVariable "two"};
if (isServer) then {three=false; publicVariable "three"};
if (isServer) then {four=false; publicVariable "four"};
if (isServer) then {five=false; publicVariable "five"};
if (isServer) then {six=false; publicVariable "six"};
if (isServer) then {seven=false; publicVariable "seven"};
if (isServer) then {eight=false; publicVariable "eight"};
if (isServer) then {nine=false; publicVariable "nine"};

{
};
