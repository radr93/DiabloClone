/*

Syntax:
scr_TreasureClassStringToGrid(tcString);

tcString	The string to convert to a corresponding ds grid id

Returns:
Id of the ds grid that corresponds with the treasure class string
provided as an argument.

e.g.
argument0 = armor6
returns(tcdb.armorTable[6])

*/

// Initialize Variables
var tcdb, tcAsString, tableNumber;

tcdb		 = obj_TreasureClassDatabase;
tcAsString	 = argument0;
tableNumber	 = real(string_digits(tcAsString));

if (string_pos("armor", tcAsString)){
	return(tcdb.armorTable[tableNumber]);
}

else if (string_pos("weapon", tcAsString)){
	return(tcdb.weaponTable[tableNumber]);
}

else if (string_pos("misc", tcAsString)){
	return(tcdb.miscTable[tableNumber]);
}
else if (string_pos("runes", tcAsString)){
	return(tcdb.runeTable[tableNumber]);
}
else if (string_pos("potions", tcAsString)){
	return(tcdb.potionTable[tableNumber]);
}
else if (string_pos("jewelry", tcAsString)){
	return(tcdb.jewelryTable[tableNumber]);
}