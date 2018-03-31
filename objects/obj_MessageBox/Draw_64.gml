/// @description Draw Text to Screen

if (showMessageBox == true){
	
	// If mouse in within range of the message box
	if (global.guiMouseX >= guiX and global.guiMouseX <= (guiX+sprite_get_width(spr_MessageBox))){
		if (global.guiMouseY >= guiY and global.guiMouseY <= guiY + sprite_get_height(spr_MessageBox)){
			// If mouse is clicking the message box
			if (mouse_check_button(input.leftClick)){
				global.clickingSomething = true;
					show_debug_message("\nguiX: "+string(guiX));
					show_debug_message("guiY: "+string(guiY)+"\n");
					show_debug_message("guiMouseX: "+string(global.guiMouseX));
					show_debug_message("guiMouseY: "+string(global.guiMouseY));
				var xDiff = global.guiMouseX - guiX;
				var yDiff = global.guiMouseY - guiY;
				guiX = global.guiMouseX+(-xDiff/4);
				guiY = global.guiMouseY+(-yDiff/4);
					show_debug_message("guiXdiff: "+string(xDiff));
					show_debug_message("guiYdiff: "+string(yDiff)+"\n");
					show_debug_message("guiX: "+string(guiX));
					show_debug_message("guiY: "+string(guiY)+"\n");
			}
		}
	}
	// Draw Message Box
	draw_sprite_ext(spr_MessageBox, 0, guiX, guiY, 1, 1, 0, c_white, .6);
	// Update Messages
	if (newMessage != ""){
		// Move old messages up
		for (i = maxMessages-1; i >= 0; i--){
			for (j = 0; j < msg.MAX; j++){
				message[i+1, j] = message[i, j];
			}
		}
		// Parse newest message
		var parsedText = scr_ParseInput(newMessage);
		// If it wasn't a command
		if (parsedText == newMessage){
			message[0,msg.time] = "["+global.hour+":"+global.minute+global.ampm+"]" // get timestamp
			message[0,msg.sender] = "["+newMessageSender+"]: " // get user
			message[0,msg.text] = message[0,msg.time]+message[0,msg.sender]+newMessage; // set message
			}
		// If it was a command
		else{
			message[0,msg.time] = "["+global.hour+":"+global.minute+global.ampm+"]" // get timestamp
			message[0,msg.sender] = "[SYSTEM]: "
			message[0,msg.text] = message[0,msg.time]+message[0,msg.sender]+parsedText;
		}
		newMessage = "";
		newMessageSender = "";
	}

	// Draw Messages
	var xx = guiX+(8*global.windowWidthScale);
	var yy = guiY+(8*global.windowHeightScale);
	for (i = maxMessages-1; i >= 0; i--){
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