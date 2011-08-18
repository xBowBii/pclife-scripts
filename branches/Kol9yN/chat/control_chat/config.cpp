class CfgPatches  {

        class Sln_Chat_1  {
                units[] = {};
                weapons[] = {};
                requiredVersion = 0.100000;
                requiredAddons[] = {"CAUI";"ace_c_ui" };
        };
};
class RscButton;
class RscText;
class RscPicture;
class RscEdit;
class RscShortcutButton;
//окно ввода
class RscDisplayChat  {
idd = 24;
onLoad = "_as = _this execVM '\control_chat\e_o.sqf'";
movingEnable = true;
enableSimulation = true;
        onKeyDown = "if ((_this select 1) == 28) then {_as = (ctrlText ((_this select 0) displayCtrl 101)) execVM '\control_chat\edit.sqf'}";
        class controls  {
        class Ca_Line;
        class Ca_Background;
        };
};
//название канала
class RscDisplayChannel  {
idd = 63;
onLoad = "if (isNil 'Sln_Cat_Mod') then {_as = [0] execVM '\control_chat\n_o.sqf'}";
        class controls  {
                class Ca_Channel;
                class Background ;
                class Picture;
        };
};
// окно админа
class Sln_Chat_admin {
idd = 5064;
movingEnable = true;
enableSimulation = true;
class controls  {
class bt0 : RscShortcutButton {
                        idc = 50200;
                        x = "SafeZoneX + SafeZoneW*0.01";
                        y = "SafeZoneY + SafeZoneH*0.55";
                        w = "SafeZoneW*0.2";
                        h = "SafeZoneH*0.1";
                        text = "Общий";
                        action = "_as = 0 spawn Fn_chat_select";
                };
class bt1 : bt0 {
                idc = 50201;
                text = "Канал стороны";
                y = "SafeZoneY + SafeZoneH*0.6";
                action = "_as = 1 spawn Fn_chat_select";
                };
class bt2 : bt0 {
                idc = 50202;
                text = "Канал группы";
                y = "SafeZoneY + SafeZoneH*0.65";
                action = "_as = 2 spawn Fn_chat_select";
                };
class btex : bt0 {
                y = "SafeZoneY + SafeZoneH*0.7";
                text = "Выход";
                action = "closeDialog 0";
                };
        };
};
