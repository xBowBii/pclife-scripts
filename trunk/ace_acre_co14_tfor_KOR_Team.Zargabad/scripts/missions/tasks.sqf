// by Bon_Inf*
// executed by initSideMissions.sqf, publicVariableEventHandler "SideObjective"

WaitUntil{not isNull player || isServer};
if(isDedicated) exitWith{};

_location = _this select 0;
_mission = _this select 1;
_statelastmission = _this select 2;


// _marker = [ "ellipse" or "icon" , icon type (defined in CfgMarkers) , [size_x,size_y] , text ];
_marker = ["ELLIPSE","",[250,250],""];



if(not isNil "tfor_currenttask") then {
	if(_statelastmission == "SUCCESS") then {
		tfor_currenttask setTaskState "SUCCEEDED";
		taskhint ["Задача выполнена.\nХорошая работа, ожидайте дальнейших приказов или вернитесь на базу!", [0.6, 0.839, 0.47, 1], "taskDone"];
	};
	if(_statelastmission == "FAIL") then{
		tfor_currenttask setTaskState "FAILED";
		taskhint ["Задача провалена.", [1, 0.2, 0.3, 1], "taskFailed"];
	};

	tfor_waitfornewtask = player createSimpleTask ["Mission"];
	tfor_waitfornewtask setSimpleTaskDescription ["Ожидание следующего задания.","Ожидание следующего задания.",""];
	sleep tfor_missiondelay;
	player removeSimpleTask tfor_waitfornewtask;
};



switch _mission do {

	case "clearlocation" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Вражеские силы собрались в %1. Захватите сектор.",text _location],format["Зачистить %1",text _location],format["Зачистить %1",text _location]];
		taskhint [format["Новое задание:\nЗачистить %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
	};
	case "searchcache" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Найдите %1 место тайника, о котором сообщили местные, и уничтожте его.",text _location],format["Ищите тайник в %1",text _location],format["Тайник в %1",text _location]];
		taskhint [format["Новое задание:\nНайдите и уничтожте тайник в %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_destroy",[1,1]," Найти склад"];
	};
	case "destroyradarscud" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Взорвите ПВО и СКАД расположенные в %1.",text _location],format["Взорвите ПВО и Скад в %1",text _location],format["ПВО и СКАД в %1",text _location]];
		taskhint [format["Новое задание:\nВзорвите ПВО и СКАД в %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_destroy",[1,1]," взорвать СКАД+Радар"];
	};
	case "rescuepilot" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Вертолет был подбит в %1. Найдите и уничтожте обломки UH60, защитите пилота и доставте его на базу.",text _location],format["Вертолет был подбит в %1",text _location],format["Пилоты в %1",text _location]];
		taskhint [format["Новое задание:\nВертолет упал в %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_destroy",[1,1]," Спасти пилотов"];
	};
	case "stopconvoy" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Конвой с двумя тяжелыми танками и грузовиком поддержки выдвинулся по расписанию из %1, по маршруту вдоль городов и укрытий. Найдите и уничтожте его.",text _location],"Уничтожить конвой","Convoy"];
		taskhint [format["Новое задание:\nОстановите конвой вышедший из %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_start",[1,1]," Начало конвоя"];
	};
	case "bringtruck" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Грузовик поддержки ждет на базе. Ваша задача довести его до одиночного форпоста в %1. Задание будет провалено если грузовик будет уничтожен.",text _location],format["Доставить суда %1",text _location],format["Поддержку %1",text _location]];
		taskhint [format["Новое задание:\nДоставте поддержку в %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_end",[1,1]," поддержка"];
	};
	//Перевод далее
	case "defendcamp" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Что-то происходит в %1. Осмотрите местность.",text _location],format["Проверить %1",text _location],format["Проверить %1",text _location]];
		taskhint [format["Новое задание:\nОсмотреть эту зону в %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_unknown",[1,1]," Осмотрется"];
	};
	case "captureofficer" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Захватите командующего войсками в %1 и доставте его на вашу базу. Миссия считается проваленной, если он умрет.",text _location],format["Захватите офицера в %1",text _location],format["Офицер в %1",text _location]];
		taskhint [format["Новое задание:\nЗахватите вражеского офицера в %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
	};
	case "destroyfirebase" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Что-то происходит в %1. Осмотрите местность.",text _location],format["Осмотреть %1",text _location],format["Осмотреть %1",text _location]];
		taskhint [format["Новое задание:\nОсмотреть эту зону в %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_unknown",[1,1]," Осмотрется"];
	};
	case "relievesquad" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Союзный отряд попал в засаду %1 и был атакован вражескими войсками. Как можно быстрее поддержите их огнем.",text _location],format["Защитить отряд в %1",text _location],format["Отряд в %1",text _location]];
		taskhint [format["Новое задание:\nПомогите зажатому отряду в %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_dot",[1,1]," Помочь отряду"];
	};
	case "markfueldump" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Топливный склад врага мыл обнаружен в %1. Ваша задача отметить его спомощью %2 или чем-то ещё для артилерии.",text _location,getText (configFile >> "CfgMagazines" >> tfor_markfueldump_markerobjects select 0 >> "displayname")],format["Пометить топливный склад в %1",text _location],format["топливный склад в %1",text _location]];
		taskhint [format["Новое задание:\nПометить топливный склад в %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_destroy",[1,1]," Метку на бак"];
	};
	case "airattack" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Что-то происходит в %1. Осмотреть эту зону.",text _location],format["Разведать %1",text _location],format["Разведать %1",text _location]];
		taskhint [format["Новое задание:\nОсмотреть эту зону в %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_unknown",[1,1]," Разведать"];
	};
	case "tankattack" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Что-то происходит в %1. Осмотреть эту зону.",text _location],format["Осмотрется в %1",text _location],format["Осмотрется в %1",text _location]];
		taskhint [format["Новое задание:\nЧто-то происходит в %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
		_marker = ["ICON","hd_unknown",[1,1]," Проверить"];
	};
	case "destroycamps" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Вражеские силы заняли %1, осмотреть обноруженные вражеские лагеря. Ваша задача атаковать и зачистить врагов вокруг лагерей %1, при подавлении %2ern должны оказатся тут %1.",text _location,tfor_enemy_side],format["Уничтожить лагеря в %1",text _location],format["лагеря в %1",text _location]];
		taskhint [format["Новое задание:\nУничтожить военные лагеря в %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
	};
	case "supporttroops" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Основные силы врага собрались в %1. Ваша задача объединиться с Regimental Combat Team (проверте точку на карте). Задание будет провалено если вы не сможете выдержать атаки врага.",text _location],format["Атака %1",text _location],format["Атака %1",text _location]];
		taskhint [format["Новое задание:\nАтаковать %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
	};
	case "insurgency" : {
		tfor_currenttask = player createSimpleTask ["Mission"];
		tfor_currenttask setSimpleTaskDescription [format["Местные расказали нам о складе оружия возле %1. Но есть сомнения, что сведения верны. Нам придется направится в %1 и скать врагов по следам.",text _location],format["Cache search in %1",text _location],format["Мятежники",text _location]];
		taskhint [format["Новое задание:\nНайдите тайник в %1", text _location], [0.87451, 0.84314, 0.64706, 1], "taskNew"];
	};
};



if(not isNil "tfor_missionmarker") then {deleteMarker tfor_missionmarker};
tfor_missionmarker = createMarkerLocal ["currentSide",position _location];
tfor_missionmarker setMarkerShape (_marker select 0);
tfor_missionmarker setMarkerType (_marker select 1);
tfor_missionmarker setMarkerSize (_marker select 2);
tfor_missionmarker setMarkerText (_marker select 3);
tfor_missionmarker setMarkerColor "ColorRed";


tfor_currenttask setSimpleTaskDestination [(position _location) select 0,(position _location) select 1,0];
player setCurrentTask tfor_currenttask;