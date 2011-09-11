switch (_this select 0) do 	{
	//Hostage Died
	case 0 : {
		[west, "HQ"] sidechat "Hostage died. Exfiltrate and end the mission.";
		tskT setTaskState "Failed";
		tskONE = player createSimpleTask ["Exfiltrate"];
		tskONE setSimpleTaskDescription ["You failed. Now extract to save at least your own butts. Reach the <br/><br/><marker name='markerEnd'>exfiltration zone</marker>.", "Extract", "Extract"];
		tskONE setSimpleTaskDestination (getMarkerPos "markerEnd");
	};

	//Hostage Extracted
	case 1 : {
		[west, "HQ"] sidechat "Good job. Hostage secured.";
		tskT setTaskState "Succeeded";
		sleep 5;
		titletext [" ", "Black in", 1];
		1.5;
		endmission "END1";
	};

	//Team Died
	case 2 : {
		sleep 2;
		titletext ["Your entire team was wiped out.", "Black in", 1];
		1.5;
		endmission "END2";
	};
	
	//Team Extracted after Hostage Died
	case 3 : {
		[west, "HQ"] sidechat "Well, at least you made it out.";
		tskONE setTaskState "Succeeded";
		sleep 5;
		titletext [" ", "Black in", 1];
		1.5;
		endmission "END3";
	};
};