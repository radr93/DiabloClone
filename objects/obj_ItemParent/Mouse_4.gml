/// @description Pick items up
var inv = obj_Inventory;
if (!global.clickingSomething and distance_to_object(obj_PlayerParent) <= 32 and inv.itemHeld[property.name] == -1){
	// If you aren't already clicking something and the inventory is closed
	if (!inv.showInventory){
		global.clickingSomething = true;
		var spaceFree = 0;
		// Loop through inventory cells until you find space
		for (r = 0; r < inv.rows; r++){
			for (c = 0; c < inv.columns; c++){
			
				// If the current cell is empty
				if (ds_grid_get(inv.grid, c, r) == -1){
					var cell = (((r+1)*inv.columns)-((inv.columns-1)-c))-1;
					// Check the rest of the cells needed to put the item down
					spaceFree = ds_grid_check_region(inv.grid, c, r, item[property.width], item[property.height]);
					// If there was free space
					if (spaceFree == -1){
						// Put item into inventory
						for (p = 0; p < property.MAX; p++){
							inv.inventory[cell, p] = item[p];
						}
						ds_grid_set_region(inv.grid, c, r, c+(item[property.width]-1), r+(item[property.height]-1), inv.IDindex);
						inv.IDindex++;
					}
				}
				// You found space, quit looking! (break column loop)
				if (spaceFree == -1){
					break;
				}
			}
			// You found space, quit looking! (break row loop)
			if (spaceFree == -1){
				break;
			}
		}
		// Item was transferred to inventory, eliminate ground copy
		if (spaceFree == -1){
				instance_destroy();
			}
		if (spaceFree != -1){
			show_debug_message("You are overburdened")
		}
	}

	// If you click the item while inventory is open
	else if (inv.showInventory){
		global.clickingSomething = true;
		// Transfer item to cursor
		for (p = 0; p < property.MAX; p++){
			inv.itemHeld[p] = item[p];
		}
		// Eliminate ground copy
		instance_destroy();
	}
}