/// Parse user input for keywords scr_ParseInput(userInput)

// Initialize Variables
var userInput = argument0;
var textToParse = userInput;
// Commands
var help = "/help";
var debug = "/debug";

// if "/debug" was the first word in the string
if (string_pos(debug, textToParse) == 1){
	result = scr_ParseForDebug(textToParse);
	return(result);
}
// if "/help" was the first word in the string
else if (string_pos(help, textToParse) == 1){
	return("Help feature to be implemented soon.")
}
else{
	return(userInput)
}