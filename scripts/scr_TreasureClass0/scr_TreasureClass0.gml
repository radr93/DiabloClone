/*

Syntax:
scr_TreasureClass0();

This is used to determine which items drop from treasure class 0, and returns the
item drop in the form of an object name from the resource tree or -1 if no drop is
selected.

*/

var pick, drop;
pick = choose(1, 2, 3, 4, 5);

// No Drop! (picks 1-3)
if (pick < 4){
	return(-1);
}

// Drop a potion or gold (pick 4)
else if (pick == 4){
	pick = choose(1, 2);
	if (pick == 1){
		return(obj_MinorHealth);
	}
	else{
		return(obj_MinorMana);
	}
}
// Drop armor/weapon/rune (pick 5)
else if (pick == 5){
	pick = choose(1, 2, 3, 4, 5, 6, 7, 8);
	// Armor 
	if (pick == 1){
		return(obj_QuiltedTunic);
	}

	else if (pick == 2){
		return(obj_Buckler);
	}

	else if (pick == 3){
		return(obj_Sash);
	}

	else if (pick == 4){
		return(obj_Hood);
	}

	else if (pick == 5){
		return(obj_LeatherShoes);
	}

	// Weapons
	else if (pick == 6){
		return(obj_ShortSword);
	}

	else if (pick == 7){
		return(obj_Axe);
	}
	
	// Runes
	else if (pick == 8){
		if (0.20 >= random(1)){
			return(obj_BeiRune);
		}
		else if (0.20 >= random(1)){
			return(obj_AhRune);
		}
		else{
			return(-1);
		}
	}
}