/// @description Initialize Variables

// Show or Hide Box
showMessageBox = false;

// Position Box
width = sprite_get_width(spr_MessageBox);
height = sprite_get_height(spr_MessageBox);
defaultX = 96;
defaultY = 384;
guiX = defaultX * global.windowWidthScale;
guiY = defaultY * global.windowHeightScale;

// New message from console
newMessage = "";
newMessageSender = "";

// Message History
consoleStringPrevious = "";
maxMessages = 25;
maxMessagesToShow = 5;
messageIndex = 0;
messageCount = 0;

	// Message Properties
	enum msg{
		time,
		sender,
		text,
		MAX
	}
	
	// Message History Array
	for (i = 0; i < maxMessages; i++){
		for (j = 0; j < msg.MAX; j++){
			message[i, j] = "";
		}
	}