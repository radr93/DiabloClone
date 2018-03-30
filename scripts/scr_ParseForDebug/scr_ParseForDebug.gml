/// Parse user input for debug keywords scr_ParseForDebug(textToParse)

// Initialize Variables
var textToParse = argument0;
var debug = "/debug";
var create = "create";
var list = "list";

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
	// List command
	if (string_pos(list, textToParse) == 1){
		var g = obj_Global;
		if (g.debugOpen = false){
			g.debugOpen = true;
			return("Showing Debug List");
		}
		else{
			debugOpen = false;
			return("Hiding Debug List");
		}
	}
	else{
		// Invalid Command
		return("Debug failed! Invalid Command.")
	}