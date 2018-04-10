/// @description Initialize Variables

// Text Input Variables
keyboard_string = ""; // Discard previous keyboard inputs
inputText = ""; // The text that is input by the user
cursor = "|"; // Keeps track of your position within the string
blinkSpeed = 20; // How quickly the cursor blinks (60 = 1/sec)

// Set blink alarm for cursor "|" ""
alarm[0] = blinkSpeed;

// Destroys the name box if class changes
var create = obj_CreateCharacterButton;
class = create.class