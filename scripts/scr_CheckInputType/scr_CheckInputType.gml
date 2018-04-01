// scr_CheckInputType(string);
// Checks if input was a command or regular string
//	argument0 = string to check for command

var userInput = argument0;

// Commands
var debug = "/debug";
var help = "/help";

// if "/debug" was the first word in the string
if (string_pos(debug, userInput) == 1){
	return(debug);
}
// if "/help" was the first word in the string
else if (string_pos(help, userInput) == 1){
	return(help);
}
// if no command was issued
else{
	return(userInput)
}