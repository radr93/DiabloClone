/// @description Repeat Last Message

// Update Position underneath of Message Box
x = obj_MessageBox.x;
y = obj_MessageBox.y+96;	// always keeps the console directly under the message box

// Sets global.clickingSomething flag to true if clicked on
if (mouse_x >= x and mouse_x <= (x+sprite_get_width(spr_Console))){
	if (mouse_y >= y and mouse_y <= y + sprite_get_height(spr_Console)){
		if (mouse_check_button(input.leftClick)){
			global.clickingSomething = true;
		}
	}
}

// Copy previous string entered into the console
if keyboard_check_pressed(input.tab){
	keyboard_string = obj_MessageBox.consoleStringPrevious;
}