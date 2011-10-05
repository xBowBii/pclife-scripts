// Ensure the mission has started
sleep 1;

// Function to retrieve convenient logical names for the target scripts
if( isNil RSL_getScriptStandardName ) then
{
	RSL_getScriptStandardName = compile preProcessFile "RSL_getScriptStandardName.sqf";
	// must be a global variable as it is used also in RSL.sqf
};

// Handle _this either as a single string or as an array of strings
_scripts = if( typeName _this == "STRING" ) then { [_this] } else { _this; };

// Create a publicVariable event handler for each target script
{
	// Get a "universal" name for the target script
	_scriptName = _x call RSL_getScriptStandardName;

	// Name a public variable to be associated to the target script
	_pubVar = format ["RSL_pubvar_%1", _scriptName];

	// Initialize this variable
	call compile format ["%1 = []", _pubVar];
	if( isServer ) then { call compile format ["publicVariable ""%1"";", _pubVar]; };

	// Attach a pubVar EH to this variable		
	_pubVar addPublicVariableEventHandler {_this execVM "RSL_Catch.sqf";};
}
forEach _scripts;
