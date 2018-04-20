/*

Syntax:
scr_TreasureClass1();

This is used to determine which items drop from treasure class 1, and returns the
item drop in the form of an object name from the resource tree or -1 if no drop is
selected.

*/

var pick, drop;
pick = choose(1, 2, 3, 4, 5);

// No Drop! (picks 1-2)
if (pick == 1){
	return(-1);
}
else if (pick == 2){
	return(-1);
}

// Drop from misc loot table (picks 3-4)
else if (pick == 3){
	drop = scr_TreasureClass0();
	return(drop);
}
else if (pick == 4){
	drop = scr_TreasureClass0();
	return(drop);
}

// Drop an item
else if (pick == 5){
	pick = choose(1, 2, 3, 4, 5, 6, 7);
	// Armor 
	if (pick == 1){
		return(obj_Helm);
	}

	else if (pick == 2){
		return(obj_Poleaxe);
	}

	else if (pick == 3){
		return(obj_CrystalSword);
	}

	else if (pick == 4){
		return(obj_KiteShield);
	}

	else if (pick == 5){
		return(obj_Amulet);
	}

	// Weapons
	else if (pick == 6){
		return(obj_Ring);
	}

	else if (pick == 7){
		return(obj_Gauntlets);
	}
	else{
		show_debug_message("scr_TreasureClass1 didn't return a drop! Pick # was "+string(pick))
	}
}

else{
	show_debug_message("scr_TreasureClass1 didn't return a drop! Pick # was "+string(pick))
}