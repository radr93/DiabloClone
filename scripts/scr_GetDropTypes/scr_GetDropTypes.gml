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
show_debug_message("\n## CONVERTING TYPES #####\n");
show_debug_message("types[type] = "+string(types[0]));
show_debug_message("types[subType] = "+string(types[1]));
show_debug_message("\n###########################\n");

// Loop through types
switch types[0]{
	case "armor":
		// Type is armor
		types[0] = type.armor;
		// Loop through subTypes
		switch types[1]{
			case "head":
				types[1] = armor.head; return (types);
			case "chest":
				types[1] = armor.chest; return (types);
			case "shield":
				types[1] = armor.shield; return (types);
			case "hands":
				types[1] = armor.hands; return (types);
			case "belt":
				types[1] = armor.belt; return (types);
			case "feet":
				types[1] = armor.feet; return (types);
		}
	case "weapon":
		// Type is weapon
		types[1] = type.weapon;
		// Loop through subTypes
		switch types[1]{
			case "sword":
				types[1] = weapon.sword; return (types);
			case "axe":
				types[1] = weapon.axe; return (types);
			case "polearm":
				types[1] = weapon.polearm; return (types);
		}
	case "jewelry":
		// Type is jewelry
		types[1] = type.jewelry;
		// Loop through subTypes
		switch types[1]{
			case "neck":
				types[1] = jewelry.neck; return (types);
			case "ring":
				types[1] = jewelry.ring; return (types);
		}
}
show_debug_message("scr_GetDropTypes is not correctly getting types based on the input array");