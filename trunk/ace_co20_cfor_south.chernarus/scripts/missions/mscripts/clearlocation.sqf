// by Bon_Inf*

if(not isServer) exitWith{};

_location = _this select 0;


EnemiesSpawned = false;
[_location] execVM "scripts\missions\spawn_enemies.sqf";


cleared=false;
_trigger = createTrigger["EmptyDetector", position _location];
_trigger setTriggerArea[500,500,0,false];
_trigger setTriggerActivation[str tfor_enemy_side,"PRESENT",false];
_trigger setTriggerStatements["(count thislist)<5 && EnemiesSpawned", "cleared=true",""];

While{not cleared && tfor_deathcount <= tfor_max_death_per_mission} do{sleep 5};
deleteVehicle _trigger;

if(cleared) then{
	tfor_missionstate = "SUCCESS";
} else {
	tfor_missionstate = "FAIL";
};