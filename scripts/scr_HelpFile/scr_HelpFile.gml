// Help File

var output;

output[0] =  "All commands are prefixed with /debug "
output[1] =  "/debug list - show/hide debug list"
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
output[12] = "Remember to exercise care when creating and"
output[13] = "resetting live game objects. Crashes and"
output[14] = "other unexpected behaviour may result."

return(output[argument0])