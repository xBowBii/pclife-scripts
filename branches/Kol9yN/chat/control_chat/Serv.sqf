Sln_chat_msg = "";
Sln_chat_List = [];
// передача строки по сети
"Sln_chat_msg" addPublicVariableEventHandler
{
	[Sln_chat_msg] Spawn Fn_chat_Add
};
// Открытие ввода текста 
Fn_chat_Creat = {
_ok = createDialog "Sln_ChatIn_N3";
if (Call Fn_chat_Open) then
		{
	ctrlSetText [50100, "Канал открыт"];
		} else {
	ctrlShow [50101, false];
	ctrlSetText [50100, "Канал закрыт"];
	}
};
// закрытие строки ввода (ESC, Enter)
Fn_chat_exit = {
			disableSerialization;
		_tx = ctrlText ((findDisplay 5063) displayCtrl 50101);
		if (_tx != "") then {
		Sln_chat_msg = format ["%1:\n%2", name Player, _tx];
		publicVariable "Sln_chat_msg";
		[Sln_chat_msg] Spawn Fn_chat_Add;
		};
		closeDialog 0;
		Sln_chat_msg = "";
};
//сложение строк, открытие окна вывода
Fn_chat_Add =
{
	if !(Call Fn_chat_Open) exitWith {};// проверка доступа
	Sln_chat_List set [count Sln_chat_List, _this];
	if (count Sln_chat_List == 1) then
	{
		1011 cutRsc ["Sln_Chat_Out_N3", "Plain"]
	}
};
//таймер, смещение и стирание текста
Fn_chat_Tim =
{
	private ["_tx","_tm","_n"];
	disableSerialization;
	_tm = time + 4;
	_cn = (_this select 0) displayCtrl 50102;
while {
	_n = count Sln_chat_List; _n > 0
	} do {
	if !(Call Fn_chat_Open) exitWith {Sln_chat_List = []};
		_tx = "";
		{
		_tx = _tx + format ["%1\n", _x select 0]
		} forEach Sln_chat_List;
	_cn ctrlSetText _tx;

	waitUntil
		{
		
		//(_tm < time) ||
		(_n < count Sln_chat_List)
		};
	if (_tm < time) then
		{
		Sln_chat_List set [0,"e"];
		Sln_chat_List = Sln_chat_List - ["e"];
		_tm = time + 4;
		};
	};
	1011 cutText ["", "Plain"]
};
//Управление каналами чата(появление кнопок)
Fn_chat_admin = {
	closeDialog 0;
	sleep 0.1;
	_ok = createDialog "Sln_Chat_admin";
	disableSerialization;
	_ds = findDisplay 5064;
	_ms = Sln_Cat_Mod getVariable "Sln_Chat_State";
for "_a" from 0 to 2 do {
	(_ds displayCtrl (50200+_a)) ctrlSetTextColor (
			if (_ms select _a) then {[0,1,0,1]} else {[1,0,0,1]}
			);
	};
};
//Управление каналами чата(нажатие кнопок)
Fn_chat_select = {
	_ms = Sln_Cat_Mod getVariable "Sln_Chat_State";
	disableSerialization;
	_ds = findDisplay 5064;
	(_ds displayCtrl (50200+_this)) ctrlSetTextColor (
	if (_ms select _this) then {
		_ms set [_this, false]; [0,0,0,1]
		} else {
		_ms set [_this, true];[0,1,0,1]
			});
Sln_Cat_Mod setVariable ["Sln_Chat_State", _ms, true];
};

//проверка доступа к чату
Fn_chat_Open = {
_ms = Sln_Cat_Mod getVariable "Sln_Chat_State";
if (alive Player) then 
{
	 if (({_x in ["ACRE_PRC343","ACRE_PRC148","ItemRadio"]} count (Weapons Player) == 0) || acre_sys_core_ts3id != -1) then
	{
	((_ms select 0) || (_ms select 1))
 	} else {_ms select 0}
	} else {_ms select 2}
};
// первый игрок становится админом
if (serverCommandAvailable "#kick") then {
 isAdmin == name Player;
	publicVariable "isAdmin";
} else {
	isAdmin == call compile "isAdmin";
};
//создание переменных для управления каналами, на старте все каналы открыты
if isServer then
{
	Sln_Cat_Mod = _this;
	publicVariable "Sln_Cat_Mod";
	Sln_Cat_Mod setVariable ["Sln_Chat_State", [true,true,true], true];
} else {
	Sln_Cat_Mod = call compile "Sln_Cat_Mod"
};