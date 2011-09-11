_sectormarker = _this select 0;
_dimensions = _this select 1;
_dir = _this select 2;
_thisTrigger = _this select 3;

_markername = (str time);
_markerstr = createMarker[_markername, getmarkerpos _sectormarker];
_markerstr setMarkerShape "RECTANGLE";
_markername setMarkerBrush "SOLID";	
_markername setMarkerSize _dimensions;
_markername setmarkercolor "colorGreen";
_markername setmarkeralpha 0.25;
_markername setmarkerdir _dir;

_sectormarker setmarkercolor "colorBlack";

[west, "HQ"] commandchat "Sector Cleared";

ClearedSectors = ClearedSectors + 1;