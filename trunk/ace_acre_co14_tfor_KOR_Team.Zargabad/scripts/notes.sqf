// by Bon_Inf*
// executed by initPlayer.sqf

if(not local player) exitWith{};

// ------ Credits -------
player createDiaryRecord["Diary", ["Credits","Далее описание для тех, кто любит эту миссию. Спасибо за игру."]];
player createDiaryRecord["Diary", ["Credits",""]];
//player createDiaryRecord["Diary", ["Credits","Использованны сторонние скрипты (частично отредактированны): -"]];
player createDiaryRecord["Diary", ["Credits","Я ценю обратную связь и предложения. http://dev-heaven.net/projects/takistan-force."]];
player createDiaryRecord["Diary", ["Credits","В случае, если вы редактируете эту миссию, пожалуйста, не изменяйте имя автора и номер версии."]];
player createDiaryRecord["Diary", ["Credits","Брифинг Миссий от Kharrn, перевод Kol9yN www.fh-warzone.de."]];
player createDiaryRecord["Diary", ["Credits","Скрипты и разработка от Bon_Inf*, www.fh-warzone.net"]];
player createDiaryRecord["Diary", ["Credits","Перевод на Русский и фичи от Operator и Kol9yN, www.free-lance.ru/users/koldyn"]];
player createDiaryRecord["Diary", ["Credits",""]];

// --------- Misc ----------
if(tfor_mhqrespawn == 0) then{player createDiaryRecord["Diary", ["Misc","Штаб не возрождается повторно !!!"]]};
player createDiaryRecord["Diary", ["Misc","Колесная техника и вертолеты восстанавливаются очень долго, берегите их!"]];
player createDiaryRecord["Diary", ["Misc","Техника может быть отремонтированаа на тех сервисах <marker name='VehicleService'>тут</marker> и <marker name='VehicleService_1'>тут</marker>."]];
player createDiaryRecord["Diary", ["Misc","Если оставить технику более чем на 60 минут, то она вернется на базу. В случае, если автомобиль становится неподвижным, он взорвется через 10 минут, если его не отремонтировать."]];
player createDiaryRecord["Diary", ["Misc","Нажмите Т для изменения дальности обзора."]];
player createDiaryRecord["Diary", ["Misc",""]];

// ----------- Skills ------------
player createDiaryRecord["Diary", ["Skills","- Чинук может переносить малую технику."]];
player createDiaryRecord["Diary", ["Skills","- В грузовики поддержки можно загружать коробки с боеприпасами со склада."]];
player createDiaryRecord["Diary", ["Skills","- Только пилоты могут управлять воздушной техникой."]];
player createDiaryRecord["Diary", ["Skills","- Только Техники-механики могут использовать наземную технику."]];
player createDiaryRecord["Diary", ["Skills",""]];

// --------- Assets ----------
player createDiaryRecord["Diary", ["Assets","Грузовики поддержки <marker name='support'>тут</marker>."]];
player createDiaryRecord["Diary", ["Assets","Боевая техника <marker name='plane'>тут</marker>."]];
player createDiaryRecord["Diary", ["Assets","Транспортные вертолеты <marker name='heli'>тут</marker>."]];
player createDiaryRecord["Diary", ["Assets","Броня и танк <marker name='armor'>тут</marker>."]];
player createDiaryRecord["Diary", ["Assets","Хомяки <marker name='cars'>тут</marker>."]];
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