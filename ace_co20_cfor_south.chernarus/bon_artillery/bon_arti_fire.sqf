//by Bon_Inf*

if(not isServer && bon_arti_global) exitWith{};

private ['_lasertarget'];

_requestor = _this select 0;
_side = _this select 1;

_cannons_to_fire = _requestor getVariable "requesting_cannons";
_cannons_available = _cannons_to_fire;



_units_in_howitzers = [];
{
	if((typeOf vehicle _x) == tfor_artitype) then {
		_units_in_howitzers = _units_in_howitzers + [_x];
	};
} foreach (units group _requestor);



{//foreach _cannons_to_fire
	_available = Server getVariable format["Arti_%2_Cannon%1_available",_x,_side];

	if(_available) then{
		_cannonsetup = _requestor getVariable format["Arti_%2_Cannon%1",_x,_side];
		Server setVariable [format["Arti_%2_Cannon%1_available",_x,_side],false,bon_arti_global];

		[_x,_cannonsetup,_requestor,_units_in_howitzers] spawn {
			_cannon = _this select 0;
			_splashpos = (_this select 1) select 0;
			_firedelay = (_this select 1) select 1;
			_artitype = (_this select 1) select 2;
			_nrshells = (_this select 1) select 3;
			_spread = (_this select 1) select 4;
			_units_in_howitzers = _this select 3;

			_requestor = _this select 2;
			_side = side _requestor;
			_requestor setVariable [format["Arti_%2_Cannon%1",_cannon,_side],nil,bon_arti_global];
			_requestor setVariable [format["Arti_%2_Cannon%1summary",_cannon,_side],nil,bon_arti_global];

			_shellsleft = Server getVariable format["Arti_%1_shellsleft",_side];
			Server setVariable [format["Arti_%1_shellsleft",_side],_shellsleft - _nrshells, bon_arti_global];


			[_units_in_howitzers,_splashpos,_nrshells] spawn {
				_cannons = _this select 0;
				_pos = _this select 1;
				_each_to_fire = _this select 2;

				for "_i" from 1 to _each_to_fire do {
					{_x doWatch [_pos select 0, _pos select 1, 1000]} foreach _cannons;
					sleep 2;
					{(vehicle _x) fire "M119"} foreach _cannons;
					sleep (5 + random 1.0);
				};
			};



			sleep (15 + (random 5) + _firedelay);

			for "_i" from 1 to _nrshells do {

				_lasertarget = _requestor call arti_func_getLaser;
				if(_spread < 0 && isNull _lasertarget) exitWith{};
				if(_spread < 0) then{_splashpos = getPos _lasertarget};

				_spawnpos = [(_splashpos select 0) + _spread - random (2*_spread),(_splashpos select 1) + _spread - random (2*_spread),100];
				_bomb = _artitype createVehicle _spawnpos;

				if(_artitype == "Sh_85_HE") then{ // DPICM
					[_bomb,_artitype,getPos _bomb] spawn {
						_bmb = _this select 0;
						_artype = _this select 1;
						_pos = _this select 2;
						WaitUntil{isNull _bmb};
						for "_j" from 1 to 10 do {
							_clusterb = _artype createVehicle [(_pos select 0) + 100 - random 200,(_pos select 1) + 100 - random 200,20];
							//sleep (0.5 + random 1);
						};
					};
				};

				if(_artitype == "SADARM") then { // SADARM by BIS
					_spawnpos execVM (BON_ARTI_PATH+"bon_arti_sadarm.sqf");
				};

				sleep (7.5 + random 10);
			};

			sleep (60 * _nrshells);
			Server SetVariable [format["Arti_%2_Cannon%1_available",_cannon,_side],true,bon_arti_global];
		};
	}
	else {_cannons_available = _cannons_available - [_x]};
} foreach _cannons_to_fire;

for "_i" from 1 to HW_Arti_CannonNumber do {
	if(not (_i in _cannons_to_fire)) then{
		_requestor setVariable [format["Arti_%2_Cannon%1",_i,_side],nil,bon_arti_global];
		_requestor setVariable [format["Arti_%2_Cannon%1summary",_i,_side],nil,bon_arti_global];
	};
};

if(true) exitWith{
	_requestor setVariable ["requesting_cannons",nil,bon_arti_global];
	Server setVariable [format["Arti_%1_requestor",_side],ObjNull,bon_arti_global];
};