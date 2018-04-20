/*

Syntax:
scr_RunesLow(level);

level	The level of the drop source

This script is returns a random low rune up to the level of the drop
source.

*/

var level = argument0;

if (level >= 6){
	if (.10 >= random(1)){
		return(obj_EffRune);
	}
}
if (level >= 5){
	if (.10 >= random(1)){
		return(obj_EuhRune);
	}
}
if (level >= 4){
	if (.10 >= random(1)){
		return(obj_DehRune);
	}
}
if (level >= 3){
	if (.10 >= random(1)){
		return(obj_CehRune);
	}
}
if (level >= 2){
	if (.10 >= random(1)){
		return(obj_BeiRune);
	}
}
else{
	if (.10 >= random(1)){
		return(obj_AhRune);
	}
}