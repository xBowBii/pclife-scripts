T9 = player createSimpleTask["Extraction"];
T9 setSimpleTaskDescription["Time for Extraction Team Viper.", "Extraction", "Extraction"];
T9 setSimpleTaskDestination (getMarkerPos "EZ");
if (nine) then {
	T9  setTaskState "Succeeded";
} else {
	T9  setTaskState "Created";
	T9  setSimpleTaskDestination (getMarkerPos "EZ");


};

T8 = player createSimpleTask["Hiroshima"];
T8 setSimpleTaskDescription["Artillery CDF Army (find ,hack and use Artillery Coms Bravo)", "Hiroshima", "Hiroshima"];
T8 setSimpleTaskDestination (getMarkerPos "arty2");
if (eight) then {
	T8  setTaskState "Succeeded";
} else {
	T8  setTaskState "Created";
	T8  setSimpleTaskDestination (getMarkerPos "arty2");

};


T7 = player createSimpleTask["Assassinate CDF Major"];
T7 setSimpleTaskDescription["Assassinate the CDF Major.", "Assassinate CDF Major", "Assassinate CDF Major"];
T7 setSimpleTaskDestination (getMarkerPos "ass");
if (seven) then {
	T7  setTaskState "Succeeded";
} else {
	T7  setTaskState "Created";
	T7  setSimpleTaskDestination (getMarkerPos "ass");
};

T6 = player createSimpleTask["Destroy CDF Coms Station"];
T6 setSimpleTaskDescription["Destroy CDF Coms station (reported Taliban communications).", "Destroy Coms Station", "Destroy Coms Station"];
T6 setSimpleTaskDestination (getMarkerPos "coms");
if (six) then {
	T6  setTaskState "Succeeded";
} else {
	T6  setTaskState "Created";
	T6  setSimpleTaskDestination (getMarkerPos "coms");

};

T5 = player createSimpleTask["Destroy CDF HQ"];
T5 setSimpleTaskDescription["Destroy CDF HQ.", "Destroy HQ", "Destroy HQ"];
T5 setSimpleTaskDestination (getMarkerPos "hq");
if (five) then {
	T5  setTaskState "Succeeded";
} else {
	T5  setTaskState "Created";
	T5  setSimpleTaskDestination (getMarkerPos "hq");

};

T4 = player createSimpleTask["Destroy CDF Artillery Battery"];
T4 setSimpleTaskDescription["Destroy CDF Artillery Battery(use nearby Artillery Coms Alpha).", "Destroy Artillery Battery", "Destroy Artillery Battery"];
T4 setSimpleTaskDestination (getMarkerPos "arty");
if (four) then {
	T4  setTaskState "Succeeded";
} else {
	T4  setTaskState "Created";
	T4  setSimpleTaskDestination (getMarkerPos "arty");

};


T3 = player createSimpleTask["Destroy AA Vehicle"];
T3 setSimpleTaskDescription["Destroy AA Vehicle", "Destroy AA Vehicle", "Destroy AA Vehicle"];
T3 setSimpleTaskDestination (getMarkerPos "AA");
if (three) then {
	T3  setTaskState "Succeeded";
} else {
	T3  setTaskState "Created";
	T3  setSimpleTaskDestination (getMarkerPos "AA");

};

T2 = player createSimpleTask["Destroy Train Bridge"];
T2 setSimpleTaskDescription["Destroy Train Bridge(eliminate CDF weapons supply route)", "Destroy Train Bridge", "Destroy Train Bridge"];
T2 setSimpleTaskDestination (getMarkerPos "bridge");
if (two) then {
	T2  setTaskState "Succeeded";
} else {
	T2  setTaskState "Created";
	T2  setSimpleTaskDestination (getMarkerPos "bridge");

};

T1 = player createSimpleTask["Ambush CDF Colonel"];
T1 setSimpleTaskDescription["Ambush And Eliminate CDF Colonel", "Ambush CDF Colonel", "Ambush CDF Colonel"];
T1 setSimpleTaskDestination (getMarkerPos "President");
if (one) then {
	T1  setTaskState "Succeeded";
} else {
	T1  setTaskState "Created";
	T1  setSimpleTaskDestination (getMarkerPos "President");
player setCurrentTask T1;

};





// ------ Misc -------
player createDiaryRecord["Diary", ["Miscellaneous",
	"Operation Viper created by B|oodThorn.
	"]
];
player createDiaryRecord["Diary", ["Miscellaneous",
	"Operation Viper tested by B|oodThorn and Mongoose.
	"]

];
player createDiaryRecord["Diary", ["Miscellaneous",""]];




// --------- Mission briefing ----------
player createDiaryRecord["Diary", ["Mission Tasks","9. Make your way to the extraction point and get Team Viper home safely"]];
player createDiaryRecord["Diary", ["Mission Tasks","8. Mission Hiroshima,find and hack into Artillery Coms Bravo and eliminate main CDF Army with their own artillery."]];
player createDiaryRecord["Diary", ["Mission Tasks","7. CDF Major has control of the CDF army...he must be assassinated."]];
player createDiaryRecord["Diary", ["Mission Tasks","6. A Taliban link up Coms Station has been located and must be destroyed."]];
player createDiaryRecord["Diary", ["Mission Tasks","5. CDF HQ has been located,all communications must be destroyed."]];
player createDiaryRecord["Diary", ["Mission Tasks","4. Satellite images show a Artillery Battery nearby,Team Vipers objective is to find Artillery Coms Alpha and initiate fire mission on target."]];
player createDiaryRecord["Diary", ["Mission Tasks","3. CDF forces have gained access to a AA vehicle,Team Viper must destroy the target."]];
player createDiaryRecord["Diary", ["Mission Tasks","2. Destroy Train Bridge (CDF weapons supply route)."]];
player createDiaryRecord["Diary", ["Mission Tasks","1. Ambush the CDF convoy and eliminate the CDF Colonel."]];






// 															
player createDiaryRecord["Diary", ["Briefing",
         "Weapon loadouts should include satchel charges
	"]
];

player createDiaryRecord["Diary", ["Briefing",
        "Choose weapon loadout wisely,resupply points and Artillery assistance indicated on map.
	"]
];

player createDiaryRecord["Diary", ["Briefing",
         "The once peaceful CDF Forces have been rumoured to be in contact with Al-Qaeda and the Taliban.


                              <img image='tali1.jpg' width='384' height='240'/>.


             Our Russian spys have intercepted and gained intelligence via satellite images of a mass army with weapons of mass destruction being developed.


                                                                               <img image='sat.jpg' width='384' height='240'/>


                The most concerning factor is information of civilians being torchered and killed ....this is where your team come in to the field of play.Team Viper needs to penetrate enemy lines and bring down the CDF infrastructure with predefined missions that you will be informed of.


                                                                                                             


                      Those sick bastards need to be stopped.....Good luck Team Viper and stay safe!!
	"]

];



if(true) exitWith{};

