/// @description Update Game

// GUI mouse location
global.guiMouseX = device_mouse_x_to_gui(0);
global.guiMouseY = device_mouse_y_to_gui(0);

// Time
// Hours
if (current_hour > 12){ // Set to PM and convert 24h to 12h
	global.ampm = "pm"
	global.hour = string(current_hour-12);
}
else{ // Set to AM
	global.hour = string(current_hour);
	global.ampm = "am"
}
// Minutes
if (current_minute < 10){ // add a 0 to minute string if less than 10 minutes
	global.minute = "0"+string(current_minute);
}
else{
	global.minute = string(current_minute);
}

// Resize Window
if (keyboard_check_pressed(input.space) and input.free){
	if (!window_get_fullscreen()){
		window_set_fullscreen(true);
	}
	else{
		window_set_fullscreen(false);
	}
	global.monitorWidth = window_get_width();
	global.monitorHeight = window_get_height();
}