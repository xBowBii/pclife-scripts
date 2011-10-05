player allowDamage false; 
_pos = [getpos player select 0, getpos player select 1, (getPos player select 2) + 1000];
player setPos _pos;
hint "Don't worry it wont hurt";
//_pos2 = [getpos player select 0, getpos player select 1,0];
 //_unitarray = group player unitsBelowHeight 10; 
//waitUntil {player in  _unitarray};
sleep 25;
player allowDamage true;
hint "Have a great day, and ditch your Call of Duty on console and play some more ArmA like a man.";
codlady removeAction 0;

