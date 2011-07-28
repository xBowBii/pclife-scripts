// by Bon_Inf*

if(not isServer) exitWith {};


_dropPos = _this select 0;
_dropType = _this select 1;
_side = _this select 2;

_ang = round random 360;
_radius = 1500 + (random 1000);
_a = (_dropPos select 0)+(sin(_ang)*_radius);
_b = (_dropPos select 1)+(cos(_ang)*_radius);
_planespawnpos = [_a,_b,750];

_planegroup = creategroup _side;
_plane = createVehicle [bon_supply_plane,_planespawnpos,[], 0, "FLY"]; _plane setPos _planespawnpos;

//_vel = velocity _plane; _dir = direction _plane;
//_plane setVelocity [(_vel select 0)+(sin _dir*150),(_vel select 1)+ (cos _dir*150),(_vel select 2)]; // added 150 of speed

_pilot = _planegroup createUnit [bon_supply_pilot,_planespawnpos,[],50,"FORM"]; _pilot setSkill 1;
_pilot moveinDriver _plane;
_pilot setDamage 0;
_pilot action ["gear_up",_plane];
_plane flyinHeight 450;
_plane setSpeedMode "LIMITED";

_pilot setCaptive true;
_pilot disableAI "TARGET";
_pilot disableAI "AUTOTARGET";


_wp = _planegroup addWaypoint [_dropPos,0];
_wp setWaypointCompletionRadius 200;

_rand = str(round random 999999); deleteMarker _rand;
_dropmarker = createMarker [_rand, _dropPos];
_dropmarker setMarkerType "mil_circle";
_dropmarker setMarkerSize [3,3];


WaitUntil{([getPos _plane select 0, getPos _plane select 1] distance [_dropPos select 0,_dropPos select 1] < 251) || (not canMove _plane)};

if(canMove _plane) then {[_plane,_dropType] execVM (BON_SUPPLY_PATH+'supplydrop.sqf')};

deleteWaypoint _wp;
(_planegroup addWaypoint [[0,0,0],0]) setWaypointSpeed "FULL";
_plane flyinHeight 2000;

sleep 120;

deleteVehicle _plane;
sleep 1;
deleteVehicle _pilot;
sleep 1;
deleteGroup _planegroup;

deleteMarker _dropmarker;