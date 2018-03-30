/// @description Initialize Game

// Set Cursor
	window_set_cursor(cr_none);
	cursor_sprite = spr_Cursor;

// Initialize Local Variables
	debugOpen = false;
	consoleStringPrevious = "";
	
// Date/Time
date_set_timezone(timezone_local);
global.hour = current_hour;
global.minute = current_minute;
global.ampm = ""

// Initialize Global Variables

	// In-Game
	global.clickingSomething = false;	// Used to tell if you're clicking something such as a menu or wall
	
	// Fonts 
	global.messageFont = font_Calibri;

	//Window
	global.defaultWindowWidth = 1024;
	global.defaultWindowHeight = 576;
	global.currentWindowWidth = 1024;
	global.currentWindowHeight = 576;
	global.windowWidthScale = 1;
	global.windowHeightScale = 1;

// Launch Controller objects
	instance_create_layer(x, y, "Controllers", input);			// Detects user input
	instance_create_layer(x, y, "Controllers", obj_Enums);		// Launches all enums used in game
	instance_create_layer(x, y, "Instances", obj_Inventory);	// Initializes Inventory


// Go to main menu after init complete
room_goto(room0);