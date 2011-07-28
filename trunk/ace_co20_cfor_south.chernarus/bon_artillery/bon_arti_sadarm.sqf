// Original script: ARTY_sadarmDeploy.sqf by BIS (contained in ARTY module).
// minor edits by Bon_Inf*

_parachute_type = "ParachuteWest";
if(not isClass (configFile >> "CfgVehicles" >> _parachute_type)) then {
	_parachute_type = "Parachute_US_EP1";
};

private ["_altitude", "_targets", "_targetToHit", "_projectile", "_px", "_py", "_pz", "_v0", "_v1", "_seekerHits"];

_deployPos = [_this select 0, _this select 1, (_this select 2) max 250];

// Deploy parachute 
_parachute = _parachute_type createVehicle _deployPos;
_parachute setPos _deployPos;

_v0 = [random 5 - 10,random 5 - 10,-20];
_parachute setVelocity _v0;

// Simulate free fall stabilization and deployment of the main chute.
[_parachute,_v0] spawn {
	_chute = _this select 0;
	_v0 = _this select 1;
	while{getpos _chute select 2 > 5} do{
        	_v1 = velocity _chute;
	        _chute setVelocity [_v1 select 0, _v1 select 1, _v0 select 2];
	};
};
waitUntil{getPos _parachute select 2 < 200};


_targetFound = 0;
_simFallRate = -36;
_lastFrame = time;

waitUntil
{
        _px = getPos _parachute select 0;
        _py = getPos _parachute select 1;
        _pz = getPos _parachute select 2;
        
        // Wait for target altitude
        if (_pz < 150 and _pz > 75) then {
                // Search for targets to hit.
                _seekerHits = [_px, _py, 0] nearEntities [["Car","Tank","StaticCannon"], 200];
                _targets = [];
                {if (alive _x) then {_targets set [(count _targets), _x];};} forEach _seekerHits; // Get all targets that aren't already burning.
                textLogFormat ["%1, %2", _seekerHits, _targets];
                if (count _targets > 0) then
                {
                    _targetToHit = _targets select floor(random(count _targets));
                    sleep random(3); 
                    _targetFound=1;
                };
        };
       
        sleep 0.2;
        
        (_pz < 10 or _targetFound==1);
};


// Deploy attack munition if a target was found.
if (_targetFound==1) then
{

        _px = getPos _parachute select 0;
        _py = getPos _parachute select 1;
        _pz = getPos _parachute select 2;

        // Create burst.
        _burst = "ARTY_SADARM_BURST" createVehicle [_px, _py, _pz-20];
        _burst setPos [_px, _py, _pz-20];
                
        // Create projectile
        _projectile = "ARTY_SADARM_PROJO" createVehicle [_px, _py, _pz-20];
        _projectile setPos [_px, _py, _pz-20];

        // Calculate direction
        _xoff = (getPos _targetToHit select 0) - _px;
        _yoff = (getPos _targetToHit select 1) - _py;
        _zoff = - _pz;
        _mag = sqrt(_xoff*_xoff + _yoff*_yoff + _zoff*_zoff);
        _dir = [_xoff/_mag, _yoff/_mag, _zoff/_mag];
        _dx = _dir select 0;
        _dy = _dir select 1;
        _dz = _dir select 2;
        _hmag = sqrt(_dx*_dx + _dy*_dy);
        _zcomp = -_dz/_hmag;
        _ux = _zcomp*_dx;
        _uy = _zcomp*_dy;
        _uz = _hmag;
        
        _projectile setVectorDir _dir;
        _projectile setVectorUp [_ux,_uy,_uz];
        _projectile setVelocity [(_dir select 0) * 300, (_dir select 1) * 300, (_dir select 2) * 300];
};