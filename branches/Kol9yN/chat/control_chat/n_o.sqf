if isServer then {
        Sln_Cat_Mod = "HeliHEmpty" createVehicle [0,0];
        publicVariable "Sln_Cat_Mod";
        Sln_Cat_Mod setVariable ["Sln_Chat_State", [true,true,true], true];
} else {
        Sln_Cat_Mod = call compile "Sln_Cat_Mod";
};
                
Fn_chat_select = {
        disableSerialization;
        _ms = Sln_Cat_Mod getVariable "Sln_Chat_State";
        ((findDisplay 5064) displayCtrl (50200+_this)) ctrlSetTextColor
        (
        if (_ms select _this) then {
                _ms set [_this, false]; [1,0,0,1]
                } else {
                _ms set [_this, true]; [0,1,0,1]
                }
        );
Sln_Cat_Mod setVariable ["Sln_Chat_State", _ms, true];
};
