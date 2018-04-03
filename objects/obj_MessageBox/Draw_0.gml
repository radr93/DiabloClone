/// @description Draw message box to screen
if (showMessageBox == true){
	// Draw The Message Box
	draw_sprite_ext(spr_MessageBox, 0, x, y, 1, 1, 0, c_white, .6);
	// Draw Messages
	var xx = x+8;
	var yy = y+8;
	// messageIndex = index in history array (increment up/down to see older or newer messages)
	for (i = messageIndex-1; i >= messageIndex-messagesVisible; i--){
		// Color Code all system messages yellow
		if (message[i,msg.sender] == "[SYSTEM]: "){
			draw_set_color(c_yellow)
		}
		// Color Code all user messages white
		else if (message[i,msg.sender] == "["+obj_Player.name+"]: "){
			draw_set_color(c_white);
		}
		// Color Code all help messages aqua
		else if (message[i,msg.sender] == "[HELP]: "){
			draw_set_color(c_aqua);
		}
		// Color Code all other messages red
		else{
			draw_set_color(c_red);
		}
		// Draw the message
		draw_text(xx, yy, message[i, msg.text]);
		yy += 16;
	}
}