// Written by Mondkalb
// Fills area with random amount of units and puts then into houses



if (not isserver) exitwith {};
//player commandchat "ploppin' the area full of baddies";
_sTime = time;
_dude = _this select 0;
_range = _this select 1;

_bldgns = nearestObjects [_dude, ["Land_MBG_Killhouse_1"], _range];
_P = [0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,3,3,4];
_infType = ["TK_INS_Soldier_EP1", "TK_INS_Soldier_AAT_EP1", "TK_INS_Soldier_2_EP1", "TK_INS_Soldier_3_EP1", "TK_INS_Soldier_4_EP1", "TK_INS_Soldier_AA_EP1", "TK_INS_Soldier_AT_EP1", "TK_INS_Soldier_TL_EP1", "TK_INS_Soldier_Sniper_EP1", "TK_INS_Soldier_AR_EP1", "TK_INS_Soldier_MG_EP1", "TK_INS_Bonesetter_EP1", "TK_INS_Warlord_EP1"];
_AmountOBuildings = count _bldgns;
_curObj = 0;
_spawnedSoldiers = 0;
While {_curobj != _AmountOBuildings} do {
	_x = _bldgns select _CurObj;
	_curobj = _curobj +1;
	_TotalBPositions = 0;
	
		while {(str (_x buildingPos _TotalBPositions)) != "[0,0,0]"} do {_TotalBPositions = _TotalBPositions + 1;};
		_I =  _p select (round (random ((count _p) -1)));
		_o = 0;
		
		while { _o != _i} do {
			_pa = (round (random _TotalBPositions));
			_bpos = (_x buildingPos _pa);
			//_d = (_InfType select (round (random ((count _infType) -1)))) createUnit [_bpos, _group];
			_group = createGroup east;
			_d = _group createUnit [(_InfType select (round (random ((count _infType) -1)))), _bpos, [], 0, "NONE"];
			_d setpos _bpos;
			_spawnedSoldiers = _spawnedSoldiers + 1;
			
		/////////////////////
		/*
				_markername = str Time;
				_markerstr = createMarker[_markername, _bpos];
				_markerstr setMarkerShape "Icon";
				_markerstr setmarkertype "dot";
				//_markerstr setmarkertext str time;
		*/
		/////////////////////
		
			_o = _o + 1;
			sleep 0.1;
		};
	sleep 0.01;	
};
	
//EDummy globalchat format ["DONE! %1 enemies created in %2s", _spawnedSoldiers, (time - _sTime)];