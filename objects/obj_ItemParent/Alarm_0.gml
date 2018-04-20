/// @description Generate Properties
/*

This alarm exists so the monster/chest rarity rarityMultiplier and the item's level
are assigned before generating properties.

*/
// Roll item rarity
item[property.rarity] = scr_GetRarity(rarityMultiplier, obj_PlayerController.stats[stat.magicFind]);

// Chance to roll ethereal
if (0.05 >= random(1)){
	if (item[property.type] != type.misc and item[property.type] != type.neck and item[property.type] != type.ring){
		item[property.ethereal] = true;
	}
}

// If unique rarity
if (item[property.rarity] == rarity.unique){
	var uniqueArray = scr_GetUnique(item);
	// No unique for the item at this item level
	if (uniqueArray == -1){
		show_debug_message("ROLLED A UNIQUE BUT IT DOESN'T HAVE A UNIQUE COUNTERPART AT THIS iLVL")
		item[property.rarity] = rarity.rare;
	}
	else{
		item = uniqueArray;
	}
		
}

// If rare rarity
if (item[property.rarity] == rarity.rare){
	
}

// If magic rarity
else if (item[property.rarity] == rarity.magic){
	
}

// If normal rarity
if (item[property.rarity] == rarity.normal){
	// Chance at socketed
	if (item[property.type] == type.head or item[property.type] == type.chest or
		item[property.type] == type.weapon or item[property.type] == type.shield){
		if (0.25 <= random(1)){
			item[property.socketed] = true;
			item[property.sockets] = scr_GetSockets(item[property.itemLevel], item[property.maxSockets]);
			show_debug_message("Generated socketed item with "+string(item[property.sockets])+" sockets.");
		}
	}
}
item[property.tooltip] = scr_GetTooltip(item);