/// @description Create Mouse Click player movement

// If you're not already clicking something
if (global.clickingSomething == false){
	// If you've already created a Mouse Click
	if (instance_exists(obj_MouseClick)){
		// Get rid of that one
		instance_destroy(obj_MouseClick);
	}
	// And create a new one
	instance_create_layer(mouse_x, mouse_y, "Instances", obj_MouseClick);
}