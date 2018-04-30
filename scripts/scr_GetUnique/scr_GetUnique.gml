/*

Syntax:
scr_GetUnique(item[]);

item[]	The item's properties array

This script checks if an item that rolls unique actually has a real unique item.

*/

var item, roll;
item = argument0;
roll = -1;			// -1 = no unique counterpart for this item, otherwise holds an array with 
					// the unique item's properties
	
if (item[property.type] == type.armor){
	if (item[property.subType] == armor.head){
		roll = scr_GetUniqueHead(item);
	}
	else if (item[property.subType] == armor.chest){
		roll = scr_GetUniqueChest(item);
	}
	else if (item[property.subType] == armor.shield){
		roll = scr_GetUniqueShield(item);
	}
	else if (item[property.subType] == armor.hands){
		roll = scr_GetUniqueHands(item);
	}
	else if (item[property.subType] == armor.belt){
		roll = scr_GetUniqueBelt(item);
	}
	else if (item[property.subType] == armor.feet){
		roll = scr_GetUniqueFeet(item);
	}
}
else if (item[property.type] == type.weapon){
	if (item[property.subType] == weapon.sword){
		// roll = scr_GetUniqueSword(item);
	}
	else if (item[property.subType] == weapon.axe){
		// roll = scr_GetUniqueAxe(item);
	}
	else if (item[property.subType] == weapon.polearm){
		// roll = scr_GetUniquePolearm(item);
	}
}
else if (item[property.type] == type.jewelry){
	if (item[property.subType] == jewelry.neck){
		roll = scr_GetUniqueNeck(item);
	}
	else if (item[property.subType] == jewelry.ring){
		roll = scr_GetUniqueRing(item);
	}
}

return(roll);