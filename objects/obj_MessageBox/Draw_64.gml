/// @description Draw Message Box to Screen
if (showMessageBox == true){
	// Draw Message Box
	draw_sprite_ext(spr_MessageBox, 0, guiX, guiY, 1, 1, 0, c_white, .6);
	// If mouse is within range of the message box
	if (global.guiMouseX >= guiX and global.guiMouseX <= (guiX+width)){
		if (global.guiMouseY >= guiY and global.guiMouseY <= (guiY+height)){
			// If mouse is clicking the message box
			if (mouse_check_button_pressed(input.leftClick) and !instance_exists(obj_MouseClick)){
				global.clickingSomething = true; // You're clicking on something
				global.draggingWindow = true; // You're dragging something
			}
			// If you're dragging something
			if (global.draggingWindow == true){
				guiX = global.guiMouseX-(width/2);
				guiY = global.guiMouseY-(height/2);
			}
			// Scroll Messages Up
			if (mouse_wheel_up()){
				if (messageIndex <= maxMessages){
					if (messageCount > messageIndex){
						messageIndex++;
					}
				}
			}
			// Scroll Message Down
			if (mouse_wheel_down()){
				if (messageIndex >= maxMessagesToShow){
					messageIndex--;
				}
			
			}	
		}
	}
	// Load New Messages into old messages
	// If you got a new message
	if (newMessage != ""){
		// Move old messages up to make room
		for (i = maxMessages-1; i >= 0; i--){
			for (j = 0; j < msg.MAX; j++){
				message[i+1, j] = message[i, j];
			}
		}
		// Parse newest message and add to bottom of history
		var parsedText = scr_ParseInput(newMessage);
		// If it wasn't a command, update sender and message
		if (parsedText == newMessage){
			message[0,msg.time] = "["+global.hour+":"+global.minute+global.ampm+"]" // get timestamp
			message[0,msg.sender] = "["+newMessageSender+"]: " // get user
			message[0,msg.text] = message[0,msg.time]+message[0,msg.sender]+newMessage; // set message
			}
		// If it was a command, set sender as system and use parsed text
		else{
			message[0,msg.time] = "["+global.hour+":"+global.minute+global.ampm+"]" // get timestamp
			message[0,msg.sender] = "[SYSTEM]: "
			message[0,msg.text] = message[0,msg.time]+message[0,msg.sender]+parsedText;
		}
		// Clear new message
		messageCount++
		newMessage = "";
		newMessageSender = "";
	}

	// Draw Messages
	var xx = guiX+(8*global.windowWidthScale);
	var yy = guiY+(8*global.windowHeightScale);
	// If you get to the bottom of the list
	if (messageIndex < 5){
		messageIndex = 5;
	}
	for (i = messageIndex-1; i >= messageIndex-maxMessagesToShow; i--){
			if (message[i,msg.sender] == "[SYSTEM]: "){
				draw_set_color(c_yellow)
			}
			else{
				draw_set_color(c_white)
			}
			draw_text(xx, yy, message[i, msg.text]);
			yy += 16;
	}
}