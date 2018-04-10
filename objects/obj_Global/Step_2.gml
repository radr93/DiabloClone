/// @description Create Mouse Click (player movement)

// As long as you're not in a set-up or title room
if (global.launchUI == true){
	// If you click somewhere
	if (mouse_check_button(input.leftClick)){
		// If you're not already clicking something and aren't holding shift
		if (global.clickingSomething == false and !keyboard_check(input.shift)){
			// If you've already created a Mouse Click
			if (instance_exists(obj_MouseClick)){
				// Get rid of that one
				instance_destroy(obj_MouseClick);
			}
			// And create a new one
			instance_create_layer(mouse_x, mouse_y, "Instances", obj_MouseClick);
		}
	}
}