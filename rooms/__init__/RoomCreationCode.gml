/// Randomize Game
randomize();

/// Set Cursor
window_set_cursor(cr_none);
cursor_sprite = spr_Cursor;

/// Launch Controller objects
instance_create_layer(x, y, "Controllers", obj_Global);		// Launches all global variables in game
instance_create_layer(x, y, "Controllers", input);			// Detects user input
instance_create_layer(x, y, "Controllers", obj_Enums);		// Launches all enums used in game

// External Databases
instance_create_layer(x, y, "Controllers", obj_ItemDatabase); // Launches item database
instance_create_layer(x, y, "Controllers", obj_TreasureClassDatabase); // Launches treasure class database
// Go to splash screen and main menu after init complete
room_goto(rm_SplashScreen);