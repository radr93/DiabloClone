/// @description Toggle/get input from console, toggle message box on.
// Toggle message box
if (keyboard_check_pressed(input.toggleMessageBox) and input.free){
	// If message box is already open
	if (showMessageBox == true){
		// Close it
		showMessageBox = false;
	}
	// Otherwise open it
	else{
		showMessageBox = true;
	}
}
// Toggle Console
if (keyboard_check_pressed(input.toggleConsole)){
	// If console isn't open
	if (!instance_exists(obj_Console)){
		showMessageBox = true;
		// Show message box and open console
		instance_create_layer(x, y, "Controllers", obj_Console);
	}
	else{ // Otherwise, it's open so:
		// As long as there was a string entered into the console
		if (obj_Console.inputText != ""){
			// Send the string to the messageQueue
			for (i = 0; i < messageQueueMax; i++){ // loop through the message queue for an empty spot
				if (messageQueue[i, msg.text] == ""){ // if the current queue slot is actually empty
					messageQueue[i, msg.sender] = obj_PlayerParent.name; // get sender
					messageQueue[i, msg.text] = obj_Console.inputText; // set text
					consoleStringPrevious = obj_Console.inputText; // hold previous string (can be retrieved with tab when console is open)
					break; // stop searching the queue for a blank spot (you just found one)
				}
			}
		}
		// And close the console
		instance_destroy(obj_Console);
	}
}
if (keyboard_check_pressed(input.escape)){
	// Close the console
	instance_destroy(obj_Console);
}