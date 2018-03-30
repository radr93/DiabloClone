/// @description Draw Text to Screen

// Draw Message Box
draw_sprite(spr_MessageBox, 0, x, y);

// Update Messages
if (newMessage != ""){
	for (i = maxMessages; i >= 0; i--){
		message[i+1] = message[i];
	}
	// Parse newest message
	var parsedText = scr_ParseInput(newMessage);
	if (parsedText == newMessage){
		message[0] = newMessage;
	}
	else{
		message[0] = parsedText;
	}
	newMessage = "";
}
// Draw Messages
var xx = 95+6
var yy = 352+6
for (i = maxMessages; i >= 0; i--){
		draw_text(xx, yy, message[i]);
		yy += 16;
}