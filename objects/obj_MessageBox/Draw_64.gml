/// @description Draw Text to Screen

// Position (relative to view)
x = defaultX * global.windowWidthScale
y = defaultY * global.windowHeightScale

if (showMessageBox == true){
	// Draw Message Box
	draw_sprite_ext(spr_MessageBox, 0, x, y, global.windowWidthScale, global.windowHeightScale, 0, c_white, .6);
	// Update Messages
	if (newMessage != ""){
		for (i = maxMessages-1; i >= 0; i--){
			message[i+1] = message[i];
		}
		// Parse newest message
		var parsedText = scr_ParseInput(newMessage);
		if (parsedText == newMessage){
			message[0] = ("["+global.hour+":"+global.minute+global.ampm+"]"+"["+newMessageSender+"]: "+newMessage);
		}
		else{
			message[0] = parsedText;
		}
		newMessage = "";
		newMessageSender = "";
	}

	// Draw Messages
	var xx = x+(8*global.windowWidthScale);
	var yy = y+(8*global.windowHeightScale);
	for (i = maxMessages-1; i >= 0; i--){
			draw_text(xx, yy, newMessageSender+message[i]);
			yy += 16;
	}
}