/*

Syntax:
scr_GetRarity(baseChance, playerMF);

baseChance	The drop source's base chance multiplier to drop a magic item
			1 = normal, 2 = 2x chance, 3 = 3x chance etc..
playerMF	The amount of bonus magic find % the player has


This script uses the the player's magic find % and the monster's base chance to
drop a magic item to determine which rarity the item rolls.

*/

// Initialize Variables
var playerMF, baseChance, magicDropRate, rareDropRate, setDropRate, uniqueDropRate;

baseChance = argument0;		// player's total mf %
playerMF = argument1;		// drop source's base chance multiplier

magicDropRate = (15/100);	// base frequency of magic rarity
rareDropRate = (3/100);		// base frequency of rare rarity
setDropRate = (1/100);
uniqueDropRate = (1/100);	// base frequency of unique rarity

// Convert MF and total real drop rates
// Always give at least 100% chance of base frequency (cannot be under 100%)
// i.e. playerMF at 86% actually yields 186% chance as it's 86% bonus above standard 100%
playerMF = 1+(playerMF/100);							// total playerMF = 1+(86/100) which would be 1.86 or 86% increase
magicDropRate = (magicDropRate*baseChance)*playerMF;	// total frequency of magic rarity
rareDropRate = (rareDropRate*baseChance)*playerMF;		// total frequency of rare rarity
uniqueDropRate = (uniqueDropRate*baseChance)*playerMF;	// total frequency of unique rarity

// Rolls for unique first
if (uniqueDropRate >= random(1)){
	return(rarity.unique);
}
// If it didn't roll unique, try to roll a set
if (uniqueDropRate >= random(1)){
	return(rarity.set);
}
// If it didn't roll set, try to roll a rare
else if (rareDropRate >= random(1)){
	return(rarity.rare);
}
// If it didn't roll rare, try to roll a magic item
else if (magicDropRate >= random(1)){
	return(rarity.magic);
}
// If none of the above, roll a default normal item
else{
	return(rarity.normal);
}



