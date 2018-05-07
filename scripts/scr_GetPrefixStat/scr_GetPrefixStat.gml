/*

Syntax:
scr_GetPrefixStat(itemLevel, type, subType);

itemLevel	The item's level
type		The item's type
subType		The item's subType

This script gets an appropriate prefix for an item based on it's type and level

*/

// Initialize Variables
var iLvl, itemType, itemSubType, prefixRoll
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
				prefixRoll = scr_GetPrefixStatHead(iLvl);
				return(prefixRoll);
			case armor.chest:
				prefixRoll = scr_GetPrefixStatChest(iLvl);
				return(prefixRoll);
			case armor.shield:
				prefixRoll = scr_GetPrefixStatShield(iLvl);
				return(prefixRoll);
			case armor.hands:
				prefixRoll = scr_GetPrefixStatHands(iLvl);
				return(prefixRoll);
			case armor.belt:
				prefixRoll = scr_GetPrefixStatBelt(iLvl);
				return(prefixRoll);
			case armor.feet:
				prefixRoll = scr_GetPrefixStatFeet(iLvl);
				return(prefixRoll);
		}
	// If weapon
	case type.weapon:
		// Get property and return variable
		prefixRoll = scr_GetPrefixStatWeapon(iLvl);
		return(prefixRoll);
	// If jewelry
	case type.misc:
		// Check subType, get property and return variable
		switch (itemSubType){
			case misc.neck:
				prefixRoll = scr_GetPrefixStatNeck(iLvl);
				return(prefixRoll);
			case misc.ring:
				prefixRoll = scr_GetPrefixStatRing(iLvl);
				return(prefixRoll);
		}
}
show_debug_message(	"\n### ERROR scr_GetPrefixStat line 63 ####\n"+
					"Did not retrieve a valid prefix for:\n"+
					"itemType: "+string(itemType)+"\n"+
					"itemSubType: "+string(itemSubType)+"\n\n");