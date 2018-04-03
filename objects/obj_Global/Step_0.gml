/// @description Update Game

/// Update Clock
// Hours
if (current_hour > 12){ // Set to PM if after noon and convert 24h to 12h
	global.ampm = "pm"
	global.hour = string(current_hour-12);
}
else{ // Set to AM if before noon
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