/// @description Initialize Game

// Set Cursor
window_set_cursor(cr_none);
cursor_sprite = spr_Cursor;

// Initialize Local Variables
debugOpen = false;
consoleStringPrevious = "";

// Initialize Global Variables
global.clickingSomething = false;	// Used to tell if you're clicking something such as a menu or wall

// Launch Controller objects
instance_create_layer(x, y, "Controllers", input);			// Detects user input
instance_create_layer(x, y, "Controllers", obj_Enums);		// Launches all enums used in game
instance_create_layer(x, y, "Instances", obj_Inventory);	// Initializes Inventory

// Go to main menu after init complete
room_goto(room0);