/// @description Initialize Variables

// Set position
x = obj_MessageBox.x;
y = obj_MessageBox.y+96;	// always keeps the console directly under the message box

// Doesn't allow you to open menus while typing (changes back to true in destroy event)
input.free = false;

// Text Input Variables
keyboard_string = ""; // Discard previous keyboard inputs
inputText = ""; // The text that is input by the user
cursor = "|"; // Keeps track of your position within the string
blinkSpeed = 20; // How quickly the cursor blinks (60 = 1/sec)

// Set blink alarm for cursor "|" ""
alarm[0] = blinkSpeed;