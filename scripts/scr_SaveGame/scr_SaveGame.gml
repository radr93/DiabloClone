/*

Syntax:
scr_SaveGame();

This script saves all important character information when called.

*/

var player = obj_PlayerController.stats[stat.name];

// Write global variables to string and save .ini
// Save Files
ini_open("save/global/global.ini");
ini_write_real("Save", "Save Slots Used", global.saveSlotsUsed);
for (s = 0; s < global.saveSlotsMax; s++){
	ini_write_string("Save", "Save Slot"+string(s), global.saveSlot[s]);
}
ini_close();

// Write obj_Inventory.grid to string and save .ini
var grid = obj_Inventory.grid;
var invGridString = ds_grid_write(grid);
ini_open("save/"+player+"/inventoryGrid.ini");
ini_write_string("Save", "Inventory Grid", invGridString);
ini_close();
ds_grid_destroy(obj_Inventory.grid); // Clear inventory grid from memory

// Write obj_Inventory.inventory[c,p] to ds_grid, then write to string and save .ini
var cells = obj_Inventory.rows*obj_Inventory.columns;
var inventoryData = ds_grid_create(cells, property.MAX);
for (c = 0; c <  cells; c++){
	for (p = 0; p < property.MAX; p++){
		ds_grid_set(inventoryData, c, p, obj_Inventory.inventory[c, p]);
	}
}
var inventoryDataString = ds_grid_write(inventoryData);
ini_open("save/"+player+"/inventoryData.ini");
ini_write_string("Save", "Inventory Data", inventoryDataString);
ini_close();
ds_grid_destroy(inventoryData);

// Write obj_Inventory.itemHeld[s] stats to ds_map, then write to string and save .ini
var itemHeldData = ds_map_create();
for (p = 0; p <  property.MAX; p++){
	itemHeldData[? p] = obj_Inventory.itemHeld[p];
}
var itemHeldDataString = ds_map_write(itemHeldData);
ini_open("save/"+player+"/itemHeldData.ini");
ini_write_string("Save", "Item Held Data", itemHeldDataString);
ini_close();
ds_map_destroy(itemHeldData);

// Write obj_PlayerController[s] stats to ds_map, then write to string and save .ini
var playerData = ds_map_create();
for (p = 0; p <  property.MAX; p++){
	playerData[? p] = obj_PlayerController.stats[p];
}
var playerDataString = ds_map_write(playerData);
ini_open("save/"+player+"/playerData.ini");
ini_write_string("Save", "Player Data", playerDataString);
ini_close();
ds_map_destroy(playerData);