/// @description Draw Message Box to Screen
if (showMessageBox == true){
	/// Draw The Message Box
	draw_sprite_ext(spr_MessageBox, 0, guiX, guiY, 1, 1, 0, c_white, .6);
	/// Handle direct mouse interaction
	// If mouse is within range of the message box
	if (global.guiMouseX >= guiX and global.guiMouseX <= (guiX+width)){
		if (global.guiMouseY >= guiY and global.guiMouseY <= (guiY+height)){
			// If you're clicking the message box
			if (mouse_check_button_pressed(input.leftClick)){
				global.clickingSomething = true; // You're clicking on something
				draggingWindow = true; // You're dragging something
			}
			// If you're dragging the message box
			if (draggingWindow == true){
				// Update message box's position following the mouse
				guiX = global.guiMouseX-(width/2);
				guiY = global.guiMouseY-(height/2);
			}
			// Scroll Through Messages Up
			if (mouse_wheel_up()){
				// Won't allow you to scroll up if you're at the top of the list
				if (messageIndex <= maxMessages){
					if (messageCount > messageIndex){
						messageIndex++;
					}
				}
			}
			// Scroll Through Messages Down
			if (mouse_wheel_down()){
				// Won't allow you to scroll down if you're at the bottom of the list
				if (messageIndex >= maxMessagesToShow){
					messageIndex--;
				}
			}	
		}
	}
	
	/// Update Messages
	// Check queue for new messages and add each new message to the history
	if (messageQueue[0,msg.text] != ""){ // If there's a new message in the first slot of the queue
		for (m = 0; m < messageQueueMax; m++){ // Start looping through the message queue
			if (messageQueue[m,msg.text] != ""){ // If the new message at this spot in the queue actually has text
				// Move old messages in the history up to make room
				for (i = maxMessages-1; i >= 0; i--){
					for (j = 0; j < msg.MAX; j++){
						message[i+1, j] = message[i, j];
					}
				}
				// See if new message is a command
				var newMessage = messageQueue[m, msg.text];
				var textToCheck = scr_CheckInputType(messageQueue[m, msg.text]);
				// 
				// If it was a /debug command
				if (textToCheck == "/debug" and messageQueue[m, msg.sender] == obj_Player.name){
					debugResult = scr_ParseForDebug(newMessage); // parse the string to find out which command
					message[0,msg.time] = "["+global.hour+":"+global.minute+global.ampm+"]" // get timestamp
					message[0,msg.sender] = "[SYSTEM]: " // get sender
					message[0,msg.text] = message[0,msg.time]+message[0,msg.sender]+debugResult; // set message text
				}
				// If it was a /help command
				else if (textToCheck == "/help"){
					message[0,msg.time] = "["+global.hour+":"+global.minute+global.ampm+"]" // get timestamp
					message[0,msg.sender] = "[SYSTEM]: " // get sender
					message[0,msg.text] = message[0,msg.time]+message[0,msg.sender]+"DiabloClone console help:";
					for (h = 0; h < global.helpFileSize; h++){ // loop through each entry in the help file array
						for (i = 0; i < obj_MessageBox.messageQueueMax; i++){ // loop through the message queue for an empty slot
							if (obj_MessageBox.messageQueue[i, msg.text] == ""){ // if current position in the queue slot is blank
								obj_MessageBox.messageQueue[i, msg.time] = "["+global.hour+":"+global.minute+global.ampm+"]" // get timestamp
								obj_MessageBox.messageQueue[i, msg.sender] = "SYSTEM"; // get user
								obj_MessageBox.messageQueue[i, msg.text] = scr_HelpFile(h); // set text from help file
								break; // stop searching the queue for a blank spot (you just found one)
							}
						}
					}
				}
				// If it was a regular message
				else{
					message[0,msg.time] = "["+global.hour+":"+global.minute+global.ampm+"]" // get timestamp
					message[0,msg.sender] = "["+messageQueue[m, msg.sender]+"]: " // get user
					message[0,msg.text] = message[0,msg.time]+message[0,msg.sender]+string(newMessage); // set message text
				}
				// Clear new message
				messageCount++;
				messageQueue[m, msg.time] = "";
				messageQueue[m, msg.sender] = "";
				messageQueue[m, msg.text] = "";
			}
		}
	}

	/// Draw Messages
	var xx = guiX+8;
	var yy = guiY+8;
	// If you scroll to the bottom of the list, never allow it to show less than 5 messages
	if (messageIndex < 5){
		messageIndex = 5;
	}
	// messageIndex = top message in message box
	for (i = messageIndex-1; i >= messageIndex-maxMessagesToShow; i--){
		// Color Code all system messages yellow
		if (message[i,msg.sender] == "[SYSTEM]: "){
			draw_set_color(c_yellow)
		}
		// Color Code all user messages white
		else if (message[i,msg.sender] == "["+obj_Player.name+"]: "){
			draw_set_color(c_white);
		}
		// Color Code all other messages aqua
		else{
			draw_set_color(c_aqua);
		}
		// Draw the message
		draw_text(xx, yy, message[i, msg.text]);
		yy += 16;
	}
}