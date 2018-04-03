/// Parse user input for debug keywords scr_GetDebugCommand(textToParse)

// Initialize Variables
var textToParse = argument0;
var debug = "/debug";
var create = "create";
var list = "list";
var reset = "reset";
var quit = "quit";
var rename = "rename";

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
	var resetGame = "game";
	var resetConsole = "console";
	
	// Restart game
	if (string_pos(resetGame, textToParse) == 1){
		game_restart();
		return("Restarting game.")
	}
	
	// Restart Console
	else if (string_pos(resetConsole, textToParse) == 1){
		instance_destroy(obj_MessageBox);
		if (instance_exists(obj_Console)){
			instance_destroy(obj_Console);
		}
		instance_create_layer(x, y, "Instances", obj_MessageBox);
		return("Restarting console.")
	}
	
	// Invalid Command
	else{
		return("Invalid command.")	
	}
}

// Quit Game Command
else if (string_pos(reset, textToParse) == 1){
	game_end();
	return("Quitting game.")
}

// Rename Character Command
else if (string_pos(rename, textToParse) == 1){
	textToParse = string_delete(textToParse, 1, string_length(rename)+1);
	obj_Player.name = textToParse;
	return("Renamed player to "+textToParse+".")
}

// Invalid Command
else{
	return("Debug failed! Invalid Command.")
}