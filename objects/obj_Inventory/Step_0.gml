/// @description Visibility and mouse interaction

// Update position of inventory and grid
var view_x = camera_get_view_x(obj_Camera.camera);
var view_y = camera_get_view_y(obj_Camera.camera); 
x = view_x+xOffset;
y = view_y+yOffset;
gridX = view_x+(xOffset+gridXoffset);
gridY = view_y+(yOffset+gridYoffset);

// Open or close the inventory
if (keyboard_check_pressed(input.toggleInventory) and input.free){
	if (showInventory == true) then showInventory = false; else showInventory = true;
}


if (showInventory == true){

	/// Check if the inventory is being clicked on
	if (mouse_x >= x and mouse_x <= (x+width)){
		if (mouse_y >= y and mouse_y <= (y+height)){
			if (mouse_check_button_pressed(input.leftClick)){
				global.clickingSomething = true;
			}
		}
	}
	
	/// Handle Grid Interaction
	
	// Check if inside the inventory grid
	if (mouse_x >= gridX and mouse_x <= (gridX+(cellWidth*columns))){
		if (mouse_y >= gridY and mouse_y <= (gridY+(cellHeight*rows))){;
			
			// Get coordinates within grid
			var column = floor((mouse_x - gridX)/32);
			var row = floor((mouse_y - gridY)/32);
			var slot = (((row+1)*columns)-((columns-1)-column))-1;
			var spaceID = ds_grid_get(grid, column, row);
			
			// If you click
			if (mouse_check_button_pressed(input.leftClick)){
				var spaceX = ds_grid_value_x(grid, 0, 0, columns-1, rows-1, spaceID); // where is the left of the object?
				var spaceY = ds_grid_value_y(grid, 0, 0, columns-1, rows-1, spaceID); // where is the top of the object?
				var topLeftCell = (((spaceY+1)*columns)-((columns-1)-spaceX))-1; // which cell the top left of the object is in
				var item; // copy slot properties to temporary array and empty the inventory slot
				for (p = 0; p < property.MAX; p++){
					item[p] = inventory[topLeftCell, p];
				}
				// If space you clicked isn't empty
				if (spaceID != -1){
					// Empty it					
					var itemWidth = sprite_get_width(inventory[topLeftCell, property.width])-1;
					var itemHeight = sprite_get_height(inventory[topLeftCell, property.height])-1;
					show_debug_message("\n\nspaceX = " + string(spaceX) + "\nspaceY = " + string(spaceY) + " topLeftCell = " + string(topLeftCell));
					ds_grid_set_region(grid, column, row, column+itemWidth, row+itemHeight, -1);
					for (p = 0; p < property.MAX; p++){
						inventory[topLeftCell, p] = -1;
					}
				}
				
				// If you were holding something, fill the slot with what you were holding
				if (itemHeld[property.item] != -1){
					// Get item dimensions
					var itemWidth = (itemHeld[property.width]-1);
					var itemHeight = (itemHeld[property.height]-1);
					// If the item is only 1x1
					if (itemWidth == 0 and itemHeight == 0){
						for (p = 0; p < property.MAX; p++){
							inventory[slot, p] = itemHeld[p];
						}
						IDindex ++; // gives the item its own unique space ID
						ds_grid_set(grid, column, row, IDindex)
					}
					// If item is more than 1x1
					if (itemWidth > 0 or itemHeight > 0){
						// CHECK FOR ADJACENT
						// SPACES CODE
						var itemWidth = itemHeld[property.width]-1;
						var itemHeight = itemHeld[property.height]-1;
						for (p = 0; p < property.MAX; p++){
							inventory[slot, p] = itemHeld[p];
						}
						IDindex++;
						ds_grid_set_region(grid, column, row, column+itemWidth, row+itemHeight, IDindex);
					}
				}
				// Pick up whatever was in the slot on the mouse
				for (p = 0; p < property.MAX; p++){
					itemHeld[p] = item[p];
				}
			}
		}
	}
}