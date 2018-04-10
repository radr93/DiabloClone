/*

Syntax:
scr_LoadGame(name);

name	The name of the character to load

This script loads all important character information when called.

*/

// Initialize Controllers
instance_create_layer(x, y, "Controllers", obj_PlayerController);
instance_create_layer(x, y, "Controllers", obj_UIController);
var player = argument0;

// Initialize obj_Inventory.grid
var grid = obj_Inventory.grid;
ini_open("save/"+player+"/inventoryGrid.ini");
ds_grid_read(grid, ini_read_string("Save", "Inventory Grid", "DID NOT WORK"));
ini_close();

// Initialize obj_Inventory.inventory[c,p]
var cells = obj_Inventory.rows*obj_Inventory.columns;
var inventoryData = ds_grid_create(obj_Inventory.columns, obj_Inventory.rows);
ini_open("save/"+player+"/inventoryData.ini");
ds_grid_read(inventoryData, ini_read_string("Save", "Inventory Data", "DID NOT WORK"));
ini_close();
for (c = 0; c <  cells; c++){
	for (p = 0; p < property.MAX; p++){
		// Reload array with grid values
		obj_Inventory.inventory[c, p] = ds_grid_get(inventoryData, c, p);
	}
}
ds_grid_destroy(inventoryData);

// Write obj_PlayerController[s] stats to ds_map, then write to string and save .ini
var itemHeldData = ds_map_create();
ini_open("save/"+player+"/itemHeldData.ini");
ds_map_read(itemHeldData, ini_read_string("Save", "Item Held Data", "DID NOT WORK"));
ini_close();
if (itemHeldData[? 0] != undefined){
	for (p = 0; p <  property.MAX; p++){
		obj_Inventory.itemHeld[p] = itemHeldData[? p];
	}
}
	ds_map_destroy(itemHeldData);

// Read obj_PlayerController[s] stats to ds_map, then convert back to array
var playerData = ds_map_create();
ini_open("save/"+player+"/playerData.ini");
ds_map_read(playerData, ini_read_string("Save", "Player Data", "DID NOT WORK"));
ini_close();
for (p = 0; p <  property.MAX; p++){
	obj_PlayerController.stats[p] = playerData[? p];
}
ds_map_destroy(playerData);