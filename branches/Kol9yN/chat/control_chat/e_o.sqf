disableSerialization;
_cn = (findDisplay 63) displayCtrl 101;
WaitUntil {ctrlText _cn != ""};// получение названия канала
_ms = Sln_Cat_Mod getVariable "Sln_Chat_State";
private "_nb";
switch (ctrlText _cn) do {
        case "Общий канал":{
                _nb = _ms select 0
        };
        case "Дополнительный канал":{
                _nb = _ms select 1
        };
        case "Канал группы":{
                _nb = _ms select 2
        };
        case "Транспортный канал":{
                
        };
        case "Командир":{
                
        };
        case "Прямое соединение":{
                
        };
        default {
                hint "Неизвестный канал"
        };
};
if ! _nb then {
        _cn ctrlSetText "Канал закрыт";
        ((_this select 0) displayCtrl 101) ctrlShow false
};