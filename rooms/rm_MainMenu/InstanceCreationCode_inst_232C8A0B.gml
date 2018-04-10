// Enter game
text = "ENTER GAME";
// If there is already 1 or more files saved
if (global.saveSlot[0] != ""){
	// Go to select character screen
	roomTarget = rm_SelectCharacter;
}
else{ // Otherwise go to create character screen
	roomTarget = rm_CreateCharacter;
}
