// by Bon_Inf*
// executed by initPlayer.sqf


if(not local player) exitWith{};

// ------ Credits -------
player createDiaryRecord["Diary", ["Credits","Further credits to all of you who enjoy this mission. Thanks for playing."]];
player createDiaryRecord["Diary", ["Credits",""]];
//player createDiaryRecord["Diary", ["Credits","third-party scripts used (and partially edited): -"]];
player createDiaryRecord["Diary", ["Credits","I appreciate feedback and suggestions. Visit http://dev-heaven.net/projects/takistan-force."]];
player createDiaryRecord["Diary", ["Credits","In case you edit this mission please change author name and version number."]];
player createDiaryRecord["Diary", ["Credits","Mission Briefing by Kharrn, www.fh-warzone.de."]];
player createDiaryRecord["Diary", ["Credits","Scripts and design by Bon_Inf*, www.fh-warzone.net"]];
player createDiaryRecord["Diary", ["Credits",""]];



// --------- Misc ----------
if(tfor_mhqrespawn == 0) then{player createDiaryRecord["Diary", ["Misc","The MHQ does NOT respawn !!!"]]};
player createDiaryRecord["Diary", ["Misc","Cars and Transport Choppers respawn after 60 seconds, APCs after 3 minutes, Tanks after 5 minutes and Attack Helicopters after 10 minutes."]];
player createDiaryRecord["Diary", ["Misc","Vehicles can be repaired both at the Vehicle Service Points <marker name='VehicleService'>here</marker> and <marker name='VehicleService_1'>here</marker>."]];
player createDiaryRecord["Diary", ["Misc","Leaving a vehicle empty for more than 60 minutes it will be transferred back to your base. In case a vehicle becomes immovable, it'll blow up after 10 minutes unless it gets repaired."]];
player createDiaryRecord["Diary", ["Misc","Press T to set viewdistance and terrain detail."]];
player createDiaryRecord["Diary", ["Misc",""]];



// ----------- Artillery ------------
player createDiaryRecord["Diary", ["Artillery","7. Press 'Execute'."]];
player createDiaryRecord["Diary", ["Artillery","6. Hit 'Confirm' to apply those settings to the marked cannons."]];
player createDiaryRecord["Diary", ["Artillery","5. Set cannon-specific data: number of shells for each cannon to fire, spread."]];
player createDiaryRecord["Diary", ["Artillery","4. Select the cannons to fire from the cannon list on the left-hand side. Mark a single cannon by left-clicking on it, mark multiple cannons by holding CTRL while your left-click, mark multiple consecutive cannons by holding SHIFT while left-clicking."]];
player createDiaryRecord["Diary", ["Artillery","3. Open the interface, type in the spatial data - your own coordinates, presented in the two coordinates 'x-ray' and 'yankee', are displayed in the upper middle of the dialog, or when you open your map, at the top right corner of the screen."]];
player createDiaryRecord["Diary", ["Artillery","2. Range your target (e.g. by using the rangefinder)."]];
player createDiaryRecord["Diary", ["Artillery","1. Get Direction to target (use your compass)."]];
player createDiaryRecord["Diary", ["Artillery","Artillery Usage:"]];
player createDiaryRecord["Diary", ["Artillery",""]];
player createDiaryRecord["Diary", ["Artillery","Once you built a cannon, order an AI to get into it, in order to use the artillery request interface."]];
player createDiaryRecord["Diary", ["Artillery","There is an action assigned to each cannon to decompose it again. You can decompose any constructed cannon at any time."]];
//player createDiaryRecord["Diary", ["Artillery",format["Having artillery cannons constructed you cannot recruit more than %1 units.",tfor_artifunds]]];
//player createDiaryRecord["Diary", ["Artillery",format["Your current groups size must not exceed %1 units in order to use artillery.",tfor_artifunds+1]]];
player createDiaryRecord["Diary", ["Artillery","Artillery can be constructed <marker name='artillery'>here</marker> by the commander."]];
player createDiaryRecord["Diary", ["Artillery",""]];



// ------ Commander -------
if(tfor_mhqrespawn == 0) then{player createDiaryRecord["Diary", ["Commander","The MHQ does NOT respawn !!!"]]};
player createDiaryRecord["Diary", ["Commander","Construct useful assets like additional barracks, command posts, field hospital etc. when close to the <marker name='tfor_mhq'>MHQ</marker>."]];
player createDiaryRecord["Diary", ["Commander","Other players can request supply drops while the commander is ingame. Grant/deny supply drops at the UAV terminal at base or at constructed command posts."]];
player createDiaryRecord["Diary", ["Commander","Use the UAV at the UAV terminal at base or at constructed command posts."]];
player createDiaryRecord["Diary", ["Commander",""]];



// ----------- Skills ------------
player createDiaryRecord["Diary", ["Skills","- The CH-47F Helicopter can lift cars."]];
player createDiaryRecord["Diary", ["Skills","- Ammo Trucks can load and unload ammoboxes at Vehicle Service Points."]];
player createDiaryRecord["Diary", ["Skills","- Snipers can make use of laser designators to call in AI controlled bomber.<br/>Equip with and select the laser designator, laze your target, then use the action menu to call the bomber in."]];
player createDiaryRecord["Diary", ["Skills","- Only pilots can operate any kind of Air vehicles."]];
player createDiaryRecord["Diary", ["Skills","- Only crewmen can operate any kind of Tanks and APCs."]];
player createDiaryRecord["Diary", ["Skills",""]];



// --------- Assets ----------
player createDiaryRecord["Diary", ["Assets","Support Trucks are <marker name='support'>here</marker>."]];
player createDiaryRecord["Diary", ["Assets","Artillery can be constructed <marker name='artillery'>here</marker>."]];
player createDiaryRecord["Diary", ["Assets","Attack helicopters are <marker name='plane'>here</marker>."]];
player createDiaryRecord["Diary", ["Assets","Transport Helicopters are <marker name='heli'>here</marker>."]];
player createDiaryRecord["Diary", ["Assets","APCs and Tanks are <marker name='armor'>here</marker>."]];
player createDiaryRecord["Diary", ["Assets","HMMWVs are <marker name='cars'>here</marker>."]];
player createDiaryRecord["Diary", ["Assets","Recruit AI units at the <marker name='Barracks'>barracks</marker>."]];
player createDiaryRecord["Diary", ["Assets",""]];



// ----------- Mission ---------
player createDiaryRecord["Diary", ["Mission","Sometimes there could be own troops operating in the area so watch your fire when working together or attacking an assumed enemy position (which then turns out to be friendly...)."]];
player createDiaryRecord["Diary", ["Mission",format["Fail in %1 missions, and the operation is considered failed.",tfor_maxmissions]]];
player createDiaryRecord["Diary", ["Mission",format["Succeed in %1 missions, and you succeed in the operation.",tfor_maxmissions]]];
player createDiaryRecord["Diary", ["Mission",format["The implicit fail condition of a task is the team's death count exceeding %1. (AI getting killed does not count, though respawning by clicking Esc->Respawn and killing civilians does)",tfor_max_death_per_mission]]];
player createDiaryRecord["Diary", ["Mission","The task description always states the success condition explicitly."]];
player createDiaryRecord["Diary", ["Mission","Tasks are assigned dynamically to your team. Always take a look at the task description by pressing 'J'."]];
player createDiaryRecord["Diary", ["Mission","Execution:"]];
player createDiaryRecord["Diary", ["Mission",""]];
player createDiaryRecord["Diary", ["Mission","ROE will be given by commanding assets"]];
player createDiaryRecord["Diary", ["Mission","We have hotspots breaking out all over the map. It is our main task to stabilize this region but also to destroy any gathering of enemy forces, equipment or ammunition. Be aware of enemy training camps, observation posts or patrols. HQ will give you different missions so you will have to react to them like a sort of quick reaction force."]];
player createDiaryRecord["Diary", ["Mission","Mission:"]];
player createDiaryRecord["Diary", ["Mission",""]];



// ----------- Situation ------------
player createDiaryRecord["Diary", ["Situation","Other threats are lots of unexploded ordnance and the use of IEDs, which NATO forces bitterly discovered."]];
player createDiaryRecord["Diary", ["Situation","Secondly, there are rumours about insurgents who are loyal only to their families, clans and warlords. They will fight anyone endangering them and currently many of them could possible see a major threat in our operation. There are reports of small camps which are guarded by locals. These camps often indicate the border between two rivalling clans, so make sure you stick to the ROE."]];
player createDiaryRecord["Diary", ["Situation","First, there are the remaining soldiers of the local army who still have large amounts of equipment and ammunition. These troops are trained to fight and survive. Furthermore we could still face different tanks as well as armoured personel carriers and other Cold-War era vehicles. Our pilots should be aware of AAA and MANPADS. Intelligence has no information on the enemy air force."]];
player createDiaryRecord["Diary", ["Situation","We have two major hostile forces:"]];
player createDiaryRecord["Diary", ["Situation",""]];
player createDiaryRecord["Diary", ["Situation","We will belong to a multinational force and our job is to secure this region for an upcoming UN operation. This UN force will be deployed to supervise the demilitarization and distribution of the humanitarian aid. Some squads of the 601st Special Forces Group of the Army of the Czech Republic and the KSK (Kommando Spezialkraefte), which is the German Bundeswehr's special force, are already here to help us in our task and will join the UN force later on."]];
player createDiaryRecord["Diary", ["Situation","These forces were able to push back the local army and also captured or killed most of their leaders. Leaving behind a war-torn country, the NATO forces pulled out because of a questionable mandate. The good news is they left behind gear, FOPs (Forward Observation Posts) and a base of operation we can use."]];
player createDiaryRecord["Diary", ["Situation","Two months ago NATO forces were send here to restore peace, prevent further civilian casualties and unofficially end the dictatorship of the current regime which was upheld by the regional Army since the coup d'etat."]];
player createDiaryRecord["Diary", ["Situation","Welcome ladies and gentleman."]];
player createDiaryRecord["Diary", ["Situation",""]];




if(true) exitWith{};