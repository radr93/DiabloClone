/*

Syntax:
scr_GetDebugCommand(string);

string	The string to check for a debug command

This script should only be called when the string provided is known to start with /debug.
From there, it parses the rest of the text in the string for key words, and if these key 
words were commands, it behaves accordingly.

*/

var textToParse = argument0;
var debug = "/debug";

// Valid commands
var create, list, reset, quit, rename;

create = "create";	// create an object at mouse_x and mouse_y
list = "list";		// show/hide the debug list
reset = "reset";	// reset the game or specific object
quit = "quit";		// quit the game
rename = "rename";	// rename the player


// Remove "/debug " from textToParse and search for a valid command
textToParse = string_delete(textToParse, 1, string_length(debug)+1);

// Create command
if (string_pos(create, textToParse) == 1){
	// Remove "create " from textToParse
	textToParse = string_delete(textToParse, 1, string_length(create)+1);
	// Verify that the remainder of textToParse is a valid object
	if (asset_get_type(textToParse) == asset_object){
		// Create the object specified at mouse
		var object = asset_get_index(textToParse);
		instance_create_layer(mouse_x, mouse_y, "Instances", object);
		return("Successfully created " + textToParse + ".");
	}
	// Invalid object specified
	else{
		return("Create object failed! Invalid object.")
	}
}

// Debug List command
else if (string_pos(list, textToParse) == 1){
	// Show and hide the debug list
	if (obj_Global.debugOpen = false){
		obj_Global.debugOpen = true;
		return("Showing Debug List.");
	}
	else{
		obj_Global.debugOpen = false;
		return("Hiding Debug List.");
	}
}

// Reset commands
else if (string_pos(reset, textToParse) == 1){
	// Remove "reset " from textToParse
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
		return("Reset failed! Invalid reset target.")	
	}
}

// Quit Game Command
else if (string_pos(reset, textToParse) == 1){
	game_end();
	return("Quitting game.")
}

// Rename Character Command
else if (string_pos(rename, textToParse) == 1){
	// Remove "rename " from textToParse
	textToParse = string_delete(textToParse, 1, string_length(rename)+1);
	// Rename the player
	obj_PlayerParent.name = textToParse;
	return("Renamed player to "+textToParse+".")
}

// Invalid Command
else{
	return("Debug failed! Invalid Command.")
}