HostageRescued = true;
Publicvariable "HostageRescued";
_rescuebloke = _this select 1;

[(_this select 0)] joinsilent (group _rescuebloke);

(_this select 0) groupchat "Thanks for rescuing me.";