// by Bon_Inf*
// executed by initPlayer.sqf

if(not local player) exitWith{};

// ------ Credits -------
player createDiaryRecord["Diary", ["Описание","Далее описание для тех, кто любит эту миссию. Спасибо за игру."]];
player createDiaryRecord["Diary", ["Описание",""]];
player createDiaryRecord["Diary", ["Описание","Я ценю обратную связь и предложения. http://dev-heaven.net/projects/takistan-force."]];
player createDiaryRecord["Diary", ["Описание","В случае, если вы редактируете эту миссию, пожалуйста, не изменяйте имя автора и номер версии."]];
player createDiaryRecord["Diary", ["Описание","Брифинг Миссий от Kharrn, перевод Kol9yN www.fh-warzone.de."]];
player createDiaryRecord["Diary", ["Описание","Скрипты и разработка от Bon_Inf*, www.fh-warzone.net"]];
player createDiaryRecord["Diary", ["Описание","Перевод на Русский и фичи от Operator и Kol9yN, www.free-lance.ru/users/koldyn"]];
player createDiaryRecord["Diary", ["Описание",""]];

// --------- Разное ----------
if(tfor_mhqrespawn == 0) then{player createDiaryRecord["Diary", ["Разное","Штаб не возрождается повторно !!!"]]};
player createDiaryRecord["Diary", ["Разное","Колесная техника и вертолеты восстанавливаются очень долго, берегите их!"]];
player createDiaryRecord["Diary", ["Разное","Техника может быть отремонтированаа на тех сервисах <marker name='VehicleService'>тут</marker> и <marker name='VehicleService_1'>тут</marker>."]];
player createDiaryRecord["Diary", ["Разное","Если оставить технику более чем на 60 минут, то она вернется на базу. В случае, если автомобиль становится неподвижным, он взорвется через 10 минут, если его не отремонтировать."]];
player createDiaryRecord["Diary", ["Разное","Нажмите Т для изменения дальности обзора."]];
player createDiaryRecord["Diary", ["Разное",""]];

// ----------- Skills ------------
player createDiaryRecord["Diary", ["Способности","- Чинук может переносить малую технику."]];
player createDiaryRecord["Diary", ["Способности","- В грузовики поддержки можно загружать коробки с боеприпасами со склада."]];
player createDiaryRecord["Diary", ["Способности","- Только пилоты могут управлять воздушной техникой."]];
player createDiaryRecord["Diary", ["Способности","- Только Техники-механики могут использовать наземную технику."]];
player createDiaryRecord["Diary", ["Способности",""]];

// --------- Assets ----------
player createDiaryRecord["Diary", ["Имущество","Грузовики поддержки расположены по соответствующим секциям<marker name='support'>тут</marker>."]];
player createDiaryRecord["Diary", ["Имущество","Боевая техника <marker name='plane'>тут</marker>."]];
player createDiaryRecord["Diary", ["Имущество","Транспортные вертолеты <marker name='heli'>тут</marker>."]];
player createDiaryRecord["Diary", ["Имущество","Броня и танк <marker name='armor'>тут</marker>."]];
player createDiaryRecord["Diary", ["Имущество","Хомяки <marker name='cars'>тут</marker>."]];
player createDiaryRecord["Diary", ["Имущество",""]];

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


if(true) exitWith{};