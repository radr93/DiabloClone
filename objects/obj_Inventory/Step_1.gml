/// @description Check if inventory is clicked on

// If the inventory is open
if (showInventory == true){
	// Inventory Clicked on flag
	if (mouse_x >= x and mouse_x <= (x+width)){
		if (mouse_y >= y and mouse_y <= (y+height)){
			if (mouse_check_button_pressed(input.leftClick)){
				global.clickingSomething = true;
			}
		}
	}
}