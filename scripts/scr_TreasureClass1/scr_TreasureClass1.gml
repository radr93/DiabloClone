/*

Syntax:
scr_TreasureClass1();

This is used to determine which items drop from treasure class 1, and returns the
item drop in the form of an object name from the resource tree or -1 if no drop is
selected.

*/

var pick, drop;
pick = choose(1, 2, 3, 4, 5, 6);

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

// Drop an item
else if (pick == 5){
	pick = choose(1, 2, 3, 4, 5, 6, 7, 8, 9);
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
	else if (pick == 6){
		return(obj_Ring);
	}
	else if (pick == 7){
		return(obj_Gauntlets);
	}
	else if (pick == 8){
		return(obj_ChainMail);
	}
	else if (pick == 9){
		if (0.20 >= random(1)){
			return(obj_CehRune);
		}
		else if (0.20 >= random(1)){
			return(obj_DehRune);
		}
		else{
			return(-1);
		}
	}
}

else if (pick == 6){
	drop = scr_TreasureClass0();
	return(drop);
}