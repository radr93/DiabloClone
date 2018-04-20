/*

Syntax:
scr_GetUniqueFeet(item[]);

item[]	The item's properties array

This script checks if an item that rolls unique actually has a real unique item.

*/

var item;
item = argument0;

// Leather Boots
if (item[property.object] == obj_LeatherBoots){
	item[property.name] = "Infernostride\nLeather Boots";
	return(item);
}

else{
	// No item found for this object at this item level
	return(-1);	
}