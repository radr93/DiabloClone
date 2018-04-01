/// @description Initialize Game

// Set Cursor
window_set_cursor(cr_none);
cursor_sprite = spr_Cursor;

// Initialize Local Variables
debugOpen = false; // list opened via console command (/debug list) of the states of variables defined in Draw GUI
	
// Initialize Global Variables

// Date/Time
date_set_timezone(timezone_local);
global.hour = current_hour;
global.minute = current_minute;
global.ampm = ""

// Default Fonts and alignment
draw_set_valign(fa_top);
draw_set_halign(fa_left);
global.messageFont = font_Calibri;

// Display Settings
global.monitorWidth = window_get_width();
global.monitorHeight = window_get_height();
	
// GUI
global.guiMouseX = device_mouse_x_to_gui(0);
global.guiMouseY = device_mouse_y_to_gui(0);
	
// Help
global.helpFileSize = 15;

// In-Game
global.clickingSomething = false;	// Used to tell if you're clicking something such as a menu or wall

// Launch Controller objects
instance_create_layer(x, y, "Controllers", input);			// Detects user input
instance_create_layer(x, y, "Controllers", obj_Enums);		// Launches all enums used in game
instance_create_layer(x, y, "Controllers", obj_Inventory);	// Initializes Inventory


// Go to main menu after init complete
room_goto(room0);