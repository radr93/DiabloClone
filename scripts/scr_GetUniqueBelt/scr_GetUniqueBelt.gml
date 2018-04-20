/*

Syntax:
scr_GetUniqueBelt(item[]);

item[]	The item's properties array

This script checks if an item that rolls unique actually has a real unique item.

*/

var item;
item = argument0;

// Ring
if (item[property.object] == obj_Sash){
	item[property.name] = "The String of Ears\nSash";
	return(item);
}

else{
	// No item found for this object at this item level
	return(-1);	
}