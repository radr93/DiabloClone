/// @description Generate Properties
/*

This alarm exists so the monster/chest rarity rarityMultiplier and the item's level
are assigned before generating properties for the first time.

*/
// If rarity wasn't changed in the create event (i.e. runes, potions etc.)
if (item[property.rarity] == -1){
	// Roll item rarity
	item[property.rarity] = scr_GetRarity(rarityMultiplier, obj_PlayerController.stats[stat.magicFind]);
	// Chance to roll ethereal
	if (item[property.type] == type.armor or item[property.type] == type.weapon){
		if (0.05 >= random(1)){
			item[property.ethereal] = true;
			// If Armor
			if (item[property.type] == type.armor){
				item[property.defence] = round(item[property.defence]*1.5);
			}
			// If Weapon
			else if (item[property.type] == type.weapon){
				item[property.minDamage] = round(item[property.minDamage]*1.5);
				item[property.maxDamage] = round(item[property.maxDamage]*1.5);
			}
		}
	}
	// If normal rarity
	if (item[property.rarity] == rarity.normal){
		item = scr_InitializeNormal(item);
	}
	// If magic rarity
	if (item[property.rarity] == rarity.magic){
		item = scr_InitializeMagic(item);
	}
	// If unique rarity
	if (item[property.rarity] == rarity.unique){
		var uniqueArray = scr_GetUnique(item);
		// No unique for the item at this item level
		if (uniqueArray == -1){
			item[property.rarity] = rarity.rare;
			if (item[property.maxDurability] != -1){
				item[property.maxDurability] = item[property.maxDurability]*3
				item[property.durability] = irandom_range(1, item[property.maxDurability]);
			}
			show_debug_message("\n"+item[property.name]+" rolled unique but no unique counterpart found at iLvl "+string(item[property.itemLevel])+". Converting to rare.")
		}
		// Correctly rolled unique, absorb unique's stats
		else{
			item = uniqueArray;
			show_debug_message("\n"+item[property.name]+" rolled unique - item is "+item[property.title]);
		}
		
	}
	// If rare rarity
	if (item[property.rarity] == rarity.rare){
		item = scr_InitializeRare(item);
	}
}

// Loop through item's properties and add enhanced def/damage etc. to base item stats
item = scr_UpdateItem(item);

// Get item tooltip
item[property.tooltip] = scr_GetTooltip(item);