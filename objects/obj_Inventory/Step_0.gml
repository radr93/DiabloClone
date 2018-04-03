/// @description Visibility and mouse interaction

// Get position
var view_x = camera_get_view_x(obj_Camera.camera);
var view_y = camera_get_view_y(obj_Camera.camera); 
x = view_x+xOffset;
y = view_y+yOffset;

// Open or close the inventory
if (keyboard_check_pressed(input.toggleInventory) and input.free){
	if (showInventory == true){
		showInventory = false;
	}
	else{
		showInventory = true;
	}
}

/// Handle direct mouse interaction when visible
if (showInventory == true){
	// If mouse is within range of the inventory
	if (mouse_x >= x and mouse_x <= (x+width)){
		if (mouse_y >= y and mouse_y <= (y+height)){
			// If you click on the message box
			if (mouse_check_button_pressed(input.leftClick)){
				global.clickingSomething = true; // You're clicking on something
			}
		}
	}
}