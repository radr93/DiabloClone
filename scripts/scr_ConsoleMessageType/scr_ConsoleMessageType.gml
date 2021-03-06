/*

Syntax:
scr_ConsoleMessageType(string);

string	The string to check for a command

This script checks if the user's input (as a string provided by
the console) was a command i.e. /debug, /help, or just a regular string.

*/

var userInput = argument0;

// Command Types
var debug, help;

debug = "/debug";
help = "/help";

// If "/debug" was the first word in the string
if (string_pos(debug, userInput) == 1){
	// It was an attempted Debug command
	return(debug);
}
// If "/help" was the first word in the string
else if (string_pos(help, userInput) == 1){
	// It was attempted Help command
	return(help);
}
// If no command was issued
else{
	// It was a string with no command
	return(userInput)
}