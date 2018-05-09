/// @description Open Chest

// Clicking on something
global.clickingSomething = true;

// If chest is closed, open it
if (image_index == 0){
	show_debug_message("\n## Opening Chest #####\nTreasure Class is: "+string(treasureClass));
	image_index = 1;
	
	// Initialize Local Variables
	var tcdb, index, picks, drop;
	tcdb = obj_TreasureClassDatabase;
	
	// Look up treasure class in tcMaster grid to find row index
	index = ds_grid_value_y(tcdb.tcMaster, 0, 0, 0, ds_grid_height(tcdb.tcMaster)-1, treasureClass);
	
	// Get the amount of drop chances for the treasure class
	picks = real(ds_grid_get(tcdb.tcMaster, tcmColumn.picks, index));
	show_debug_message("Number of picks = "+string(picks)+"\n");
	
	// Attempt to drop an item x amount of items
	repeat (picks){
		
		// Roll for an item drop (returns the string of an item's name or "noDrop")
		drop = scr_GetDrop(treasureClass);
		
		// If an item was selected
		if (drop != "noDrop"){
			
			// Create a new item on the ground
			var instance = instance_create_layer(x +- 32, y + 32, "Instances", obj_Item);			
			// Lookup the item's properties from item database and update new instance accordingly
			scr_ItemSetBaseProperties(instance, drop);
			show_debug_message("Created a new instance (ID# "+string(instance)+") for "+drop+".")
		}		
	}
}