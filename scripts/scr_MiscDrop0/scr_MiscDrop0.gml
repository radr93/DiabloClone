/*

Syntax:
scr_MiscDrop(treasureClass);

treasureClass	The treasure class calling for a misc item drop

This script is used when a treasure class script lands on a misc drop roll.
It returns the item drop in the form of an object name from the resource tree,
or -1 if no drop is selected.

*/

var pick = choose(1, 2);

if (pick == 1){
	return(obj_MinorHealth);
}
	
else if (pick == 2){
	return(obj_MinorMana);
}