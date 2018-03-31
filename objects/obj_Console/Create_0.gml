/// @description Initialize Variables

// Initialize Variables
inputText = "";
guiX = obj_MessageBox.guiX;;
guiY = obj_MessageBox.guiY+96;;
cursor = "|";
blinkSpeed = 20;

// Don't allow user to open menus (changes back to true in destroy event)
input.free = false;

// Discard previous keyboard inputs
keyboard_string = "";

// Set cursor blink alarm
alarm[0] = blinkSpeed;