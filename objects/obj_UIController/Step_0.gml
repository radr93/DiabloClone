/// @description Manage UI Interaction

view_x = camera_get_view_x(obj_Camera.camera);
view_y = camera_get_view_y(obj_Camera.camera);

// Toggle Force Closes (first the inventory then the console then the message box then open save menu)
if (keyboard_check_pressed(input.escape)){
	if (obj_Inventory.showInventory) then obj_Inventory.showInventory = false;
	else if (instance_exists(obj_Console)) then instance_destroy(obj_Console);
	else if (obj_MessageBox.showMessageBox) then obj_MessageBox.showMessageBox = false;
	// Toggle Save Menu
	else if (showSaveMenu == false){
		showSaveMenu = true;
		input.free = false;
	}
	else{
		showSaveMenu = false;
		input.free = true;
	}
}

// Handle Interaction with save menu
if (showSaveMenu = true){
	
	/// Make selection with mouse
	// If you're hovering over OPTIONS
	if (mouse_y >= view_y+192 and mouse_y <= view_y+255){
		if (mouse_x >= view_x+384 and mouse_x <= view_x+639){
			buttonSelected = selection[0];
			if (mouse_check_button_pressed(input.leftClick)){
				// OPTIONS STUFF
				global.clickingSomething = true;
			}
		}
	}			
	// If you're hovering over SAVE AND EXIT GAME
	else if (mouse_y >= view_y+256 and mouse_y <= view_y+319){
		if (mouse_x >= view_x+192 and mouse_x <= view_x+831){
			buttonSelected = selection[1];
			if (mouse_check_button_pressed(input.leftClick)){
				// SAVE AND EXIT GAME STUFF
				global.clickingSomething = true;
				scr_SaveGame();
				game_restart();
			}
		}
	}
	// If you're hovering over RETURN TO GAME
	else if (mouse_y >= view_y+320 and mouse_y <= view_y+383){
		if (mouse_x >= view_x+256 and mouse_x <= view_x+767){
			buttonSelected = selection[2];
			if (mouse_check_button_pressed(input.leftClick)){
				// RETURN TO GAME STUFF
				global.clickingSomething = true;
				showSaveMenu = false;
				input.free = true;
			}
		}
	}
	
	/// Make selection with keyboard
	if (keyboard_check_pressed(input.upArrow)){
		if (buttonSelected == selection[0]){
			buttonSelected = selection[2];
		}
		else if (buttonSelected == selection[1]){
			buttonSelected = selection[0]
		}
		else if (buttonSelected == selection[2]){
			buttonSelected = selection[1];
		}
	}
	else if (keyboard_check_pressed(input.downArrow)){
		if (buttonSelected == selection[0]){
			buttonSelected = selection[1]
		}
		else if (buttonSelected == selection[1]){
			buttonSelected = selection[2];
		}
		else if (buttonSelected == selection[2]){
			buttonSelected = selection[0];
		}
	}
	/// If you hit enter on selection
	if (keyboard_check_pressed(input.enter)){
		// Options
		if (buttonSelected == selection[0]){
			
		}
		// Save and Exit Game
		else if (buttonSelected == selection[1]){
			scr_SaveGame();
			game_restart();
		}
		// Return to Game
		else if (buttonSelected == selection[2]){
			showSaveMenu = false;
		}
	}
}