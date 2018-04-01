/// @description Initialize Variables

// Positioning Variables (x,y position based on the guiX and guiY, not by true x,y in room)
guiX = obj_MessageBox.guiX;
guiY = obj_MessageBox.guiY+96;	// always keeps the console directly under the message box

// Text Input Variables
keyboard_string = ""; // Discard previous keyboard inputs
inputText = "";
cursor = "|";
blinkSpeed = 20;

// Doesn't allow you to open menus while typing (changes back to true in destroy event)
input.free = false;

// Set blink alarm for cursor "|" ""
alarm[0] = blinkSpeed;