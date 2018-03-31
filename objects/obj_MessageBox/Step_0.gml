/// @description Toggle Console

// Toggle message box
if (keyboard_check_pressed(input.toggleMessages) and input.free){
	if (showMessageBox == true){
		showMessageBox = false;
		instance_destroy(obj_Console);
	}
	else{
		showMessageBox = true;
	}
}
// Toggle Console
if (keyboard_check_pressed(input.toggleConsole)){ // Send messages
	if (!instance_exists(obj_Console)){ // If message box isn't open, open it
		showMessageBox = true;
		instance_create_layer(x, y, "Controllers", obj_Console);
	}
	else{ // Otherwise, it's open so:
		// As long as there was a string entered into the console
		if (obj_Console.inputText != ""){
			// Send a new message to the message box from the player and hold previous string as variable
			newMessageSender = obj_PlayerParent.name;
			newMessage = obj_Console.inputText;
			consoleStringPrevious = obj_Console.inputText;
		}
		instance_destroy(obj_Console);
	}
}
if (keyboard_check_pressed(input.escape)){
	instance_destroy(obj_Console);
}