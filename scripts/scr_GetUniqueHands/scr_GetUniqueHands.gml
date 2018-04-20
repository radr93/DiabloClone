/*

Syntax:
scr_GetUniqueHands(item[]);

item[]	The item's properties array

This script checks if an item that rolls unique actually has a real unique item.

*/

var item;
item = argument0;

// Gauntlets
if (item[property.object] == obj_Gauntlets){
	item[property.name] = "Frostburn\nGauntlets";
	return(item);
}

else{
	// No item found for this object at this item level
	return(-1);	
}