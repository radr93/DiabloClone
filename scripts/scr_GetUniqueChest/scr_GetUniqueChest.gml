/*

Syntax:
scr_GetUniqueChest(item[]);

item[]	The item's properties array

This script checks if an item that rolls unique actually has a real unique item.

*/

var item;
item = argument0;

// Quilted Armor
if (item[property.object] == obj_QuiltedArmor){
	item[property.title] = "Arctic Furs";
	item[property.reqLevel] = 2;
	item[property.magic1stat]	= stat.enhancedDefence;
	item[property.magic1value]	= irandom_range(275, 325);
	item[property.magic1string] = scr_GetStatString(item[property.magic1stat], item[property.magic1value], item[property.magic1value2]);
	item[property.magic2stat]	= stat.allResist;
	item[property.magic2value]	= 10;
	item[property.magic2string] = scr_GetStatString(item[property.magic2stat], item[property.magic2value], item[property.magic2value2]);
	return(item);
}

else{
	// No item found for this object at this item level
	return(-1);	
}