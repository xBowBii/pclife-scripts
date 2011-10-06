if (isServer) then {
while {true} do {
sleep 800;
0=[Z1,(30+(random 5)),"horde1","normal"] execVM "zombie_scripts\cly_z_horde.sqf";
sleep 0.25;
0=[Z1,((random 10)+5),"horde2","armored"] execVM "zombie_scripts\cly_z_horde.sqf";
sleep 800;
};
sleep 1;
};