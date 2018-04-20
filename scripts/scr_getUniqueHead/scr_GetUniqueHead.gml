/*

Syntax:
scr_GetUniqueHead(item[]);

item[]	The item's properties array

This script checks if an item that rolls unique actually has a real unique item.

*/

var item;
item = argument0;

// Leather Cap
if (item[property.object] == obj_LeatherCap){
	item[property.name] = "Biggin's Bonnet\nLeather Cap";
	return(item);
}

else{
	// No item found for this object at this item level
	return(-1);	
}