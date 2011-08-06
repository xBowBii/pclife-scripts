

/*
	Serverside configs for switching players in your game between channels during briefing vs while in game
	This allows for dynamic TVT breifings without having to manually move peoples channels

*/
class TVT_ChannelSwitch {
	
	mode = 0;

	class gameChannel {
		id = 24;
		password = "";
		
		joinDelay = 1;
	};
	class bluChannel {
		id = 25;
		password = "";
		
		joinDelay = 1;
	};
	class redChannel {
		id = 27;
		password = "";
		
		joinDelay = 1;
	};
	class civChannel {
		id = 28;
		password = "";
		
		joinDelay = 1;
	};
	class indChannel {
		id = 29;
		password = "";
		
		joinDelay = 1;
	};
};
 
