// Pick items up
var inv = obj_Inventory;

// If you aren't already clicking something and the inventory is closed
if (!global.clickingSomething and !inv.showInventory){
	if (ds_grid_value_exists(grid, 0, 0, (columns-1), (rows-1), -1)){
		// ds_grid_get_region();
	}
	// check for space
		// add item automatically
}

// If you click the item while inventory is open
if (!global.clickingSomething and inv.showInventory){
	global.clickingSomething = true;
	// Pick item up on cursor
	for (p = 0; p < property.MAX; p++){
		// Transfer item variables to cursor
		inv.itemHeld[p] = item[p];
	}
	// Eliminate ground copy
	instance_destroy();
}