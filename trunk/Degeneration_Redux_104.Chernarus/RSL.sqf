_target = _this select 0;
_script = _this select 1;
_args   = _this select 2;

// Name of the public variable associated to the script
_pubVar = format ["RSL_pubvar_%1", _script call RSL_getScriptStandardName];

// Prevent overwriting of this public variable
while { call compile format ["count %1 > 0", _pubVar] } do { sleep random 1; };
// randomization is used in case two instances of this script are waiting for the same public
// variable to be available => as far as possible they must not be released simultaneously

// Handle all allowed types of target: unit, vehicle, "All", "Server", "Clients", array
switch (typeName _target) do
{
	case "OBJECT":  // _target is a unit, a vehicle
	// caution: Groups and Sides are Objects too, however RSL behaviour
	// is undefined if _target has one of these types
	{
		if( local _target ) then
		{
			// Start a local instance
			[_pubVar, [_target, _script, _args]] execVM "RSL_Catch.sqf";
		}
		else
		{
			// Trigger a remote instance
			[_target, _script, _args] call compile format ["%1 = _this;", _pubVar];
			call compile format ["publicVariable ""%1"";", _pubVar];
		};
	};
	
	case "STRING":  // _target is one of "All", "Server" or "Clients"
	{
		// Start a local instance
		[_pubVar, [toUpper _target, _script, _args]] execVM "RSL_Catch.sqf";

		// Trigger remote instance(s)
		[toUpper _target, _script, _args] call compile format ["%1 = _this;", _pubVar];
		call compile format ["publicVariable ""%1"";", _pubVar];
	};
	
	case "ARRAY":   // _target is an array of strings and/or objects
	{
		// Call RSL for each element in the array
		{
			[_x, _script, _args] execVM "RSL.sqf";
			sleep 0.01;
		}
		forEach _target;
	};
};
