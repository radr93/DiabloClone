/*

Syntax:
scr_GetDropProperties(instance, dropString);

instance	The instance ID for the new item created
dropString	The base drop's name as a string

This script looks up a new drop's (argument1's) base properties and then
assigns them a newly generated item (argument0).

*/

// Initialize Variables
var instance, dropString, idb, rowIndex, tableHeight, tableWidth, dropInfo;

instance	= argument0;
dropString  = argument1;
idb			= obj_ItemDatabase;

// First try and lookup base drop in armor database
if (ds_grid_value_exists(idb.armorDB, 0, 0, 0, ds_grid_height(idb.armorDB)-1, dropString)){
	
	// Get Grid Size
	tableHeight = ds_grid_height(idb.armorDB)-1;
	tableWidth = ds_grid_width(idb.armorDB)-1;
	
	// Get the item's rowIndex within armor.csv
	rowIndex = ds_grid_value_y(idb.armorDB, 0, 0, 0, tableHeight, dropString);
	show_debug_message("Found the rowIndex for "+dropString+"("+string(rowIndex)+") in armor database.");
	
	// Lookup item's info and store it in a temporary array (in order of the columns in the file)
	for (var p = 0; p < tableWidth; p++){
		dropInfo[p] = ds_grid_get(idb.armorDB, p, rowIndex);
		show_debug_message("Property "+string(p)+": "+dropInfo[p]);
	}
	
	// Convert item's types from string to their enum value
	var types;
	types[0] = ds_grid_get(idb.armorDB, adb.type, rowIndex)
	types[1] = ds_grid_get(idb.armorDB, adb.subtype, rowIndex)
	types = scr_GetDropTypes(types);
	
	// Set new item drop instance's base variables	
	instance.item[property.name]			= ds_grid_get(idb.armorDB, adb.name, rowIndex);
	instance.item[property.treasureClass]	= real(ds_grid_get(idb.armorDB, adb.tc, rowIndex));
	instance.item[property.type]			= types[0]
	instance.item[property.subType]			= types[1]
	instance.item[property.sprite]			= asset_get_index(ds_grid_get(idb.armorDB, adb.sprite, rowIndex));
	instance.item[property.width]			= real(ds_grid_get(idb.armorDB, adb.width, rowIndex));
	instance.item[property.height]			= real(ds_grid_get(idb.armorDB, adb.height, rowIndex));
	instance.item[property.maxDurability]	= real(ds_grid_get(idb.armorDB, adb.maxDurability, rowIndex));
	instance.item[property.durability]		= irandom_range(1, instance.item[property.maxDurability]);
	instance.item[property.defence]			= irandom_range(real(ds_grid_get(idb.armorDB, adb.minDefence, rowIndex)), real(ds_grid_get(idb.armorDB, adb.maxDefence, rowIndex)));
	instance.item[property.reqStrength]		= real(ds_grid_get(idb.armorDB, adb.reqStrength, rowIndex));
	instance.item[property.reqLevel]		= real(ds_grid_get(idb.armorDB, adb.reqLevel, rowIndex));
	instance.item[property.maxSockets]		= real(ds_grid_get(idb.armorDB, adb.maxSockets, rowIndex));
	
	// Set new item drop instance's level and rarity multiplier
	instance.item[property.itemLevel]		= level;
	instance.rarityMultiplier				= rarityMultiplier;
}

// If item wasn't found in armor DB, check for it in weapons DB next
else if (ds_grid_value_exists(idb.weaponDB, 0, 0, 0, ds_grid_height(idb.weaponDB)-1, dropString)){
	
	// Get grid size
	tableHeight = ds_grid_height(idb.weaponDB)-1;
	tableWidth = ds_grid_width(idb.weaponDB)-1;
	
	// Get the item's rowIndex within weapons.csv
	rowIndex = ds_grid_value_y(idb.weaponDB, 0, 0, 0, tableHeight, dropString);
	show_debug_message("Found the rowIndex for "+dropString+"("+string(rowIndex)+") in weapon database.");
	
	// Lookup item's info and store it in a temporary array (in order of the columns in the file)
	for (var p = 0; p < tableWidth; p++){
		dropInfo[p] = ds_grid_get(idb.weaponDB, p, rowIndex);
		show_debug_message("Property "+string(p)+": "+dropInfo[p]);
	}
	
	// Convert item's types from string to their enum value
	var types;
	types[0] = ds_grid_get(idb.weaponDB, wdb.type, rowIndex)
	show_debug_message("type is: "+types[0]);
	types[1] = ds_grid_get(idb.weaponDB, wdb.subtype, rowIndex)
	show_debug_message("subType is: "+types[1]);
	types = scr_GetDropTypes(types);
	
	// Set new item drop instance's base variables	
	instance.item[property.name]			= ds_grid_get(idb.weaponDB, wdb.name, rowIndex);
	instance.item[property.treasureClass]	= real(ds_grid_get(idb.weaponDB, wdb.tc, rowIndex));
	instance.item[property.type]			= types[0]
	instance.item[property.subType]			= types[1]
	instance.item[property.sprite]			= asset_get_index(ds_grid_get(idb.weaponDB, wdb.sprite, rowIndex));
	instance.item[property.width]			= real(ds_grid_get(idb.weaponDB, wdb.width, rowIndex));
	instance.item[property.height]			= real(ds_grid_get(idb.weaponDB, wdb.height, rowIndex));
	instance.item[property.maxDurability]	= real(ds_grid_get(idb.weaponDB, wdb.maxDurability, rowIndex));
	instance.item[property.durability]		= irandom_range(1, instance.item[property.maxDurability]);
	// instance.item[property.twoHanded]	   = real(ds_grid_get(idb.weaponDB, wdb.twoHanded, rowIndex));
	// instance.item[property.attackSpeed]	   = real(ds_grid_get(idb.weaponDB, wdb.attackSpeed, rowIndex));
	instance.item[property.minDamage]		= real(ds_grid_get(idb.weaponDB, wdb.minDamage, rowIndex));
	instance.item[property.maxDamage]		= real(ds_grid_get(idb.weaponDB, wdb.maxDamage, rowIndex));
	instance.item[property.reqStrength]		= real(ds_grid_get(idb.weaponDB, wdb.reqStrength, rowIndex));
	instance.item[property.reqDexterity]	= real(ds_grid_get(idb.weaponDB, wdb.reqDexterity, rowIndex));
	instance.item[property.reqIntelligence]	= real(ds_grid_get(idb.weaponDB, wdb.reqIntelligence, rowIndex));
	instance.item[property.reqLevel]		= real(ds_grid_get(idb.weaponDB, wdb.reqLevel, rowIndex));
	instance.item[property.maxSockets]		= real(ds_grid_get(idb.weaponDB, wdb.maxSockets, rowIndex));
	
	// Set new item drop instance's level and rarity multiplier
	instance.item[property.itemLevel]		= level;
	instance.rarityMultiplier				= rarityMultiplier;
}

// Finally if item wasn't found in weapons db, search for it in misc DB
	
//}

else{
	// Get grid size
	tableHeight = ds_grid_height(idb.miscDB)-1;
	tableWidth = ds_grid_width(idb.miscDB)-1;
	
	// Get the item's rowIndex within weapons.csv
	rowIndex = ds_grid_value_y(idb.miscDB, 0, 0, 0, tableHeight, dropString);
	show_debug_message("Found the rowIndex for "+dropString+"("+string(rowIndex)+") in weapon database.");
	
	// Lookup item's info and store it in a temporary array (in order of the columns in the file)
	for (var p = 0; p < tableWidth; p++){
		dropInfo[p] = ds_grid_get(idb.miscDB, p, rowIndex);
		show_debug_message("Property "+string(p)+": "+dropInfo[p]);
	}
	
	// Convert item's types from string to their enum value
	var types;
	types[0] = ds_grid_get(idb.miscDB, mdb.type, rowIndex)
	show_debug_message("type is: "+types[0]);
	types[1] = ds_grid_get(idb.miscDB, mdb.subtype, rowIndex)
	show_debug_message("subType is: "+types[1]);
	types = scr_GetDropTypes(types);
	
	// Set new item drop instance's base variables
	instance.item[property.name]			= ds_grid_get(idb.miscDB, mdb.name, rowIndex);
	instance.item[property.treasureClass]	= 0;
	
	instance.item[property.type]			= types[0]
	instance.item[property.subType]			= types[1]
	instance.item[property.sprite]			= asset_get_index(ds_grid_get(idb.miscDB, mdb.sprite, rowIndex));
	instance.item[property.subTitle]		= ds_grid_get(idb.miscDB, mdb.subTitle, rowIndex);
	instance.item[property.width]			= real(ds_grid_get(idb.miscDB, mdb.width, rowIndex));
	instance.item[property.height]			= real(ds_grid_get(idb.miscDB, mdb.height, rowIndex));
	instance.item[property.magic1stat]		= real(ds_grid_get(idb.miscDB, mdb.magic1stat, rowIndex));
	instance.item[property.magic1value]		= real(ds_grid_get(idb.miscDB, mdb.magic1value, rowIndex));
	instance.item[property.magic1string]	= real(ds_grid_get(idb.miscDB, mdb.magic1string, rowIndex));
	instance.item[property.magic2stat]		= real(ds_grid_get(idb.miscDB, mdb.magic2stat, rowIndex));
	instance.item[property.magic2value]		= real(ds_grid_get(idb.miscDB, mdb.magic2value, rowIndex));
	instance.item[property.magic2string]	= real(ds_grid_get(idb.miscDB, mdb.magic2string, rowIndex));
	instance.item[property.magic3stat]		= real(ds_grid_get(idb.miscDB, mdb.magic3stat, rowIndex));
	instance.item[property.magic3value]		= real(ds_grid_get(idb.miscDB, mdb.magic3value, rowIndex));
	instance.item[property.magic3string]	= real(ds_grid_get(idb.miscDB, mdb.magic3string, rowIndex));
	instance.item[property.magic4stat]		= real(ds_grid_get(idb.miscDB, mdb.magic4stat, rowIndex));
	instance.item[property.magic4value]		= real(ds_grid_get(idb.miscDB, mdb.magic4value, rowIndex));
	instance.item[property.magic4string]	= real(ds_grid_get(idb.miscDB, mdb.magic4string, rowIndex));
	
	// Set new item drop instance's level and rarity multiplier
	instance.item[property.itemLevel]		= level;
	instance.rarityMultiplier				= rarityMultiplier;
}