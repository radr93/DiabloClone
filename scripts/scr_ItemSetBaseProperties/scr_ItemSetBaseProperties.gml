/*

Syntax:
scr_ItemSetBaseProperties(instance, itemDrop);

instance	The instance ID for the new item created
itemDrop	The base drop's name as a string

This script looks up a new drop's (argument1's) base properties and then
assigns them a newly generated item (argument0).

*/

// Initialize Variables
var itemDrop, instance, idb, rowIndex, table, tableHeight, tableWidth, dropInfo;

instance	= argument0;
itemDrop	= argument1;
idb			= obj_ItemDatabase;

// First try and lookup base drop in armor database
if (ds_grid_value_exists(idb.armorDB, 0, 0, 0, ds_grid_height(idb.armorDB)-1, itemDrop)){
	
	// Get Grid ID and Size
	table = idb.armorDB;
	tableHeight = ds_grid_height(table)-1;
	tableWidth = ds_grid_width(table)-1;
	
	// Get the item's rowIndex within armor.csv
	rowIndex = ds_grid_value_y(table, 0, 0, 0, tableHeight, itemDrop);
	show_debug_message("Found the rowIndex for "+itemDrop+"("+string(rowIndex)+") in armor database.");
	
	// Lookup item's info and store it in a temporary array (in order of the columns in the file)
	for (var p = 0; p < tableWidth; p++){
		dropInfo[p] = ds_grid_get(table, p, rowIndex);
		// Show debug for which properties are real numbers and which are strings
		if (is_real(dropInfo[p])){
			show_debug_message(ds_grid_get(table, p, 0)+": "+string(dropInfo[p])+"(real)");
		}
		else{
			show_debug_message(ds_grid_get(table, p, 0)+": "+dropInfo[p]);
		}
	}
	
	// Convert item's types from string to their enum value
	var types;
	types[0] = ds_grid_get(table, adb.type, rowIndex)
	types[1] = ds_grid_get(table, adb.subtype, rowIndex)
	types = scr_GetDropTypes(types);
	
	// Set new item drop instance's base variables	
	instance.item[property.name]			= ds_grid_get(table, adb.name, rowIndex);
	instance.item[property.treasureClass]	= ds_grid_get(table, adb.tc, rowIndex);
	instance.item[property.type]			= types[0]
	instance.item[property.subType]			= types[1]
	instance.item[property.sprite]			= asset_get_index(ds_grid_get(table, adb.sprite, rowIndex));
	instance.item[property.width]			= ds_grid_get(table, adb.width, rowIndex);
	instance.item[property.height]			= ds_grid_get(table, adb.height, rowIndex);
	instance.item[property.maxDurability]	= ds_grid_get(table, adb.maxDurability, rowIndex);
	instance.item[property.durability]		= irandom_range(1, instance.item[property.maxDurability]);
	instance.item[property.defence]			= irandom_range(ds_grid_get(table, adb.minDefence, rowIndex), ds_grid_get(table, adb.maxDefence, rowIndex));
	instance.item[property.reqStrength]		= ds_grid_get(table, adb.reqStrength, rowIndex);
	instance.item[property.reqLevel]		= ds_grid_get(table, adb.reqLevel, rowIndex);
	instance.item[property.maxSockets]		= ds_grid_get(table, adb.maxSockets, rowIndex);
	
	// Set new item drop instance's level and rarity multiplier
	instance.item[property.itemLevel]		= level;
	instance.rarityMultiplier				= rarityMultiplier;
}

// If item wasn't found in armor DB, check for it in weapons DB next
else if (ds_grid_value_exists(idb.weaponDB, 0, 0, 0, ds_grid_height(idb.weaponDB)-1, itemDrop)){
	
	// Get grid size
	table = idb.weaponDB;
	tableHeight = ds_grid_height(table)-1;
	tableWidth = ds_grid_width(table)-1;
	
	// Get the item's rowIndex within weapons.csv
	rowIndex = ds_grid_value_y(table, 0, 0, 0, tableHeight, itemDrop);
	show_debug_message("Found the rowIndex for "+itemDrop+"("+string(rowIndex)+") in weapon database.");
	
	// Lookup item's info and store it in a temporary array (in order of the columns in the file)
	for (var p = 0; p < tableWidth; p++){
		dropInfo[p] = ds_grid_get(table, p, rowIndex);
		// Show debug for which properties are real numbers and which are strings
		if (is_real(dropInfo[p])){
			show_debug_message(ds_grid_get(table, p, 0)+": "+string(dropInfo[p])+"(real)");
		}
		else{
			show_debug_message(ds_grid_get(table, p, 0)+": "+dropInfo[p]);
		}
	}
	
	// Convert item's types from string to their enum value
	var types;
	types[0] = ds_grid_get(table, wdb.type, rowIndex)
	types[1] = ds_grid_get(table, wdb.subtype, rowIndex)
	types = scr_GetDropTypes(types);
	
	// Set new item drop instance's base variables	
	instance.item[property.name]			= ds_grid_get(table, wdb.name, rowIndex);
	instance.item[property.treasureClass]	= ds_grid_get(table, wdb.tc, rowIndex);
	instance.item[property.type]			= types[0]
	instance.item[property.subType]			= types[1]
	instance.item[property.sprite]			= asset_get_index(ds_grid_get(table, wdb.sprite, rowIndex));
	instance.item[property.width]			= ds_grid_get(table, wdb.width, rowIndex);
	instance.item[property.height]			= ds_grid_get(table, wdb.height, rowIndex);
	instance.item[property.maxDurability]	= ds_grid_get(table, wdb.maxDurability, rowIndex);
	instance.item[property.durability]		= irandom_range(1, instance.item[property.maxDurability]);
	// instance.item[property.twoHanded]	   = ds_grid_get(table, wdb.twoHanded, rowIndex);
	// instance.item[property.attackSpeed]	   = ds_grid_get(table, wdb.attackSpeed, rowIndex);
	instance.item[property.minDamage]		= ds_grid_get(table, wdb.minDamage, rowIndex);
	instance.item[property.maxDamage]		= ds_grid_get(table, wdb.maxDamage, rowIndex);
	instance.item[property.reqStrength]		= ds_grid_get(table, wdb.reqStrength, rowIndex);
	instance.item[property.reqDexterity]	= ds_grid_get(table, wdb.reqDexterity, rowIndex);
	instance.item[property.reqIntelligence]	= ds_grid_get(table, wdb.reqIntelligence, rowIndex);
	instance.item[property.reqLevel]		= ds_grid_get(table, wdb.reqLevel, rowIndex);
	instance.item[property.maxSockets]		= ds_grid_get(table, wdb.maxSockets, rowIndex);
	
	// Set new item drop instance's level and rarity multiplier
	instance.item[property.itemLevel]		= level;
	instance.rarityMultiplier				= rarityMultiplier;
}

// Finally if item wasn't found in weapons db, search for it in misc DB
else{
	// Get grid size
	table = idb.miscDB;
	tableHeight = ds_grid_height(table)-1;
	tableWidth = ds_grid_width(table)-1;
	
	// Get the item's rowIndex within misc.csv
	rowIndex = ds_grid_value_y(table, 0, 0, 0, tableHeight, itemDrop);
	show_debug_message("Found the rowIndex for "+itemDrop+"("+string(rowIndex)+") in weapon database.");
	
	// Lookup item's info and store it in a temporary array (in order of the columns in the file)
	for (var p = 0; p < tableWidth; p++){
		dropInfo[p] = ds_grid_get(table, p, rowIndex);
		// Show debug for which properties are real numbers and which are strings
		if (is_real(dropInfo[p])){
			show_debug_message(ds_grid_get(table, p, 0)+": "+string(dropInfo[p])+"(real)");
		}
		else{
			show_debug_message(ds_grid_get(table, p, 0)+": "+dropInfo[p]);
		}
	}
	
	// Get rarity and convert it to the proper enum.
	var _rarity = ds_grid_get(table, mscdb.rarity, rowIndex);
	switch _rarity{
		case "normal":	_rarity = rarity.normal;	break;
		case "magic":	_rarity = rarity.magic;		break;
		case "rare":	_rarity = rarity.rare;		break;
		case "set":		_rarity = rarity.set;		break;
		case "unique":	_rarity = rarity.unique;	break;
	}
	// Convert item's types from string to their enum value
	var types;
	types[0] = ds_grid_get(table, mscdb.type, rowIndex)
	show_debug_message("type is: "+types[0]);
	types[1] = ds_grid_get(table, mscdb.subtype, rowIndex)
	show_debug_message("subType is: "+types[1]);
	types = scr_GetDropTypes(types);

	// Set new item drop instance's base variables
	instance.item[property.name]			= ds_grid_get(table, mscdb.name, rowIndex);
	instance.item[property.subTitle]		= ds_grid_get(table, mscdb.subTitle, rowIndex);
	instance.item[property.treasureClass]	= 0;
	instance.item[property.rarity]			= _rarity;
	instance.item[property.type]			= types[0]
	instance.item[property.subType]			= types[1]
	instance.item[property.sprite]			= asset_get_index(ds_grid_get(table, mscdb.sprite, rowIndex));
	instance.item[property.width]			= real(ds_grid_get(table, mscdb.width, rowIndex));
	instance.item[property.height]			= real(ds_grid_get(table, mscdb.height, rowIndex));
	
	// Update magical properties if necessary
	if (ds_grid_get(table, mscdb.magic1stat, rowIndex) != -1){
		instance.item[property.magic1stat]		= scr_GetStatEnumFromString(ds_grid_get(table, mscdb.magic1stat, rowIndex));
		instance.item[property.magic1value]		= ds_grid_get(table, mscdb.magic1value, rowIndex);
		instance.item[property.magic1string]	= ds_grid_get(table, mscdb.magic1string, rowIndex);
		
		instance.item[property.magic2stat]		= scr_GetStatEnumFromString(ds_grid_get(table, mscdb.magic2stat, rowIndex));
		instance.item[property.magic2value]		= ds_grid_get(table, mscdb.magic2value, rowIndex);
		instance.item[property.magic2string]	= ds_grid_get(table, mscdb.magic2string, rowIndex);
		
		instance.item[property.magic3stat]		= scr_GetStatEnumFromString(ds_grid_get(table, mscdb.magic3stat, rowIndex));
		instance.item[property.magic3value]		= ds_grid_get(table, mscdb.magic3value, rowIndex);
		instance.item[property.magic3string]	= ds_grid_get(table, mscdb.magic3string, rowIndex);
		
		instance.item[property.magic4stat]		= scr_GetStatEnumFromString(ds_grid_get(table, mscdb.magic4stat, rowIndex));
		instance.item[property.magic4value]		= ds_grid_get(table, mscdb.magic4value, rowIndex);
		instance.item[property.magic4string]	= ds_grid_get(table, mscdb.magic4string, rowIndex);
	}
	
	// Set new item drop instance's level and rarity multiplier
	instance.item[property.itemLevel]		= level;
	instance.rarityMultiplier				= rarityMultiplier;
}