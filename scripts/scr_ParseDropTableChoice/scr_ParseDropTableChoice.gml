/*

Syntax:
scr_ParseDropTableChoice(choice);

choice	The string of what was selected from the drop table

Returns:
If choice was another treasure class, returns 0.
If choice was a valid item, returns 1.

*/

// Initialize Variables
var tcdb, tcAsString, tcNumber;

tcdb		 = obj_TreasureClassDatabase;
tcAsString	 = argument0;

if (string_pos("armor", tcAsString)){
	return(0);
}

else if (string_pos("weapon", tcAsString)){
	return(0);
}

else if (string_pos("misc", tcAsString)){
	return(0);
}
else if (string_pos("runes", tcAsString)){
	return(0);
}
else if (string_pos("potions", tcAsString)){
	return(0);
}
else if (string_pos("jewelry", tcAsString)){
	return(0);
}


// Not a drop table
else{
	return(1);
}