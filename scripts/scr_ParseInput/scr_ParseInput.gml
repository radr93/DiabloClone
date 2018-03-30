/// Parse user input for keywords

var userInput = argument0;

var debug = "/debug";
var create = " create";

// if /debug was the first word in the string
if (string_pos(debug, userInput) == 1){
	// search for object reference in string
	if (string_pos("obj_", userInput) == 8){
		var objectStringLength = string_pos(".", userInput);
		var objectString = string_copy(userInput, 8, (objectStringLength-8));
		var objectVariableString = string_copy(userInput, objectStringLength+1, 4)
		object = asset_get_index(objectString);
		if ((object) > -1){
			instance_create_layer(mouse_x, mouse_y, "Instances", object);
			return("Console debug activated. \nCreated object: " + objectString);
		}
		else{
			return("Error, unknown command!")
		}
	}
}
else{
	return(userInput)
}