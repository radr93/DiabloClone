/// @Description Pick items up
var inv = obj_Inventory;

// If you aren't already clicking something and the inventory is closed
if (!global.clickingSomething and !inv.showInventory){
	global.clickingSomething = true;
	var spaceFree = 0;
	// Loop through inventory cells until you find space
	for (r = 0; r < inv.rows; r++){
		for (c = 0; c < inv.columns; c++){
			
			// If the current cell is empty
			if (ds_grid_get(inv.grid, c, r) == -1){
				var cell = (((r+1)*inv.columns)-((inv.columns-1)-c))-1;
				show_debug_message("\n\nitemParent - locating space at cell# "+string(cell)+"...");
				
				// Check the rest of the cells needed to put the item down
				spaceFree = ds_grid_check_region(inv.grid, c, r, item[property.width], item[property.height]);
				show_debug_message("itemParent - ... spaceFree returned: "+string(spaceFree))
				// If there was free space
				if (spaceFree == -1){
					// Put item into inventory
					ds_grid_set_region(inv.grid, c, r, c+(item[property.width]-1), r+(item[property.height]-1), inv.IDindex);
					show_debug_message("itemParent - Setting region: location c"+string(c)+", r"+string(r)+
										" through to c"+string(c+(item[property.width]-1))+"r"+string(r+(item[property.height]-1))+
										" to spaceID# "+string(inv.IDindex)+". \n");
					inv.IDindex++;
					for (p = 0; p < property.MAX; p++){
						inv.inventory[cell, p] = item[p];
					}					
				}
			}
			if (spaceFree == -1){
				break;
			}
		}
		if (spaceFree == -1){
			break;
		}
	}
	if (spaceFree == -1){
			instance_destroy();
		}
	if (spaceFree != -1){
		show_debug_message("You are overburdened")
	}
}

// If you click the item while inventory is open
else if (!global.clickingSomething and inv.showInventory){
	global.clickingSomething = true;
	// Pick item up on cursor
	for (p = 0; p < property.MAX; p++){
		// Transfer item variables to cursor
		inv.itemHeld[p] = item[p];
	}
	// Eliminate ground copy
	instance_destroy();
}