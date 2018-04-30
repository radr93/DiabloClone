/*

Syntax:
scr_InitializeMagic(item);

item	The array that holds all of the item's information

This script changes variables on the item array to suit that of a magic item
such as adding prefixes and/or suffixes.

*/

var item, chance;
item = argument0;
chance = choose(1, 2, 3);

show_debug_message("\n"+item[property.name]+" rolled magic. Chance was "+string(chance)+". (1 = prefix, 2 = suffix, 3 = both)");
// Get Prefix Only
if (chance == 1){
	item[property.magic1stat]	= scr_GetPrefixStat(item[property.itemLevel],  item[property.type], item[property.subType]);
	item[property.magic1value]	= scr_GetStatValue (item[property.magic1stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic1value2] = scr_GetStatValue2(item[property.magic1stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic1string] = scr_GetStatString(item[property.magic1stat], item[property.magic1value], item[property.magic1value2]);
	item[property.prefix]		= scr_GetPrefixText(item[property.magic1stat], item[property.magic1value]);
}
// Get Suffix Only
else if (chance == 2){
	item[property.magic1stat]	= scr_GetSuffixStat(item[property.itemLevel],  item[property.type], item[property.subType]);
	item[property.magic1value]	= scr_GetStatValue (item[property.magic1stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic1value2] = scr_GetStatValue2(item[property.magic1stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic1string] = scr_GetStatString(item[property.magic1stat], item[property.magic1value], item[property.magic1value2]);
	item[property.suffix]		= scr_GetSuffixText(item[property.magic1stat], item[property.magic1value]);
}
// Get Prefix and Suffix
else if (chance == 3){
	item[property.magic1stat]	= scr_GetPrefixStat(item[property.itemLevel],  item[property.type], item[property.subType]);
	item[property.magic1value]	= scr_GetStatValue (item[property.magic1stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic1value2] = scr_GetStatValue2(item[property.magic1stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic1string] = scr_GetStatString(item[property.magic1stat], item[property.magic1value], item[property.magic1value2]);
	item[property.prefix]		= scr_GetPrefixText(item[property.magic1stat], item[property.magic1value]);
			
	item[property.magic2stat]	= scr_GetSuffixStat(item[property.itemLevel],  item[property.type], item[property.subType]);
	item[property.magic2value]	= scr_GetStatValue (item[property.magic2stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic2value2] = scr_GetStatValue2(item[property.magic2stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic2string] = scr_GetStatString(item[property.magic2stat], item[property.magic2value], item[property.magic2value2]);
	item[property.suffix]		= scr_GetSuffixText(item[property.magic2stat], item[property.magic2value]);
}
// Get Level Requirement
var propArray = scr_GetPropertiesAsArray(item);
var levelReq = scr_GetReqLevel(propArray);
if (levelReq > item[property.reqLevel]){
	item[property.reqLevel] = levelReq;
}

// Return item array
return(item);