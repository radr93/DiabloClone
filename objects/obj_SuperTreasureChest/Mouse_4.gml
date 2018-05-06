/// @description Open Chest

// Clicking on something
global.clickingSomething = true;

// If chest is closed, open it
if (image_index == 0){
	show_debug_message("\n## Opening Chest #####\nDrop Source Treasure Class is: "+string(treasureClass));
	image_index = 1;
	
	// Choose how many items to drop
	var tcdb, index, picks, baseDrop;
	tcdb = obj_TreasureClassDatabase;
	
	// Look up treasure class in tcMaster grid to find row index
	index = ds_grid_value_y(tcdb.tcMaster, 0, 0, 0, ds_grid_height(tcdb.tcMaster), treasureClass);
	show_debug_message("Treasure Class's row index in tcMaster = "+string(index));
	
	// Choose appropriate amount of drop chances from the picks columns for row index
	picks = real(ds_grid_get(tcdb.tcMaster, tcmColumn.picks, index));
	show_debug_message("Number of picks = "+string(picks));
	
	// Drop x amount of items
	repeat (picks){
		
		// Roll for an item drop (returns string of an item or "noDrop")
		baseDrop = scr_GetDrop(treasureClass);
		
		// If a drop was actually selected ("noDrop" = No drop selected)
		if (baseDrop != "noDrop"){
			
			// Create a new item on the ground
			var i = instance_create_layer(x +- 32, y + 32, "Instances", obj_Item);
			
			// Assign the item's base properties (depending on the different base drops)
			scr_GetDropProperties(i, baseDrop);
			
		}		
	}
}