/*

Syntax:
scr_GetDrop(level, treasureClass);

level			The level of the drop source
treasureClass	The treasure class of the drop source

This script uses the level and treasure class of the drop source to determine
which item should be dropped.

*/

var level, tc, drop;
level = argument0;
tc = argument1;

if (.10 >= random(1)){
	drop = scr_GetRune(level);
	return(drop);
}
if (tc == 0){
	drop = scr_TreasureClass0();
	return(drop);
}

else if (tc == 1){
	drop = scr_TreasureClass1();
	return(drop);
}

else{
	show_debug_message("scr_GetDrop didn't return a drop! Treasure Class used was tc"+string(tc))
}