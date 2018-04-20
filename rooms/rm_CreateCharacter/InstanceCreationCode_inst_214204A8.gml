// Go back a screen
text = "BACK";
// If you have saved characters, go to select character screen
if (global.saveSlotsUsed > 0){
	roomTarget = rm_SelectCharacter;
}
else{ // Otherwise go to main menu
	roomTarget = rm_MainMenu;
}