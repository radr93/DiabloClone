/*

Syntax:
scr_InitializeNormal(item);

item	The array that holds all of the item's information

This script changes variables on the item array to suit that of a normal item
such as chances at rolling sockets, and also converting items that can't roll
normal rarity such as ring and neck to magic rarity.

*/

var item = argument0;

show_debug_message("\n"+item[property.name]+" rolled normal.");

// Convert jewelry to magic rarity
if (item[property.type] == type.jewelry){
	show_debug_message("\nJewelry cannot roll normal quality. Converting to magic.");
	item[property.rarity] = rarity.magic;
}

// Chance at sockets on head, weapon, chest, and shield
if (item[property.type] == type.armor){
	if (item[property.subType] == armor.head or item[property.subType] == armor.chest
	 or item[property.subType] == armor.shield){
		if (0.25 <= random(1)){
			item[property.socketed] = true;
			item[property.sockets] = scr_GetSockets(item[property.maxSockets]);
			show_debug_message("It was generated with "+string(item[property.sockets])+" sockets.");
		}
	}
}
else if (item[property.type] == type.weapon){
	if (0.25 <= random(1)){
		item[property.socketed] = true;
		item[property.sockets] = scr_GetSockets(item[property.maxSockets]);
		show_debug_message("It was generated with "+string(item[property.sockets])+" sockets.");
	}
}

// Return Array
return(item);