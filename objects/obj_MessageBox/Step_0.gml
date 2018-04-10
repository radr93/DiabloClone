/// @description Visibility and mouse interaction

// Update Position
var view_x = camera_get_view_x(obj_Camera.camera);
var view_y = camera_get_view_y(obj_Camera.camera); 
x = view_x+xOffset;
y = view_y+yOffset;

// Toggle message box on and off
if (keyboard_check_pressed(input.toggleMessageBox) and input.free){
	if (showMessageBox == true) then showMessageBox = false; else showMessageBox = true;
}

// Toggle console and get messages from console
if (keyboard_check_pressed(input.enter)){
	// If console isn't open
	if (!instance_exists(obj_Console)){
		// Open console and message box if it isn't already
		showMessageBox = true;
		instance_create_layer(x, y, "Controllers", obj_Console);
	}
	else{ // Otherwise, the console is open
		// If there was a string entered into the console
		if (obj_Console.inputText != ""){
			// Send the string to the new message queue
			for (i = 0; i < messageQueueMax; i++){ // loop through the message queue for an empty spot
				if (messageQueue[i, msg.text] == ""){ // if the current queue cell is empty
					messageQueue[i, msg.time] = scr_GetTime(); // Get timestamp
					messageQueue[i, msg.sender] = obj_PlayerController.stats[stat.name]; // Get sender
					messageQueue[i, msg.text] = obj_Console.inputText; // Get text
					consoleStringPrevious = obj_Console.inputText; // hold previously entered string (can be retrieved with tab when console is open)
					break; // stop searching the queue for a blank spot (you just found one)
				}
			}
		}
		// Close the console
		instance_destroy(obj_Console);
	}
}

/// Handle direct mouse interaction when visible
if (showMessageBox == true){
	// If mouse is within range of the message box
	if (mouse_x >= x and mouse_x <= (x+width)){
		if (mouse_y >= y and mouse_y <= (y+height)){
			// If you click on the message box
			if (mouse_check_button_pressed(input.leftClick)){
				global.clickingSomething = true; // You're clicking on something
				draggingWindow = true; // You're dragging something
				dragDistanceX = mouse_x - x; // How far into the message box spite you clicked
				dragDistanceY = mouse_y - y; // How far into the message box spite you clicked
			}
			// If you're dragging the message box
			if (draggingWindow == true){
				// Update message box's position while you drag it
				var view_x = camera_get_view_x(obj_Camera.camera);
				var view_y = camera_get_view_y(obj_Camera.camera);
				xOffset = (mouse_x-dragDistanceX)-view_x;
				yOffset = (mouse_y-dragDistanceY)-view_y;
			}
			// Scroll up through message history
			if (mouse_wheel_up()){
				// Won't allow you to scroll past 50 messages
				if (messageIndex <= maxMessages){
					// Won't let you scroll up until there are messages to scroll through
					if ((messageCount) > messageIndex){
						messageIndex++;
					}
				}
			}
			// Scroll down through message history
			if (mouse_wheel_down()){
				// Won't allow you to scroll down if you're at the bottom of the list
				if (messageIndex >= messagesVisible){
					messageIndex--;
					// (always show at least 5 entries)
					if (messageIndex < 5){
						messageIndex = 5;
					}
				}
			}
		}
	}
}