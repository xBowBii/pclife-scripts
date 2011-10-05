Delete=true;
while {Delete} do {
sleep 30;
{if (count units _x==0) then {deleteGroup _x}} forEach allGroups;
sleep 2;
};