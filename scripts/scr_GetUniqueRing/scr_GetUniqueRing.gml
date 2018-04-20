/*

Syntax:
scr_GetUniqueRing(item[]);

item[]	The item's properties array

This script checks if an item that rolls unique actually has a real unique item.

*/

var item;
item = argument0;

// Ring
if (item[property.object] == obj_Ring){
	item[property.name] = "Stone of Jordan\nRing";
	return(item);
}

else{
	// No item found for this object at this item level
	return(-1);	
}