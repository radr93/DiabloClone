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

// If the inventory is open
if (showInventory == true){
	
	// Check if inside the inventory grid
	if (mouse_x >= gridX and mouse_x < (gridX+(cellWidth*columns))){
		if (mouse_y >= gridY and mouse_y < (gridY+(cellHeight*rows))){;
			
			// Get mouse coordinates within the grid
			var column, row, cell, spaceID;
			
			column = floor((mouse_x - gridX)/32);
			row = floor((mouse_y - gridY)/32);
			cell = (((row+1)*columns)-((columns-1)-column))-1;
			spaceID = ds_grid_get(grid, column, row); // -1 = empty else number is unique for each item in inventory
			
			// If there is an item in the cell under the mouse
			if (spaceID > 0){
				
				// Get top-left cell index of the item taking up that slot 
				var spaceX, spaceY, topLeftCell, item, itemWidth, itemHeight;
				spaceX = ds_grid_value_x(grid, 0, 0, columns-1, rows-1, spaceID); // where is the left of the object?
				spaceY = ds_grid_value_y(grid, 0, 0, columns-1, rows-1, spaceID); // where is the top of the object?
				topLeftCell = (((spaceY+1)*columns)-((columns-1)-spaceX))-1; // which cell the top left of the object is in
				
				// Copy that item's properties to a temporary array
				for (p = 0; p < property.MAX; p++){
					item[p] = inventory[topLeftCell, p];
				}
				// Get size of the item taking up that slot 
				itemWidth = (item[property.width]-1);
				itemHeight = (item[property.height]-1);
					
				// If you click
				if (mouse_check_button_pressed(input.leftClick)){
					// If you're holding something
					if (itemHeld[property.name] != -1){
						// Get the held item's dimensions and see if it fits
						var itemHeldWidth, itemHeldHeight, spaceFree;
						itemHeldWidth = (itemHeld[property.width]);
						itemHeldHeight = (itemHeld[property.height]);
						spaceFree = ds_grid_check_region(grid, column, row, itemHeldWidth, itemHeldHeight);
						show_debug_message("spaceFree = "+string(spaceFree)+" (line 66)")
						// If there was only 1 item in the space to occupy
						if (spaceFree > 0){
							// Socket with gems/runes if those are held
							if (itemHeld[property.subType] == misc.rune){
								
								
								
								
							}
							// Pick up and drop items
							else{
								for (p = 0; p < property.MAX; p++){
									inventory[topLeftCell, p] = -1;
									inventory[cell, p] = itemHeld[p];
									itemHeld[p] = item[p];
								}
								// Empty the space in the inventory grid that the item was occupying
								ds_grid_set_region(grid, spaceX, spaceY, spaceX+itemWidth, spaceY+itemHeight, -1);
								// Mark space occupied by the previously held item in the grid and assign the it its own unique space ID for each slot it covers in the grid
								ds_grid_set_region(grid, column, row, column+itemHeldWidth-1, row+itemHeldHeight-1, IDindex)
								IDindex ++;
							}
						}
						// Otherwise there was more than one item in the area
						else{
							show_debug_message("Not enough space or too many items to drop. <LINE 82>")
						}
					}
					// If you aren't holding anything
					else if (itemHeld[property.name] == -1){
						// Pick up the item that was in the slot to mouse and empty the inventory slot
						for (p = 0; p < property.MAX; p++){
							itemHeld[p] = item[p];
							inventory[topLeftCell, p] = -1;
						}
						// Clear the space the item occupied in the grid
						ds_grid_set_region(grid, spaceX, spaceY, spaceX+itemWidth, spaceY+itemHeight, -1);
					}
				}
			}
			// If the cell under the mouse is empty
			else if (spaceID == -1){
				// If you click
				if (mouse_check_button_pressed(input.leftClick)){
					// If you're holding something
					if (itemHeld[property.name] != -1){
						// Get the held item's dimensions and see if it fits
						var itemHeldWidth, itemHeldHeight, spaceFree;
						itemHeldWidth = (itemHeld[property.width]);
						itemHeldHeight = (itemHeld[property.height]);
						spaceFree = ds_grid_check_region(grid, column, row, itemHeldWidth, itemHeldHeight);
						// If it fits
						if (spaceFree == -1){
							// Fill the space your mouse item takes
							for (p = 0; p < property.MAX; p++){
								inventory[cell, p] = itemHeld[p];
								itemHeld[p] = -1;
							}
							// Mark space occupied by the item in the grid and assign the item its own unique space ID for each slot it covers in the grid
							ds_grid_set_region(grid, column, row, column+(itemHeldWidth-1), row+(itemHeldHeight-1), IDindex)
							IDindex ++;
						}
						
						// If there was only 1 item in the space to occupy
						else if (spaceFree > 0){
							// Get top-left cell index of the item taking up that slot 
							var spaceX, spaceY, topLeftCell, item, itemWidth, itemHeight;
							spaceX = ds_grid_value_x(grid, 0, 0, columns-1, rows-1, spaceFree); // where is the left of the object?
							spaceY = ds_grid_value_y(grid, 0, 0, columns-1, rows-1, spaceFree); // where is the top of the object?
							topLeftCell = (((spaceY+1)*columns)-((columns-1)-spaceX))-1; // which cell the top left of the object is in
				
							// Copy that item's properties to a temporary array
							for (p = 0; p < property.MAX; p++){
								item[p] = inventory[topLeftCell, p];
							}
							// Get size of the item taking up that slot 
							itemWidth = (item[property.width]-1);
							itemHeight = (item[property.height]-1);
							for (p = 0; p < property.MAX; p++){
								inventory[topLeftCell, p] = -1;
								inventory[cell, p] = itemHeld[p];
								itemHeld[p] = item[p];
							}
							// Empty the space that the item occupied
							ds_grid_set_region(grid, spaceX, spaceY, spaceX+itemWidth, spaceY+itemHeight, -1);
							// Mark space occupied by the item in the grid and assign the item its own unique space ID for each slot it covers in the grid
							ds_grid_set_region(grid, column, row, column+itemHeldWidth-1, row+itemHeldHeight-1, IDindex)
							IDindex ++;
						}
						// Otherwise there was more than one item in the area
						else{
							show_debug_message("Not enough space or too many items to drop. <LINE 155>")
						}
					}
				}
			}
		}
	}
}