/*

Syntax:
scr_GetSuffixStat(itemLevel, type, subType);

itemLevel	The item's level
type		The item's type
subType		The item's subType

This script gets an appropriate suffix for an item based on it's type and level

*/

// Initialize Variables
var iLvl, itemType, itemSubType, suffixRoll
iLvl = argument0;
itemType = argument1;
itemSubType = argument2;

// Check item type
switch (itemType){
	// If armor
	case type.armor:
		// Check subType, get property and return variable
		switch (itemSubType){
			case armor.head:
				suffixRoll = scr_GetSuffixStatHead(iLvl);
				return(suffixRoll);
			case armor.chest:
				suffixRoll = scr_GetSuffixStatChest(iLvl);
				return(suffixRoll);
			case armor.shield:
				suffixRoll = scr_GetSuffixStatShield(iLvl);
				return(suffixRoll);
			case armor.hands:
				suffixRoll = scr_GetSuffixStatHands(iLvl);
				return(suffixRoll);
			case armor.belt:
				suffixRoll = scr_GetSuffixStatBelt(iLvl);
				return(suffixRoll);
			case armor.feet:
				suffixRoll = scr_GetSuffixStatFeet(iLvl);
				return(suffixRoll);
		}
	// If weapon
	case type.weapon:
		// Get property and return variable
		suffixRoll = scr_GetSuffixStatWeapon(iLvl);
		return(suffixRoll);
	// If jewelry
	case type.jewelry:
		// Check subType, get property and return variable
		switch (itemSubType){
			case jewelry.neck:
				suffixRoll = scr_GetSuffixStatNeck(iLvl);
				return(suffixRoll);
			case jewelry.ring:
				suffixRoll = scr_GetSuffixStatRing(iLvl);
				return(suffixRoll);
		}
}
show_debug_message(	"\n### ERROR scr_GetSuffixStat line 63 ####\n"+
					"Did not retrieve a valid prefix for:\n"+
					"itemType: "+string(itemType)+"\n"+
					"itemSubType: "+string(itemSubType)+"\n\n");