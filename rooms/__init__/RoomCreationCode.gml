/// Randomize Game
show_debug_message("\n\n### Game Start - Diablo Clone v1.0.11 - ##########");
show_debug_message("__init__ launch");
randomize();
show_debug_message("Randomized Game Seed");

/// Set Cursor
window_set_cursor(cr_none);
cursor_sprite = spr_Cursor;
show_debug_message("Changed Cursor\n\nNow launching controllers and databases:\n");

/// Launch Controller objects
show_debug_message("Launching obj_Global...");
instance_create_layer(x, y, "Controllers", obj_Global);		// Launches all global variables in game
show_debug_message("Launched obj_Global\n\nLaunching input...");
instance_create_layer(x, y, "Controllers", input);			// Detects user input
show_debug_message("Launched input\n\nLaunching obj_Enums...");
instance_create_layer(x, y, "Controllers", obj_Enums);		// Launches all enums used in game
show_debug_message("Launched obj_Enums\n\nLaunching obj_ItemDatabase...");

// External Databases
instance_create_layer(x, y, "Controllers", obj_ItemDatabase); // Launches item database
show_debug_message("Launched obj_ItemDatabase\n\nLaunching obj_TreasureClassDatabase...");
instance_create_layer(x, y, "Controllers", obj_TreasureClassDatabase); // Launches treasure class database
show_debug_message("Launched obj_TreasureClassDatabase");

// Go to splash screen and main menu after init complete
show_debug_message("\n__init__ complete, moving on to Splash Screen\n");
room_goto(rm_SplashScreen);