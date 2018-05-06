/*

Syntax:
scr_GetDropProperties(instance, baseDrop);

instance	The instance ID for the new item created
baseDrop	The base drop's name as a string

This script looks up a new drop's (argument1's) base properties and then
assigns them a newly generated item (argument0).

*/

// Initialize Variables
var instance, baseDrop, idb, index, tableHeight, tableWidth, dropInfo;

instance = argument0;
baseDrop = argument1;
idb = obj_ItemDatabase;
tableWidth = ds_grid_width(idb.armorDB);
tableHeight = ds_grid_height(idb.armorDB);

// Lookup base drop in Armor array
if (ds_grid_value_exists(idb.armorDB, 0, 0, 0, tableHeight, baseDrop)){
	index = ds_grid_value_y(idb.armorDB, 0, 0, 0, tableHeight, baseDrop);
	show_debug_message("Found the index for "+baseDrop+"("+string(index)+")");
	// Lookup item's info and store it in a temporary array
	for (var p = 0; p < tableWidth; p++){
		dropInfo[p] = ds_grid_get(idb.armorDB, p, index);
		show_debug_message("Property "+string(p)+": "+dropInfo[p]);
	}
	// Set new item drop instance's base variables	
	instance.item[property.name]			= ds_grid_get(idb.armorDB, adb.name, index);
	instance.item[property.qLvl]			= real(ds_grid_get(idb.armorDB, adb.tc, index));
		// Convert types from string to their enum value
		var types;
		types[0] = ds_grid_get(idb.armorDB, adb.type, index)
		types[1] = ds_grid_get(idb.armorDB, adb.subtype, index)
		types = scr_GetDropTypes(types);
	instance.item[property.type]			= types[0]
	instance.item[property.subType]			= types[1]
	instance.item[property.sprite]			= asset_get_index(ds_grid_get(idb.armorDB, adb.sprite, index));
	instance.item[property.width]			= real(ds_grid_get(idb.armorDB, adb.width, index));
	instance.item[property.height]			= real(ds_grid_get(idb.armorDB, adb.height, index));
	instance.item[property.maxDurability]	= real(ds_grid_get(idb.armorDB, adb.maxDurability, index));
	instance.item[property.durability]		= irandom_range(1, instance.item[property.maxDurability]);
	instance.item[property.defence]			= irandom_range(real(ds_grid_get(idb.armorDB, adb.minDefence, index)), real(ds_grid_get(idb.armorDB, adb.maxDefence, index)));
	instance.item[property.reqStrength]		= real(ds_grid_get(idb.armorDB, adb.reqStrength, index));
	instance.item[property.reqLevel]		= real(ds_grid_get(idb.armorDB, adb.reqLevel, index));
	instance.item[property.maxSockets]		= real(ds_grid_get(idb.armorDB, adb.maxSockets, index));
	
	instance.item[property.itemLevel]		= level;
	instance.rarityMultiplier				= rarityMultiplier;
}
//else if (ds_grid_value_exists(idb.weaponDB, 0, 0, ds_grid_width(idb.weaponDB), ds_grid_height(idb.weaponDB), baseDrop)){
	
//}
//else if (ds_grid_value_exists(idb.miscDB, 0, 0, ds_grid_width(idb.miscDB), ds_grid_height(idb.miscDB), baseDrop)){
	
//}