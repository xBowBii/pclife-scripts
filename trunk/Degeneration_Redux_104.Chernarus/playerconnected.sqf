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


BIS_Effects_Burn=compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";
