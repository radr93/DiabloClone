/*

Syntax:
scr_GetUniqueNeck(item[]);

item[]	The item's properties array

This script checks if an item that rolls unique actually has a real unique item.

*/

var item;
item = argument0;

// Amulet
if (item[property.sprite] == spr_Amulet){
	item[property.title] = "Mara's Kaleidoscope";
	item[property.reqLevel] = 67;
	item[property.magic1stat]	= stat.allSkills;
	item[property.magic1value]	= 2;
	item[property.magic1string] = scr_GetStatString(item[property.magic1stat], item[property.magic1value], item[property.magic1value2]);
	item[property.magic2stat]	= stat.allResist;
	item[property.magic2value]	= irandom_range(20,30);
	item[property.magic2string] = scr_GetStatString(item[property.magic2stat], item[property.magic2value], item[property.magic2value2]);
	item[property.magic3stat]	= stat.allAttributes;
	item[property.magic3value]	= 5;
	item[property.magic3string] = scr_GetStatString(item[property.magic3stat], item[property.magic3value], item[property.magic3value2]);
	return(item);
}

else{
	// No item found for this object at this item level
	return(-1);	
}