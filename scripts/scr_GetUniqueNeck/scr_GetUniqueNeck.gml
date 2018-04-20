/*

Syntax:
scr_GetUniqueNeck(item[]);

item[]	The item's properties array

This script checks if an item that rolls unique actually has a real unique item.

*/

var item;
item = argument0;

// Amulet
if (item[property.object] == obj_Amulet){
	item[property.name] = "Saracen's Chance\nAmulet";
	return(item);
}

else{
	// No item found for this object at this item level
	return(-1);	
}