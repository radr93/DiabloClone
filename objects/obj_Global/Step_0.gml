/// @description Update Game Window

global.currentWindowWidth = window_get_width();
global.currentWindowHeight = window_get_height();
global.windowWidthScale = (global.currentWindowWidth/global.defaultWindowWidth);
global.windowHeightScale = (global.currentWindowHeight/global.defaultWindowHeight);

// Update Time
if (current_hour > 12){
	global.ampm = "pm"
	global.hour = string(current_hour-12);
}
else{
	global.hour = string(current_hour);
	global.ampm = "am"
}
if (current_minute < 10){
	global.minute = "0"+string(current_minute);
}
else{
	global.minute = string(current_minute);
}