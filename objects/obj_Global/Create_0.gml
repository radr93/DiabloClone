/// @description Initialize Game

// Change Cursor
window_set_cursor(cr_none);
cursor_sprite = spr_Cursor;

// Initialize Local Variables
debugOpen = false;

// Initialize Global Variables
global.clickingSomething = false;	// Used to tell if you're clicking something such as a menu or wall

// Launch Controller objects
instance_create_layer(x, y, "Controllers", input);			// Input Controller
instance_create_layer(x, y, "Controllers", obj_Enums);		// Enumerator Controller
instance_create_layer(x, y, "Instances", obj_Inventory);	// Inventory

// Go to main menu after init complete
room_goto(room0);