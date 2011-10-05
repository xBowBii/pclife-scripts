if !(alive S1) then {
	"S1" setpos (getpos S1SPAWN);
	};
	
/*
 NOTE: The first person to enter the server will have the name __SERVER__
see: http://forums.bistudio.com/showthread.php?t=110386
 for more info
 
 the rest of the players should work
 
Example of using the uid, I couldnt get it to work with that method
*/
private ["_name"];
_name = _this select 1; //name of player
_uid = _this select 2;

/*
if (_uid == 479424) then {
sleep (random 30); // in case multiple VVC players are online, all hints do not come all at once
[nil,nil,rHINT,"Alert all players. The creator of the vehicle spawning script, Craig, has just connected. He has been given 3 hunter-killer M1A2 TUSKs"] call RE;
};
*/

if ((_name == "Craig") || (_name == "[VVC] Craig")) then {
sleep (random 30); // in case multiple VVC players are online, all hints do not come all at once
[nil,nil,rglobalChat,"Craig has just connected. He has been given 3 hunter-killer M1A2 TUSKs"] call RE;
};

if ((_name == "bobtom") || (_name == "[VVC] bobtom")) then {
sleep (random 30); // in case multiple VVC players are online, all hints do not come all at once
//[nil,nil,rglobalChat,""] call RE;
};

if (_name == "[VVC] Mr. Bubbles") then {
sleep (random 30); // in case multiple VVC players are online, all hints do not come all at once
//[nil,nil,rHINT,"Rage machine Jaca has joined the server"] call RE;
};

if (_name == "[VVC] Dominic") then {
sleep (random 30); // in case multiple VVC players are online, all hints do not come all at once
[nil,nil,rglobalChat,"Zombies everywhere? Don't fear. Dominic be killing them everywhere."] call RE;
};

if (_name == "[VVC] Mr. Bubbles") then {
sleep (random 30); // in case multiple VVC players are online, all hints do not come all at once
//[nil,nil,rHINT,"Rage machine Jaca has joined the server"] call RE;
};

if (_name == "=113th=Jaca42") then {
sleep (random 30); // in case multiple VVC players are online, all hints do not come all at once
[nil,nil,rglobalChat,"Rage machine Jaca has joined the server"] call RE;
};

if (_name == "Jazz Hands") then {
sleep (random 30); // in case multiple VVC players are online, all hints do not come all at once
//[nil,nil,rHINT,"Rage machine Jaca has joined the server"] call RE;
};


if (_name == "[VVC] Fritsch") then {
sleep (random 30); // in case multiple VVC players are online, all hints do not come all at once
//[nil,nil,rHINT,"Rage machine Jaca has joined the server"] call RE;
};

if (_name == "[VVC] Osis") then {
sleep (random 30); // in case multiple VVC players are online, all hints do not come all at once
[nil,nil,rHINT,"Better put your 3d glasses on, Osis' comin' at cha"] call RE;
};


if (_name == "[VVC] Demon") then {
sleep (random 30); // in case multiple VVC players are online, all hints do not come all at once
//[nil,nil,rHINT,"Rage machine Jaca has joined the server"] call RE;
};

if (_name == "=[113TH]=Jenkins") then {
sleep (random 30); // in case multiple VVC players are online, all hints do not come all at once
//[nil,nil,rHINT,"Rage machine Jaca has joined the server"] call RE;
};
BIS_Effects_Burn=compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";
