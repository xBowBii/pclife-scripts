if !(serverCommandAvailable "#kick" ) exitWith {};
if (_this == "#Admin") then
{
_ok = createDialog "Sln_Chat_admin";

        disableSerialization;
        _ds = findDisplay 5064;
        _ms = Sln_Cat_Mod getVariable "Sln_Chat_State";
        
for "_a" from 0 to (count _ms)-1 do
        {
        (_ds displayCtrl (50200+_a)) ctrlSetTextColor
                (
                if (_ms select _a) then {[0,1,0,1]} else {[1,0,0,1]}
                );
        };
};

