/*

Syntax:
scr_GetTime();

The script requires no arguments and returns a string with the current time in the following format:
	[09:29am]
	
*/

return("["+global.hour+":"+global.minute+global.ampm+"]");