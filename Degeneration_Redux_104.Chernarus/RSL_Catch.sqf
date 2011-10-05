_pubvarName = _this select 0;
_pubvarValue = _this select 1;

// Do nothing if the RSL public variable has not been filled (or has just been reset)
if( count _pubvarValue != 3 ) exitWith {};

// Get the RSL public variable content
_target = _pubvarValue select 0;
_script = _pubvarValue select 1;
_args   = _pubvarValue select 2;

// Launch the required script
if( typeName _target == "OBJECT" ) then
{
	// Launch the required script only where _target is local; reset the RSL public variable
	if( local _target ) then
	{
		_args execVM _script;
		call compile format ["%1 = []; publicVariable ""%1"";", _pubvarName];
	};
}
else  // typeName _target == "STRING"
{
	// Handle locality according to _target
	_b1 = (_target == "ALL");
	_b2 = ((_target == "SERVER") and isServer);
	_b3 = ((_target == "CLIENTS") and not isDedicated);
	
	// Launch the required script
	if( _b1 or _b2 or _b3 ) then 
	{
		_args execVM _script;
	};

	// Reset the RSL public variable
	if( isServer ) then
	{
		sleep 1;  // time for RSL_Catch.sqf to have been launched everywhere
		call compile format ["%1 = []; publicVariable ""%1"";", _pubvarName];
	};
};
