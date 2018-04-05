/// @description Draw inventory to screen

if (showInventory = true){

	// Check if inside the inventory grid
	if (mouse_x >= gridX and mouse_x <= (gridX+(cellWidth*columns))){
		if (mouse_y >= gridY and mouse_y <= (gridY+(cellHeight*rows))){;
			
			// Get coordinates within grid
			var gridPositionX = floor(abs((mouse_x - gridX)/32));
			var gridPositionY = floor(abs((mouse_y - gridY)/32));
			var gridSnapX = gridX+(gridPositionX*cellWidth);
			var gridSnapY = gridY+(gridPositionY*cellHeight);
			
			// Draw Colored Boxes behind items
			draw_set_color(c_silver);
			draw_set_alpha(0.15);
			// If you're holding an item, draw a square across each occupied space
			if (itemHeld[property.sprite] != -1){
				var spriteWidth = sprite_get_width(itemHeld[property.sprite]);
				var spriteHeight = sprite_get_height(itemHeld[property.sprite]);
				draw_rectangle(gridSnapX, gridSnapY, gridSnapX+spriteWidth, gridSnapY+spriteHeight, false);
			}
			// Otherwise draw 1 squre on the mouse
			else{
				draw_rectangle(gridSnapX, gridSnapY, gridSnapX+cellWidth, gridSnapY+cellHeight, false);
			}
			draw_set_alpha(1);
			
		}
	}
	
	// If there's an item on the cursor change the sprite otherwise use the default cursor
	if (itemHeld[property.sprite] != -1) then cursor_sprite = itemHeld[property.sprite] else cursor_sprite = spr_Cursor;
	
	// Draw the inventory
    draw_sprite_ext(spr_Inventory, 0, x, y, 1, 1, 0, c_white, 1);
	
	// Draw the items in the inventory
	
	
	// DS_Grid test block start /////////////////////////////
	var r, c;
	var xx = gridX;
	var yy = gridY;
	var slotCount = 0;
	for (r = 0; r < rows; r++){
		for (c = 0; c < columns; c++){
			draw_set_color(c_white);
			draw_text(xx+4, yy+4, string(ds_grid_get(grid, c, r)));
			if (inventory[slotCount, property.sprite] != -1){
				draw_sprite(inventory[slotCount, property.sprite], 0, xx, yy);
			}
			xx += 32;
			slotCount++;
		}
	xx -= (cellWidth*columns)
	yy += 32;
	}
	// DS_Grid test block end //////////////////////////////
}