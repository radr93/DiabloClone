/*

Syntax:
scr_ItemSetBaseProperties(instance, itemDrop);

instance	The instance ID for the new item created
itemDrop	The base drop's name as a string

This script looks up a new drop's (argument1's) base properties and then
assigns them a newly generated item (argument0).

*/

// Initialize Variables
var instance, itemDrop, idb, table, tableHeight, tableWidth, rowIndex, dropInfo;

instance	= argument0;
itemDrop	= argument1;
idb			= obj_ItemDatabase;

// Find out which database the item is in (First search armor, then weapons, then misc)
show_debug_message("Searching for new item in item database...");
if (ds_grid_value_exists(idb.armorDB, 0, 0, 0, ds_grid_height(idb.armorDB)-1, itemDrop)){
	table = idb.armorDB;
	show_debug_message("Found item in armor database.");
}
else if (ds_grid_value_exists(idb.weaponDB, 0, 0, 0, ds_grid_height(idb.weaponDB)-1, itemDrop)){
	table = idb.weaponDB;
	show_debug_message("Found item in weapon database.");
}
else if (ds_grid_value_exists(idb.miscDB, 0, 0, 0, ds_grid_height(idb.miscDB)-1, itemDrop)){
	table = idb.miscDB;
	show_debug_message("Found item in misc database.");
}
/*
// Get database's dimensions and the row (y) index of the item in the grid
tableHeight = ds_grid_height(table)-1;
tableWidth = ds_grid_width(table)-1;	
rowIndex = ds_grid_value_y(table, 0, 0, 0, tableHeight, itemDrop);
show_debug_message("rowIndex for "+itemDrop+" is ("+string(rowIndex)+") in selected database.");
	
// Lookup item's info (from each column, left to right) and store it in a temporary array
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

var column, types;

// Give new item instance the properties from the temporary array
column = ds_grid_value_x(table,0,0,tableWidth,0,"name");
instance.item[property.name] = ds_grid_get(table, column, rowIndex);
instance.item[property.treasureClass] = ds_grid_get(table, adb.tc, rowIndex);

// Convert item's type and subtype from string to their corresponding enum value
column = ds_grid_value_x(table,0,0,tableWidth,0,"type");
types[0] = ds_grid_get(table, column, rowIndex);
column = ds_grid_value_x(table,0,0,tableWidth,0,"subType")
types[1] = ds_grid_get(table, column, rowIndex)
types = scr_GetDropTypes(types);
instance.item[property.type] = types[0]
instance.item[property.subType]	= types[1]
	
// Set new item drop instance's base variables
instance.item[property.sprite]			= asset_get_index(ds_grid_get(table, adb.sprite, rowIndex));
instance.item[property.width]			= ds_grid_get(table, adb.width, rowIndex);
instance.item[property.height]			= ds_grid_get(table, adb.height, rowIndex);
instance.item[property.maxDurability]	= ds_grid_get(table, adb.maxDurability, rowIndex);
instance.item[property.durability]		= irandom_range(1, instance.item[property.maxDurability]);
instance.item[property.defence]			= irandom_range(ds_grid_get(table, adb.minDefence, rowIndex), ds_grid_get(table, adb.maxDefence, rowIndex);
instance.item[property.reqStrength]		= ds_grid_get(table, adb.reqStrength, rowIndex));
instance.item[property.reqLevel]		= ds_grid_get(table, adb.reqLevel, rowIndex));
instance.item[property.maxSockets]		= ds_grid_get(table, adb.maxSockets, rowIndex));
	
// Set new item drop instance's level and rarity multiplier
instance.item[property.itemLevel]		= level;
instance.rarityMultiplier				= rarityMultiplier;

// If item wasn't found in armor DB, check for it in weapons DB next
if (ds_grid_value_exists(idb.weaponDB, 0, 0, 0, ds_grid_height(idb.weaponDB)-1, itemDrop)){
	
	// Get grid size
	tableHeight = ds_grid_height(idb.weaponDB)-1;
	tableWidth = ds_grid_width(idb.weaponDB)-1;
	
	// Get the item's rowIndex within weapons.csv
	rowIndex = ds_grid_value_y(idb.weaponDB, 0, 0, 0, tableHeight, itemDrop);
	show_debug_message("Found the rowIndex for "+itemDrop+"("+string(rowIndex)+") in weapon database.");
	
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
	
else{
	// Get grid size
	tableHeight = ds_grid_height(idb.miscDB)-1;
	tableWidth = ds_grid_width(idb.miscDB)-1;
	
	// Get the item's rowIndex within weapons.csv
	rowIndex = ds_grid_value_y(idb.miscDB, 0, 0, 0, tableHeight, itemDrop);
	show_debug_message("Found the rowIndex for "+itemDrop+"("+string(rowIndex)+") in weapon database.");
	
	// Lookup item's info and store it in a temporary array (in order of the columns in the file)
	for (var p = 0; p < tableWidth; p++){
		dropInfo[p] = ds_grid_get(idb.miscDB, p, rowIndex);
		show_debug_message("Property "+string(p)+": "+dropInfo[p]);
	}
	
	// Get rarity as real number and convert it to the proper enum.
	var _rarity = real(ds_grid_get(idb.miscDB, mscdb.rarity, rowIndex));
	switch _rarity{
		case 0: _rarity = rarity.normal;	break;
		case 1: _rarity = rarity.magic;		break;
		case 2:	_rarity = rarity.rare;		break;
		case 3: _rarity = rarity.set;		break;
		case 4: _rarity = rarity.unique;	break;
	}
	// Convert item's types from string to their enum value
	var types;
	types[0] = ds_grid_get(idb.miscDB, mscdb.type, rowIndex)
	show_debug_message("type is: "+types[0]);
	types[1] = ds_grid_get(idb.miscDB, mscdb.subtype, rowIndex)
	show_debug_message("subType is: "+types[1]);
	types = scr_GetDropTypes(types);

	// Set new item drop instance's base variables
	instance.item[property.name]			= ds_grid_get(idb.miscDB, mscdb.name, rowIndex);
	instance.item[property.treasureClass]	= 0;
	instance.item[property.rarity]			= _rarity;
	instance.item[property.type]			= types[0]
	instance.item[property.subType]			= types[1]
	instance.item[property.sprite]			= asset_get_index(ds_grid_get(idb.miscDB, mscdb.sprite, rowIndex));
	instance.item[property.subTitle]		= ds_grid_get(idb.miscDB, mscdb.subTitle, rowIndex);
	instance.item[property.width]			= real(ds_grid_get(idb.miscDB, mscdb.width, rowIndex));
	instance.item[property.height]			= real(ds_grid_get(idb.miscDB, mscdb.height, rowIndex));
	if (ds_grid_get(idb.miscDB, mscdb.magic1stat, rowIndex) != "-1"){
		instance.item[property.magic1stat]		= scr_GetStatEnumFromString(ds_grid_get(idb.miscDB, mscdb.magic1stat, rowIndex));
		instance.item[property.magic1value]		= real(ds_grid_get(idb.miscDB, mscdb.magic1value, rowIndex));
		instance.item[property.magic1string]	= ds_grid_get(idb.miscDB, mscdb.magic1string, rowIndex);
		instance.item[property.magic2stat]		= scr_GetStatEnumFromString(ds_grid_get(idb.miscDB, mscdb.magic2stat, rowIndex));
		instance.item[property.magic2value]		= real(ds_grid_get(idb.miscDB, mscdb.magic2value, rowIndex));
		instance.item[property.magic2string]	= ds_grid_get(idb.miscDB, mscdb.magic2string, rowIndex);
		instance.item[property.magic3stat]		= scr_GetStatEnumFromString(ds_grid_get(idb.miscDB, mscdb.magic3stat, rowIndex));
		instance.item[property.magic3value]		= real(ds_grid_get(idb.miscDB, mscdb.magic3value, rowIndex));
		instance.item[property.magic3string]	= ds_grid_get(idb.miscDB, mscdb.magic3string, rowIndex);
		instance.item[property.magic4stat]		= scr_GetStatEnumFromString(ds_grid_get(idb.miscDB, mscdb.magic4stat, rowIndex));
		instance.item[property.magic4value]		= real(ds_grid_get(idb.miscDB, mscdb.magic4value, rowIndex));
		instance.item[property.magic4string]	= ds_grid_get(idb.miscDB, mscdb.magic4string, rowIndex);
	}
	
	// Set new item drop instance's level and rarity multiplier
	instance.item[property.itemLevel]		= level;
	instance.rarityMultiplier				= rarityMultiplier;
}