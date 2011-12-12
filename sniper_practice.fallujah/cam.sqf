// Bullet Cam Script
// v1.1
// cam.sqf
// Big Dawg KS
// 7/13/09
//
// Call via Fired EH, ex:
//   this addEventHandler ["fired",{_this execVM "cam.sqf"}]
//
// To exit the camera ingame (while in flight), press the key for ironsights/optics
//
// To add supported weapons, add MUZZLE classnames to _list (note: classnames are CASE SENSITIVE)
//
// To disable bullet cam, set BDKS_DisableBulletCam = true
//
// To disable blur effects, set BDKS_BulletCamNoBlur = true
//
// To disable particle effects, set BDKS_BulletCamNoParticleFX = true
//
// To change FOV (zoom), change the value of BDKS_BulletCamFOV (default 0.05). Ex:
//   BDKS_BulletCamFOV = 0.3
//
// To change time acceleration, change the value of BDKS_BulletCamAccTime (default 0.5). Ex:
//   BDKS_BulletCamAccTime = 0.2
// (Note: AccTime only works in Singleplayer)
//
// To make another unit's (other than local player) bullet cam show for the
// local player, set unit variable BDKS_ShowBulletCamToPlayer = true, ex:
//   if(local Spotter)then{Sniper setVariable ["BDKS_ShowBulletCamToPlayer",true]}
//------------------------------------------------------------------------------------------------

_projectile = nearestObject [_this select 0,_this select 4];

if(call {if(isNil "BDKS_DisableBulletCam")then{true}else{!BDKS_DisableBulletCam}})then{

if((_this select 0) == vehicle player || call {if(isNil {(_this select 0) getVariable "BDKS_ShowBulletCamToPlayer"})then{false}else{(_this select 0) getVariable "BDKS_ShowBulletCamToPlayer"}})then{

// Add more weapons here
_list = ["M40A3","m107","M24","M4SPR","SVD","SVD_CAMO","ksvk","DMR","huntingrifle", "SVD_des_EP1", "ACE_SVD_Bipod", "VSS_vintorez", "AK_107_pso", "ACE_AK103_PSO", "ACE_AKS74P_PSO", "ACE_AK74M_PSO", "ACE_AK103_1P29", "ACE_AKS74P_1P29", "ACE_AK74M_1P78", "ACE_G3SG1", "ACE_M109", "ACE_AS50", "M24_des_EP1", "ACE_M110", "ACE_M110_SD", "ACE_TAC50", "ACE_TAC50_SD", "ACE_Mk12mod1", "ACE_Mk12mod1_SD", "ACE_M4SPR_SD", "ACE_HK417_leupold", "SCAR_H_LNG_Sniper", "SCAR_H_LNG_Sniper_SD", "ACE_G36A2_Bipod", "ACE_M14_ACOG", "m16a4_acg", "ACE_m16a2_scope"];

_type = getText (configFile >> "CfgAmmo" >> (_this select 4) >> "simulation");
_relPos = [0,-15,0.05];
_fov = 0.05;
if(!isNil "BDKS_BulletCamFOV")then{_fov = BDKS_BulletCamFOV};

_disablePP = false;
if(call {if(isNil "BDKS_BulletCamNoBlur")then{false}else{BDKS_DisableBulletCam}})then{_disablePP = true};

if((_this select 2) in _list && !(isNull _projectile))then{
	_camera = "camera" camCreate (getPos _projectile);
	_camera cameraEffect ["INTERNAL","BACK"];
	showCinemaBorder false;
	cutText ["","BLACK IN",0.2];
	_cancel = false;

	while{alive _projectile && alive _camera && !_cancel}do{
		_camera camSetTarget _projectile;
		_camera camSetRelPos _relPos;
		_camera camSetFOV _fov;
		_camera camSetFocus [600,2];
		_camera camCommit 0;

		"RadialBlur" ppEffectAdjust [0.02,0.02,0.1,0.1];
		"RadialBlur" ppEffectCommit 0.01;
		if(!_disablePP)then{"RadialBlur" ppEffectEnable true};

		if(inputAction "Optics" != 0)then{_cancel = true};

		sleep 0.001;
	};
	if(alive _camera && !_cancel)then{
		_camera camSetFocus [-(_relPos select 1),1];
		_camera camSetFOV (_fov * 1.6);
		_camera camCommit 1.5;

		"RadialBlur" ppEffectAdjust [0,0,1,1];
		"RadialBlur" ppEffectCommit 0.7;

		sleep 1.39;
	};
	cutText ["","BLACK OUT",0.1];
	sleep 0.11;
	"RadialBlur" ppEffectEnable false;
	_camera cameraEffect ["TERMINATE","BACK"];
	camDestroy _camera;
	cutText ["","BLACK IN",0.6];
};

};

};