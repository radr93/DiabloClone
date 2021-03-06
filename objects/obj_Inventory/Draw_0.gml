/// @description Draw inventory to screen

// If the inventory is open
if (showInventory = true){
	// Draw the inventory
    draw_sprite_ext(spr_Inventory, 0, x, y, 1, 1, 0, c_white, 1);
	
	// Draw the items in the inventory
	var r, c;
	var xx = gridX;
	var yy = gridY;
	var cellCount = 0;
	for (r = 0; r < rows; r++){
		for (c = 0; c < columns; c++){
			if (inventory[cellCount, property.name] != -1){
				draw_set_color(inventory[cellCount, property.rarity]);
				// Draw Rectangle behind item (color of rarity)
				draw_set_alpha(0.15);
				var spriteWidth = sprite_get_width(inventory[cellCount, property.sprite]);
				var spriteHeight = sprite_get_height(inventory[cellCount, property.sprite]);
				draw_rectangle(xx, yy, xx+spriteWidth, yy+spriteHeight, false);
				draw_set_alpha(1);
				// Draw item picture
				if (inventory[cellCount, property.ethereal] == false){
					draw_sprite(inventory[cellCount, property.sprite], 0, xx+(spriteWidth/4), yy+spriteHeight/4);
				}
				else{
					draw_sprite_ext(inventory[cellCount, property.sprite], 0, xx+(spriteWidth/4), yy+spriteHeight/4, 1, 1, 0, c_white, 0.5);
				}
			}
			// draw_set_color(c_white);
			// draw_text(xx+4, yy+4, string(ds_grid_get(grid, c, r)));
			xx += 32;
			cellCount++;
		}
	xx -= (cellWidth*columns)
	yy += 32;
	}
	
	// Check if inside the inventory grid
	if (mouse_x >= gridX and mouse_x < (gridX+(cellWidth*columns))){
		if (mouse_y >= gridY and mouse_y < (gridY+(cellHeight*rows))){;

			// Get coordinates within grid
			var column = floor(abs((mouse_x - gridX)/32));
			var row = floor(abs((mouse_y - gridY)/32));
			var gridSnapX = gridX+(column*cellWidth);
			var gridSnapY = gridY+(row*cellHeight);
			var spaceID = ds_grid_get(grid, column, row); // -1 = empty else number is unique for each item in inventory
			
			// If you're holding an item, draw a square across each occupied space
			draw_set_color(c_green);
			draw_set_alpha(0.15);
			if (itemHeld[property.name] != -1){
				var spriteWidth = itemHeld[property.width];
				var spriteHeight = itemHeld[property.height];
				var spaceFree = ds_grid_check_region(grid, column, row, spriteWidth, spriteHeight);
				if (spaceFree != 0){
					spriteWidth = sprite_get_width(itemHeld[property.sprite]);
					spriteHeight = sprite_get_height(itemHeld[property.sprite]); 
					draw_rectangle(gridSnapX, gridSnapY, gridSnapX+spriteWidth, gridSnapY+spriteHeight, false);
				}
			}
			// Otherwise draw 1 square on the mouse
			else if (spaceID == -1){
				draw_rectangle(gridSnapX, gridSnapY, gridSnapX+cellWidth, gridSnapY+cellHeight, false);
			}
			draw_set_alpha(1);
			
			// If there is an item in the cell under the mouse
			if (spaceID > 0){
				
				// Get top left cell index of the item taking up that slot 
				var spaceX, spaceY, topLeftCell;
				spaceX = ds_grid_value_x(grid, 0, 0, columns-1, rows-1, spaceID); // where is the left of the object?
				spaceY = ds_grid_value_y(grid, 0, 0, columns-1, rows-1, spaceID); // where is the top of the object?
				topLeftCell = (((spaceY+1)*columns)-((columns-1)-spaceX))-1; // which cell the top left of the object is in
				// Copy that item's properties to a temporary array
				for (p = 0; p < property.MAX; p++){
					item[p] = inventory[topLeftCell, p];
				}
				// Draw the tooltip
				scr_DrawItemTooltip(item);
			}			
		}
	}
	/// Draw Gold Count
	// Set color, font, alignment
	draw_set_color(c_white);
	draw_set_font(font_Calibri);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	// Draw Gold Count
	draw_text(x+304, y+544, string(obj_PlayerController.stats[stat.gold]));
	// Reset Align
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

// If you're holding an item, show it on mouse otherwise use the default cursor
if (itemHeld[property.name] != -1){
	cursor_sprite = cr_none;
	if (itemHeld[property.ethereal] == false){
		draw_sprite(itemHeld[property.sprite], 0, mouse_x, mouse_y);
	}
	else{
		draw_sprite_ext(itemHeld[property.sprite], 0, mouse_x, mouse_y, 1, 1, 0, c_white, 0.5);
	}
	
}
else{
	cursor_sprite = spr_Cursor;
}