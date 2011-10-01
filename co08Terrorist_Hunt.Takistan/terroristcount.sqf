if (isserver) then {

_allCnt = ({!(_x in playableUnits)} count allUnits);
if ((paramsarray select 5) != _allCnt) then {
    _nonplayable = [];
    {if (!(_x in playableUnits)) then {_nonplayable = _nonplayable + [_x]}} foreach allUnits;
    _cnt = count _nonplayable;
    while {_cnt != (paramsarray select 5)} do {
        _unit = _nonplayable select 5;
        _nonplayable = _nonplayable - [_unit];
        _cnt = count _nonplayable;
        deleteVehicle _unit;
    };
};

_terrorists = [];
{
    if(side _x == east) then
    {
        _terrorists = _terrorists + [_x];
    };
} forEach allUnits; 

} 