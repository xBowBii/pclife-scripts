// Universal Crate Filler 1.0
// by Tophe of Östgöta Ops
// Usage:
// nul = [this] execVM "crateFiller.sqf"
//
// Optional settings:
// nul = [this,side(west,east,all),game(arma,ao,all),refill(true/false),weapons(amount),magazines(amount),equipment(amount)] execVM "crateFiller.sqf"
//
// Default values:
// nul = [this,"west","all",false,30,75,30] execVM "crateFiller.sqf"


// Set variables
_box 		= _this select 0;
_side 		= if (count _this > 1) then {_this select 1} else {"west"};
_game 		= if (count _this > 2) then {_this select 2} else {"all"};
_refill 	= if (count _this > 3) then {_this select 3} else {false};
_amountw 	= if (count _this > 4) then {_this select 4} else {30};
_amountm 	= if (count _this > 5) then {_this select 5} else {75};
_amounte 	= if (count _this > 6) then {_this select 6} else {30};

_run 		= true;

// Check variables
//hint  format ["%1", typename _side];
if !(typename _side == "STRING") then {hint "Universal Box Filler:\n Side setting must be West/East/All \n \n It is now changed to West \n Set it in the map editor"; _side = "west"};
if !(typename _game == "STRING") then {hint "Universal Box Filler:\n Game setting must be Arma/AO/All \n \n It is now changed to All \n Set it in the map editor"; _side = "west"};
if !(_side == "west" or _side == "east" or _side == "all") then {hint "Universal Box Filler:\n Side setting must be West/East/All \n \n It is now changed to West \n Set it in the map editor"; _side = "west"};
if !(_game == "arma" or _game == "AO" or _game == "all") then {hint "Universal Box Filler:\n Game setting must be Arma/AO/All  \n \n It is now changed to All \n Set it in the map editor";_game = "all"}; 
if !(typename _refill == "BOOL") then {hint "Universal Box Filler:\n Refill must be set to True/False \n \n It is now changed to False\n Set it in the map editor";_refill = false};
if !(typename _amountw == "SCALAR") then {hint "Universal Box Filler:\n Weapon amount must be a number \n \n It is now changed to 30\n Set it in the map editor"; _amountw = 30};
if !(typename _amountm == "SCALAR") then {hint "Universal Box Filler:\n Magazine amount must be a number \n \n It is now changed to 75\n Set it in the map editor"; _amountw = 75};
if !(typename _amounte == "SCALAR") then {hint "Universal Box Filler:\n Equipment amount must be a number \n \n It is now changed to 30\n Set it in the map editor"; _amountw = 30};

// Debug
//hint format["Side: %1, Game: %2, Refill: %3, w: %4, m: %5, e: %6",_side, _game, _refill, _amountw, _amountm, _amounte];


while {_run} do
{


clearWeaponCargo _box; 
clearMagazineCargo _box;



// Add Common equipment
_box addMagazineCargo ["PipeBomb", _amountm];
_box addMagazineCargo ["Mine", _amountm];
_box addMagazineCargo ["HandGrenade",_amountm];
_box addWeaponCargo ["Binocular", _amounte];
_box addWeaponCargo ["ItemCompass", _amounte];
_box addWeaponCargo ["ItemGPS", _amounte];
_box addWeaponCargo ["ItemMap", _amounte];
_box addWeaponCargo ["ItemRadio", _amounte];
_box addWeaponCargo ["ItemWatch", _amounte];
_box addWeaponCargo ["Laserdesignator", _amounte];
_box addWeaponCargo ["NVGoggles", _amounte];
_box addMagazineCargo ["Laserbatteries", _amounte];

// Add Arrowhead Equipment
if ((_game == "AO") or (_game == "all" )) then 
{
_box addWeaponCargo ["Binocular_Vector", _amounte];
_box addMagazineCargo ["IR_Strobe_Target", _amounte];
_box addMagazineCargo ["IR_Strobe_Marker", _amounte];
};


// Fill with West Equipment
if (_side == "west" or _side == "all") then 
	{
	// Add Arma2 Weapons	
	if (_game == "arma" or _game == "all") then 
		{
		// Rifles
		_box addWeaponCargo ["M16A2", _amountw];
		_box addWeaponCargo ["M16A4", _amountw];
		_box addWeaponCargo ["M16A4_GL", _amountw];
		_box addWeaponCargo ["M16A4_ACG", _amountw];
		_box addWeaponCargo ["M16A4_ACG_GL", _amountw];
		_box addWeaponCargo ["M4A1_AIM", _amountw];
		_box addWeaponCargo ["M4A1_AIM_CAMO", _amountw];
		_box addWeaponCargo ["M4A1_RCO_GL", _amountw];
		_box addWeaponCargo ["M4A1_AIM_SD_CAMO", _amountw];
		_box addWeaponCargo ["M4A1_HWS_GL", _amountw];
		_box addWeaponCargo ["M4A1_HWS_GL_CAMO", _amountw]; 
		_box addWeaponCargo ["M4A1_HWS_GL_SD_CAMO", _amountw]; 
		_box addWeaponCargo ["M4SPR", _amountw]; 
		_box addWeaponCargo ["m8_Carbine", _amountw]; 
		_box addWeaponCargo ["m8_CarbineGL", _amountw]; 
		_box addWeaponCargo ["m8_Compact", _amountw]; 
		_box addWeaponCargo ["m8_Sharpshooter", _amountw]; 
		_box addWeaponCargo ["m8_SAW", _amountw]; 
		_box addWeaponCargo ["G36A", _amountw]; 
		_box addWeaponCargo ["G36K", _amountw]; 
		_box addWeaponCargo ["G36C", _amountw]; 
		_box addWeaponCargo ["G36_C_SD_Eotech", _amountw]; 
		_box addWeaponCargo ["MG36", _amountw]; 
		_box addWeaponCargo ["DMR", _amountw];  
		_box addWeaponCargo ["MP5A5", _amountw];  
		_box addWeaponCargo ["MP5SD", _amountw];
		// Machineguns 
		_box addWeaponCargo ["M249", _amountw]; 
		_box addWeaponCargo ["M240", _amountw];  
		_box addWeaponCargo ["MK_48", _amountw];
		// Sniper 
		_box addWeaponCargo ["M24", _amountw]; 
		_box addWeaponCargo ["M40A3", _amountw]; 
		_box addWeaponCargo ["m107", _amountw]; 
		_box addWeaponCargo ["M1014", _amountw]; 
		// Sidearms
		_box addWeaponCargo ["Colt1911", _amountw]; 
		_box addWeaponCargo ["M9", _amountw]; 
		_box addWeaponCargo ["M9SD", _amountw]; 
		// Launchers
		_box addWeaponCargo ["M136", _amountw]; 
		_box addWeaponCargo ["SMAW", _amountw]; 
		_box addWeaponCargo ["Javelin", _amountw]; 
		_box addWeaponCargo ["Stinger", _amountw]; 
		};	

	// Add Arrowhead Weapons
	if (_game == "AO" or _game == "all") then 
		{
			// Making sure some equipment is not added twice
			if !((_side == "all" and _game == "all") or (_side == "all" and _game == "AO")) then
			{
			_box addWeaponCargo ["G36A_camo", _amountw];               
			_box addWeaponCargo ["G36C_camo", _amountw];               
			_box addWeaponCargo ["G36_C_SD_camo", _amountw]; 
			_box addWeaponCargo ["G36K_camo", _amountw]; 
			_box addWeaponCargo ["LeeEnfield", _amountw];
			_box addWeaponCargo ["FN_FAL", _amountw];
			_box addWeaponCargo ["FN_FAL_ANPVS4", _amountw];   
			};

		// Rifles
		_box addWeaponCargo ["M14_EP1", _amountw];                 
		_box addWeaponCargo ["M4A3_RCO_GL_EP1", _amountw];         
		_box addWeaponCargo ["M4A3_CCO_EP1", _amountw];            
		_box addWeaponCargo ["SCAR_L_CQC_CCO_SD", _amountw];       
		_box addWeaponCargo ["SCAR_L_CQC", _amountw];              
		_box addWeaponCargo ["SCAR_L_CQC_Holo", _amountw];         
		_box addWeaponCargo ["SCAR_L_CQC_EGLM_Holo", _amountw];    
		_box addWeaponCargo ["SCAR_L_STD_EGLM_RCO", _amountw];     
		_box addWeaponCargo ["SCAR_L_STD_EGLM_TWS", _amountw];     
		_box addWeaponCargo ["SCAR_L_STD_HOLO", _amountw];         
		_box addWeaponCargo ["SCAR_L_STD_Mk4CQT", _amountw];       
		_box addWeaponCargo ["SCAR_H_CQC_CCO", _amountw];          
		_box addWeaponCargo ["SCAR_H_CQC_CCO_SD", _amountw];       
		_box addWeaponCargo ["SCAR_H_STD_EGLM_Spect", _amountw];   
		_box addWeaponCargo ["SCAR_H_LNG_Sniper", _amountw];       
		_box addWeaponCargo ["SCAR_H_LNG_Sniper_SD", _amountw];    
		_box addWeaponCargo ["SCAR_H_STD_TWS_SD", _amountw]; 
	      	// Machineguns	
		_box addWeaponCargo ["MG36_camo", _amountw]; 
		_box addWeaponCargo ["m240_scoped_EP1", _amountw]; 
		_box addWeaponCargo ["M249_EP1", _amountw];   
		_box addWeaponCargo ["M249_m145_EP1", _amountw]; 
		_box addWeaponCargo ["M249_TWS_EP1", _amountw]; 
		_box addWeaponCargo ["M60A4_EP1", _amountw];  
		_box addWeaponCargo ["Mk_48_DES_EP1", _amountw]; 
		// Sniper
		_box addWeaponCargo ["m107_TWS_EP1", _amountw]; 
		_box addWeaponCargo ["M110_NVG_EP1", _amountw]; 
		_box addWeaponCargo ["M110_TWS_EP1", _amountw]; 
		_box addWeaponCargo ["M24_des_EP1", _amountw]; 
		// Handguns
		_box addWeaponCargo ["glock17_EP1", _amountw];  
		// Launchers
		_box addWeaponCargo ["M47Launcher_EP1", _amountw];  
		_box addWeaponCargo ["MAAWS", _amountw];  

	 	// Grenade Launchers
		_box addWeaponCargo ["Mk13_EP1", _amountw];
		_box addWeaponCargo ["M32_EP1", _amountw];
		_box addWeaponCargo ["M79_EP1", _amountw];
		};	

	// Add Arma 2 magazines
	if ((_game == "arma") or (_game == "all")) then 
		{
		_box addMagazineCargo ["8Rnd_B_Beneli_74Slug", _amountm];
		_box addMagazineCargo ["SMAW_HEAA", _amountm];
		_box addMagazineCargo ["SMAW_HEDP", _amountm];
		_box addMagazineCargo ["30rnd_9x19_MP5", _amountm];
		_box addMagazineCargo ["30rnd_9x19_MP5SD", _amountm];	
		};

	
	// Add Arrowhead Magazines
	if ((_game == "AO") or (_game == "all")) then 
		{
			if !((_game == "all" and _side == "all") or (_game == "AO" and _side == "all")) then
			{
			_box addMagazineCargo ["20Rnd_762x51_FNFAL", _amountm];
			};
		_box addMagazineCargo ["10x_303", _amountm];
		_box addMagazineCargo ["20Rnd_762x51_B_SCAR", _amountm];
		_box addMagazineCargo ["20Rnd_762x51_SB_SCAR", _amountm];
	
		_box addMagazineCargo ["17Rnd_9x19_glock17", _amountm];
		_box addMagazineCargo ["Dragon_EP1", _amountm];
		_box addMagazineCargo ["MAAWS_HEAT", _amountm];
		_box addMagazineCargo ["MAAWS_HEDP", _amountm];

		_box addMagazineCargo ["6Rnd_HE_M203", _amountm];
		};

	// Add Common Magazines

			if !((_game == "all" and _side == "all") or (_game == "AO" and _side == "all")) then
			{
			_box addMagazineCargo ["30Rnd_556x45_G36", _amountm];
			_box addMagazineCargo ["30Rnd_556x45_G36SD", _amountm];
			_box addMagazineCargo ["7Rnd_45ACP_1911", _amountm];
			_box addMagazineCargo ["100Rnd_556x45_BetaCMag", _amountm];
			};

		_box addMagazineCargo ["20Rnd_556x45_Stanag", _amountm];
		_box addMagazineCargo ["30Rnd_556x45_Stanag", _amountm];
		_box addMagazineCargo ["30Rnd_556x45_StanagSD", _amountm];


		_box addMagazineCargo ["200Rnd_556x45_M249", _amountm];
		_box addMagazineCargo ["100Rnd_762x51_M240", _amountm];
	
		_box addMagazineCargo ["5Rnd_762x51_M24", _amountm];
		_box addMagazineCargo ["10Rnd_127x99_M107", _amountm];

		_box addMagazineCargo ["15Rnd_9x19_M9", _amountm];
		_box addMagazineCargo ["15Rnd_9x19_M9SD", _amountm];
	
		_box addMagazineCargo ["M136", _amountm];
		_box addMagazineCargo ["Javelin", _amountm];
		_box addMagazineCargo ["Stinger", _amountm];
	
		_box addMagazineCargo ["20Rnd_762x51_DMR", _amountm];

		_box addMagazineCargo ["FlareWhite_M203", _amountm];
		_box addMagazineCargo ["FlareGreen_M203", _amountm];
		_box addMagazineCargo ["FlareRed_M203", _amountm];
		_box addMagazineCargo ["FlareYellow_M203", _amountm];
		_box addMagazineCargo ["1Rnd_HE_M203", _amountm];
		_box addMagazineCargo ["1Rnd_Smoke_M203", _amountm];
		_box addMagazineCargo ["1Rnd_SmokeRed_M203", _amountm];
		_box addMagazineCargo ["1Rnd_SmokeGreen_M203", _amountm];
		_box addMagazineCargo ["1Rnd_SmokeYellow_M203", _amountm];

		_box addMagazineCargo ["HandGrenade_West", _amountm];
		_box addMagazineCargo ["SmokeShell", _amountm];
		_box addMagazineCargo ["SmokeShellYellow", _amountm];
		_box addMagazineCargo ["SmokeShellRed", _amountm];
		_box addMagazineCargo ["SmokeShellGreen", _amountm];
		_box addMagazineCargo ["SmokeShellPurple", _amountm];
		_box addMagazineCargo ["SmokeShellBlue", _amountm];
		_box addMagazineCargo ["SmokeShellOrange", _amountm];
	
		// Add Common Weapons
		_box addWeaponCargo ["M16A2GL", _amountw]; 
		_box addWeaponCargo ["M4A1", _amountw]; 
};


// Fill with East Equipment
if (_side == "east" or _side == "all") then 
	{
	// Add Arma2 Weapons	
	if (_game == "arma" or _game == "all") then 
		{
		//Rifles
		_box addWeaponCargo ["AK_107_kobra", _amountw];
		_box addWeaponCargo ["AK_107_GL_kobra", _amountw];
		_box addWeaponCargo ["AK_107_GL_pso", _amountw];
		_box addWeaponCargo ["AK_107_pso",_amountw];
		_box addWeaponCargo ["AKS_74_UN_kobra",_amountw];
		_box addWeaponCargo ["Bizon",_amountw];
		_box addWeaponCargo ["bizon_silenced",_amountw];
		_box addWeaponCargo ["Saiga12K",_amountw];
		_box addWeaponCargo ["VSS_vintorez",_amountw];
		_box addWeaponCargo ["Pecheneg",_amountw];
		// Machineguns
		_box addWeaponCargo ["Huntingrifle",_amountw];
		// Sniper Rifles
		_box addWeaponCargo ["SVD_CAMO",_amountw];
		// Arma2 Ammo
		_box addMagazineCargo ["8Rnd_B_Saiga12_74Slug", _amountm];
		_box addMagazineCargo ["30Rnd_545x39_AKSD", _amountm];
		_box addMagazineCargo ["64Rnd_9x19_Bizon", _amountm];
		_box addMagazineCargo ["64Rnd_9x19_SD_Bizon", _amountm];
		_box addMagazineCargo ["10Rnd_9x39_SP5_VSS", _amountm];
		_box addMagazineCargo ["20Rnd_9x39_SP5_VSS", _amountm];
		};

	if (_game == "AO" or _game == "all") then 
		{
		// Rifles

		_box addWeaponCargo ["AK_74_GL_kobra", _amountw];
		_box addWeaponCargo ["AKS_74", _amountw];
		_box addWeaponCargo ["AKS_74_GOSHAWK", _amountw];
		_box addWeaponCargo ["AKS_74_NSPU", _amountw];
		_box addWeaponCargo ["FN_FAL", _amountw];
		_box addWeaponCargo ["FN_FAL_ANPVS4", _amountw];
		_box addWeaponCargo ["G36A_camo", _amountw];
		_box addWeaponCargo ["G36C_camo", _amountw];
		_box addWeaponCargo ["G36_C_SD_camo", _amountw];
		_box addWeaponCargo ["G36K_camo", _amountw];
		_box addWeaponCargo ["LeeEnfield", _amountw];
		_box addWeaponCargo ["Sa58P_EP1", _amountw];
		_box addWeaponCargo ["Sa58V_EP1", _amountw];
		_box addWeaponCargo ["Sa58V_RCO_EP1", _amountw];
		_box addWeaponCargo ["Sa58V_CCO_EP1", _amountw];
		// Sniper rifles
		_box addWeaponCargo ["SVD_des_EP1", _amountw];
		_box addWeaponCargo ["SVD_NSPU_EP1", _amountw];
		// Sidearm
		_box addWeaponCargo ["revolver_EP1", _amountw];
		_box addWeaponCargo ["revolver_gold_EP1", _amountw];
		_box addWeaponCargo ["Sa61_EP1", _amountw];
		_box addWeaponCargo ["UZI_EP1", _amountw];
		_box addWeaponCargo ["UZI_SD_EP1", _amountw];
		// AT
		_box addWeaponCargo ["MetisLauncher", _amountw];
		// Arrowhead Ammo
		_box addMagazineCargo ["30Rnd_762x39_SA58", _amountm];
		_box addMagazineCargo ["20Rnd_762x51_FNFAL", _amountm];
		_box addMagazineCargo ["6Rnd_45ACP", _amountm];
		_box addMagazineCargo ["20Rnd_B_765x17_Ball", _amountm];
		_box addMagazineCargo ["30Rnd_9x19_UZI", _amountm];
		_box addMagazineCargo ["30Rnd_9x19_UZI_SD", _amountm];
		};

	// Common East Weapons
	// Rifles
	_box addWeaponCargo ["AK_74_GL",_amountw];
	_box addWeaponCargo ["AKS_74_kobra", _amountw];
	_box addWeaponCargo ["AKS_74_pso", _amountw];
	_box addWeaponCargo ["AK_74", _amountw];
	_box addWeaponCargo ["AKS_74_U",_amountw];
	_box addWeaponCargo ["AK_47_M",_amountw];
	_box addWeaponCargo ["AK_47_S",_amountw];
	// Sniper Rifles
	_box addWeaponCargo ["KSVK",_amountw];
	_box addWeaponCargo ["SVD",_amountw];
	// Machineguns
	_box addWeaponCargo ["PK", _amountw];
	_box addWeaponCargo ["RPK_74", _amountw];
	// Sidearms
	_box addWeaponCargo ["Makarov",_amountw];
	_box addWeaponCargo ["MakarovSD",_amountw];
	// Launchers
	_box addWeaponCargo ["RPG18", _amountw];
	_box addWeaponCargo ["RPG7V", _amountw];
	_box addWeaponCargo ["Strela", _amountw];
	_box addWeaponCargo ["Igla", _amountw];


	// Common East Ammo
	_box addMagazineCargo ["30Rnd_545x39_AK", _amountm];
	_box addMagazineCargo ["30Rnd_762x39_AK47", _amountm];
	_box addMagazineCargo ["100Rnd_556x45_BetaCMag", _amountm];
	_box addMagazineCargo ["30Rnd_556x45_G36", _amountm];
	_box addMagazineCargo ["30Rnd_556x45_G36SD", _amountm];

	_box addMagazineCargo ["5Rnd_127x108_KSVK", _amountm];
	_box addMagazineCargo ["10Rnd_762x54_SVD", _amountm];

	_box addMagazineCargo ["75Rnd_545x39_RPK", _amountm];
	_box addMagazineCargo ["100Rnd_762x54_PK", _amountm];

	_box addMagazineCargo ["7Rnd_45ACP_1911", _amountm];
	_box addMagazineCargo ["8Rnd_9x18_Makarov", _amountm];
	_box addMagazineCargo ["8Rnd_9x18_MakarovSD", _amountm];

	_box addMagazineCargo ["HandGrenade_East", _amountm];

	_box addMagazineCargo ["Igla", _amountm];
	_box addMagazineCargo ["RPG18", _amountm];
	_box addMagazineCargo ["Strela", _amountm];	
	_box addMagazineCargo ["AT13", _amountm];
	_box addMagazineCargo ["PG7V", _amountm];
	_box addMagazineCargo ["PG7VL", _amountm];
	_box addMagazineCargo ["PG7VR", _amountm];
	_box addMagazineCargo ["OG7", _amountm];

	_box addMagazineCargo ["1Rnd_HE_GP25", _amountm];
	_box addMagazineCargo ["1Rnd_Smoke_GP25", _amountm];
	_box addMagazineCargo ["1Rnd_SmokeGreen_GP25", _amountm];
	_box addMagazineCargo ["1Rnd_SmokeRed_GP25", _amountm];
	_box addMagazineCargo ["1Rnd_SmokeYellow_GP25", _amountm];
	_box addMagazineCargo ["FlareGreen_GP25", _amountm];
	_box addMagazineCargo ["FlareRed_GP25", _amountm];
	_box addMagazineCargo ["FlareWhite_GP25", _amountm];
	_box addMagazineCargo ["FlareYellow_GP25", _amountm];




	};

if (!alive _box) then {_run = false};
if (!_refill) then {_run = false};
sleep 300;
};
