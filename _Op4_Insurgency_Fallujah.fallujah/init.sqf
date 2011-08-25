if !isDedicated then { startLoadingScreen ["Loading...","RscLoadScreenCustom"]; };
enableSaving [false, false]; 
waitUntil { isServer || !isNull player }; 
waitUntil { !isNil "BIS_MPF_InitDone" }; 
waitUntil { BIS_MPF_InitDone }; 

// Global Variable Init
curTime				= time;    //mission start time
serverLoadHint      = false;   //server load hint message

if (local player) then { call compile preprocessFileLineNumbers "initclient.sqf"; }; 
if (isServer) then { call compile preprocessFileLineNumbers "initserver.sqf"; }; 