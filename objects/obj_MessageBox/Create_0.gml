/// @description Initialize Variables

showMessageBox = false;

// Position
defaultX = 96;
defaultY = 384;
guiX = defaultX * global.windowWidthScale;
guiY = defaultY * global.windowHeightScale;

// New message from console
newMessage = "";
newMessageSender = "";

// Old messages from console
enum msg{
	time,
	sender,
	text,
	
	MAX
}
maxMessages = 5;
for (i = 0; i < maxMessages; i++){
	for (j = 0; j < msg.MAX; j++){
		message[i, j] = "";
	}
}