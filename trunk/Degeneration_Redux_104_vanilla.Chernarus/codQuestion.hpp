class codQuestion
{
    idd = 3000;
    movingenable = 1;

    class Controls
    {


class Text1: RscText
{
    idc = 3;
    text = "Are you a console player?";
    x = 0.33227 * safezoneW + safezoneX;
    y = 0.158333 * safezoneH + safezoneY;
    w = 0.313313 * safezoneW;
    h = 0.0661111 * safezoneH;
};
class b1: RscShortcutButton
{
    idc = 1;
    text = "Yes!";
    onButtonClick = "closedialog 0; createDialog 'codQuestion2';"
    x = 0.51823 * safezoneW + safezoneX;
    y = 0.209259 * safezoneH + safezoneY;
    w = 0.0757808 * safezoneW;
    h = 0.0605556 * safezoneH;
};
class b2: RscShortcutButton
{
    idc = 2;
    text = "NO!";
    onButtonClick = "hint 'Since you are a loyal PC player you receive an m60'; closedialog 0; player addWeapon 'M60A4_EP1'; codlady removeaction 0;"
    x = 0.363524 * safezoneW + safezoneX;
    y = 0.209259 * safezoneH + safezoneY;
    w = 0.0757808 * safezoneW;
    h = 0.0605556 * safezoneH;
};
class boarder: RscFrame
{
    idc = 1800;
    x = 0.32081 * safezoneW + safezoneX;
    y = 0.180556 * safezoneH + safezoneY;
    w = 0.318001 * safezoneW;
    h = 0.0744444 * safezoneH;
};
};
};

class codQuestion2
{
    idd = 3000;
    movingenable = 1;

    class Controls
    {


class Text1: RscText
{
    idc = 3;
    text = "Do you play Call of Duty?";
    x = 0.33227 * safezoneW + safezoneX;
    y = 0.158333 * safezoneH + safezoneY;
    w = 0.313313 * safezoneW;
    h = 0.0661111 * safezoneH;
};
class b1: RscShortcutButton
{
    idc = 1;
    text = "Yes!";
    onButtonClick = "closedialog 0; [] execVM 'yes.sqf';"
    x = 0.51823 * safezoneW + safezoneX;
    y = 0.209259 * safezoneH + safezoneY;
    w = 0.0757808 * safezoneW;
    h = 0.0605556 * safezoneH;
};
class b2: RscShortcutButton
{
    idc = 2;
    text = "NO!";
    onButtonClick = "hint 'Good'; closedialog 0;codlady removeaction 0;"
    x = 0.363524 * safezoneW + safezoneX;
    y = 0.209259 * safezoneH + safezoneY;
    w = 0.0757808 * safezoneW;
    h = 0.0605556 * safezoneH;
};
class boarder: RscFrame
{
    idc = 1800;
    x = 0.32081 * safezoneW + safezoneX;
    y = 0.180556 * safezoneH + safezoneY;
    w = 0.318001 * safezoneW;
    h = 0.0744444 * safezoneH;
};
};
};