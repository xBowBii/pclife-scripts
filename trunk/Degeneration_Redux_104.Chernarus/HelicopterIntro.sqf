sleep 1;
S8 addEventHandler ["HandleDamage", {false}];
H1 setPos [(getPos H1 select 0),(getPos H1 select 1),1500];
S8 MoveInDriver H1;
sleep 30;
H1 addEventHandler ["HandleDamage", {true}];
sleep 30;
S8 addEventHandler ["HandleDamage", {true}];