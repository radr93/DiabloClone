/// @description Load the Game

// When player hits enter or double clicks on a save slot, loads selected file
// (double click code is located in obj_SelectCharacterButton)
if (keyboard_check_pressed(input.enter)){
	loadFile = true;
}

// Change selections
if (keyboard_check_pressed(input.upArrow)){
	if (selected == 0 and global.saveSlot[6] != "") then selected = 6;
	else if (selected == 1 and global.saveSlot[7] != "") then selected = 7;
	else if (selected > 1) then selected -= 2;
}
else if (keyboard_check_pressed(input.downArrow)){
	if (selected == 6) then selected = 0;
	else if (selected == 7) then selected = 1;
	else if (selected < 6){
		if (global.saveSlot[selected+2] != "") then selected += 2;
	}
}
else if (keyboard_check_pressed(input.leftArrow)){
	if (selected == 0 and global.saveSlot[7] != "") then selected = 7;
	else if (selected > 0) then selected -= 1;
}
else if (keyboard_check_pressed(input.rightArrow)){
	if (selected == 7) then selected = 0;
	else if (selected < 7){
		if (global.saveSlot[selected+1] != "") then selected += 1;
	}
}

// Load Game
if (loadFile == true){
	scr_LoadGame(global.saveSlot[selected]);
	room_goto(room0);
}