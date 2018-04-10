/*

Syntax:
scr_get_HelpFile(outputIndex);

This script currently functions by returning the string at argument0's position in the array.
To properly call this script and get all messages in order, have it run inside of a for loop
like so:

	for (i = 0; i < global.helpFileSize; i++){
		var line = scr_GetHelpFile(i);
	}

The global variable global.helpFileSize (obj_Global create event) must be updated every
time the array in the script changes in size for the script to work correctly.

*/

var output;

output[0] =  "All commands are prefixed with /debug "
output[1] =  "/debug list - show and hide debug list"
output[2] =  "/debug quit - quits the game"
output[3] =  "/debug reset (target) - resets the target"
output[4] =  "--accepted targets:"
output[5] =  "---game - restarts the game"
output[6] =  "---object - destroys the object(s) and"
output[7] =  "---creates a new one @mouse_x,mouse_y"
output[8] =  "/debug create (target) - create the target"
output[9] =  "object at mouse_x and mouse_y"
output[10] = "--accepted targets:"
output[11] = "---object - an object from the resource tree"
output[12] = "/debug rename (new name) - rename the player" 
output[13] = "/debug level (level) - level up the player" 
output[14] = "Remember to exercise care when creating and"
output[15] = "resetting live game objects. Crashes and"
output[16] = "other unexpected behaviour may result."

return(output[argument0])