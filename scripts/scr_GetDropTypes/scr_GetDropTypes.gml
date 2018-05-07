/*

Syntax:
scr_getDropTypes(treasureClass);

drop = A temporary item array that contains type and subType as a string

This script converts an item's type and subType strings to the corresponding enums
values. Returns the same array back with enum values instead of strings.

i.e
argument0[0] = "armor";
argument0[1] = "chest";
would return
return[0] = type.armor;
return[1] = armor.chest;

*/

var types;
types = argument0;
show_debug_message("\nConverting Types from string to enum...");
show_debug_message("types[type] = "+string(types[0]));
show_debug_message("types[subType] = "+string(types[1])+"\n");

// Loop through types
switch types[0]{
	case "armor":
		// Type is armor
		types[0] = type.armor;
		// Loop through subTypes
		switch types[1]{
			case "head":
				types[1] = armor.head;	return (types);
			case "chest":
				types[1] = armor.chest; return (types);
			case "shield":
				types[1] = armor.shield;return (types);
			case "hands":
				types[1] = armor.hands; return (types);
			case "belt":
				types[1] = armor.belt;	return (types);
			case "feet":
				types[1] = armor.feet;	return (types);
		}
	case "weapon":
		// Type is weapon
		types[0] = type.weapon;
		// Loop through subTypes
		switch types[1]{
			case "axe":
				types[1] = weapon.axe;		return (types);
			case "bow":
				types[1] = weapon.bow;		return (types);
			case "crossbow":
				types[1] = weapon.crossbow; return (types);
			case "dagger":
				types[1] = weapon.dagger;	return (types);
			case "javelin":
				types[1] = weapon.javelin;	return (types);
			case "mace":
				types[1] = weapon.mace;		return (types);
			case "polearm":
				types[1] = weapon.polearm;	return (types);
			case "spear":
				types[1] = weapon.spear;	return (types);
			case "staff":
				types[1] = weapon.staff;	return (types);
			case "sword":
				types[1] = weapon.sword;	return (types);
			case "wand":
				types[1] = weapon.wand;		return (types);
		}
	case "misc":
		// Type is jewelry
		types[0] = type.misc;
		// Loop through subTypes
		switch types[1]{
			case "gold":
				types[1] = misc.gold; return (types);
			case "potion":
				types[1] = misc.potion; return (types);
			case "neck":
				types[1] = misc.neck; return (types);
			case "ring":
				types[1] = misc.ring; return (types);
			case "rune":
				types[1] = misc.rune; return (types);
		}
}
show_debug_message("scr_GetDropTypes is not correctly getting types based on the input array");