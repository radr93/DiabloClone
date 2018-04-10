/// @description Initialize Variables

/* 
To use a button, drag it into the room and in it's instance creation code,
provide a string as the variable "text" and a destination room as the
variable "roomTarget" like so:
	text = "MAIN MENU";
	roomTarget = rm_MainMenu;
*/


// Get parent event and choose box sprite size
event_inherited();
sprite = spr_ButtonLarge;