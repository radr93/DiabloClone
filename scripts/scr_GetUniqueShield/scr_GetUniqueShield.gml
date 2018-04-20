/*

Syntax:
scr_GetUniqueShield(item[]);

item[]	The item's properties array

This script checks if an item that rolls unique actually has a real unique item.

*/

var item;
item = argument0;

// Buckler
if (item[property.object] == obj_Buckler){
	item[property.name] = "Pelta Lunata\nBuckler";
	return(item);
}

else{
	// No item found for this object at this item level
	return(-1);	
}