_rally = _this;


hint parseText "<t size='1.25' font='Zeppelin33' color='#64b6ef' underline='1' shadow='1' shadowColor='#939393'>Rallypoint deployed !</t><br/><br/>It will get removed automatically when you finish your current task.<br/><br/>In two other minutes you can access the loadouts here.";
sleep 15;
hint "";



sleep 120;
if(not isNull _rally) then {
	_rally addAction ["<t color='#FFFFFF'>Get Equipment Preset</t>","bon_loadoutpresets\bon_loadout_presets.sqf"];
};