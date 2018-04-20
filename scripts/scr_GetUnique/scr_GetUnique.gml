/*

Syntax:
scr_GetUnique(item[]);

item[]	The item's properties array

This script checks if an item that rolls unique actually has a real unique item.

*/

var item, roll;
item = argument0;

if (item[property.type] == type.head){
	roll = scr_GetUniqueHead(item);
}
else if (item[property.type] == type.neck){
	roll = scr_GetUniqueNeck(item);
}
else if (item[property.type] == type.weapon){
	return(-1);
	roll = scr_GetUniqueWeapon(item);
}
else if (item[property.type] == type.chest){
	roll = scr_GetUniqueChest(item);
}
else if (item[property.type] == type.shield){
	roll = scr_GetUniqueShield(item);
}
else if (item[property.type] == type.hands){
	roll = scr_GetUniqueHands(item);
}
else if (item[property.type] == type.ring){
	roll = scr_GetUniqueRing(item);
}
else if (item[property.type] == type.belt){
	roll = scr_GetUniqueBelt(item);
}
else if (item[property.type] == type.feet){
	roll = scr_GetUniqueFeet(item);
}
else{
	roll = -1;
}

return(roll);