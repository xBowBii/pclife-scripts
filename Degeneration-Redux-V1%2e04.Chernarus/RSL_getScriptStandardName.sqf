// Return a standard and usable script name (only letters, numbers, and _)

_a = toArray format ["%1", _this];

_b = [];
_b resize (count _a);

_n = 0;
{
	if( ((_x > 47) and (_x < 58))     // 0-9
	 or ((_x > 64) and (_x < 91))     // A-Z
	 or ((_x > 96) and (_x < 123)) )  // a-z
	then
	{
		_b set [_n, _x];
	}
	else  // replace all other characters by a letter; do not replace '_'
	{
		if( _x != 95 ) then { _b set [_n, 97 + floor(_x mod 26)]; };
	};
	_n = _n + 1;
}
forEach _a;

_s = toString _b;

_s