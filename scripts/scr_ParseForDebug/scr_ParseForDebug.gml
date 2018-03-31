/// Parse user input for debug keywords scr_ParseForDebug(textToParse)

// Initialize Variables
var textToParse = argument0;
var debug = "/debug";
var create = "create";
var list = "list";
var reset = "reset";
var quit = "quit";

// Remove "/debug " from string
	textToParse = string_delete(textToParse, 1, string_length(debug)+1);
	// Search for valid command
	// Create command
	if (string_pos(create, textToParse) == 1){
		// Remove "create " from string
		textToParse = string_delete(textToParse, 1, string_length(create)+1);
		// Attempt to create object
		if (asset_get_type(textToParse) == asset_object){
			// Create object specified at mouse
			var object = asset_get_index(textToParse);
			instance_create_layer(mouse_x, mouse_y, "Instances", object);
			return("Successfully created " + textToParse + ".");
		}
		else{
			// Failed to create object
			return("Create object failed! Invalid Object.")
		}
	}
	// Debug List command
	else if (string_pos(list, textToParse) == 1){
		var g = obj_Global;
		if (g.debugOpen = false){
			g.debugOpen = true;
			return("Showing Debug List");
		}
		else{
			g.debugOpen = false;
			return("Hiding Debug List");
		}
	}
	// Reset Commands
	else if (string_pos(reset, textToParse) == 1){
		textToParse = string_delete(textToParse, 1, string_length(reset)+1);
		var resetGame = "game"; // Restart game
		var resetConsole = "console"; // Restart Console
		if (string_pos(resetGame, textToParse) == 1){
			game_restart();
			return("Restarting game.")
		}
		else if (string_pos(resetConsole, textToParse) == 1){
			instance_destroy(obj_MessageBox);
			if (instance_exists(obj_Console)){
				instance_destroy(obj_Console);
			}
			instance_create_layer(x, y, "Instances", obj_MessageBox);
			return("Restarting console.")
		}
		else{
			return("Invalid command.")	
		}
	}
	// Quit Game Command
	else if (string_pos(reset, textToParse) == 1){
		game_end();
		return("Quitting game.")
	}
	else{
		// Invalid Command
		return("Debug failed! Invalid Command.")
	}