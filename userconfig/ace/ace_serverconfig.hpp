
/*//////////////////////////////////////////////
//       ___       ______   ______     ___    //
//      /   |     / ____/  / ____/    |__ \   //
//     / /| |    / /      / __/       __/ /   //
//    / ___ |   / /___   / /___      / __/    //
//   /_/  |_|   \____/  /_____/     /____/    //
//                                            //
//                                            //
////////////////////////////////////////////////
//                                            //
//             SERVER CONFIG FILE             //
//                                            //
//////////////////////////////////////////////*/
/*//////////////////////////////////////////////
//      Save in UTF 8 / without BOM  Π         //
///////////////////////////////////////////////*/

class ace_server_settings {
	// ** These are dedicated server settings. They do not affect singleplayer and hosted games.
	// ** NOTE: pbo names don't always match config names of addons (as seen in cfgPatches).
	//	    Following settings need cfgPatches names to be used.
	// ** NOTE: Avoid creating too long lists, as this will cause an error

	// check if certain pbo's are missing on client and prevent client from playing if so
	check_pbos = 1;

	// verify that all relevant pbos shipped with ace are running on client
	check_all_ace_pbos = 1;

	//pbos to check. if check all ace pbos enabled, following pbos are added to the checklist, if not, only these pbos are checked
	//example: checklist[] = { "ace_sys_stamina", "ace_anims_turn" };
	checklist[] = {};

	//if all ace pbos check is enabled, exclude following files from check
	exclude_pbos[] = {};
};

// Uncomment and set to the level of version checking you prefer. -1 means all pieces. 0 means disabled. 1 means only major. 2 means major and minor... etc.
// #define VERSIONING_LEVEL -1

ACE_SERVERCONFIG_VER = 2; //DO NOT EDIT
