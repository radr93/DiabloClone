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
	item[property.name] = "Arctic Furs\nQuilted Armor";
	return(item);
}

else{
	// No item found for this object at this item level
	return(-1);	
}