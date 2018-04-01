/// @description Initialize Variables

// Show or Hide Box
showMessageBox = false;

// Positioning Variables (x,y position based on the guiX and guiY, not by true x,y in room)
width = sprite_get_width(spr_MessageBox);
height = sprite_get_height(spr_MessageBox);
defaultX = 96;
defaultY = 384;
guiX = defaultX;
guiY = defaultY;
draggingWindow = false;

// Message Properties
enum msg{
	time,
	sender,
	text,
	MAX
}

// New messages
messageQueueMax = 16;
for (i = 0; i < messageQueueMax; i++){
	for (j = 0; j < msg.MAX; j++){
		messageQueue[i, j] = ""
	}
}

// Message History
consoleStringPrevious = ""; // the last string entered into the console
maxMessages = 50; // how many messages to keep in history
maxMessagesToShow = 5; // how many messages to show in the message box
messageIndex = 0; // used to scroll up and down through messages
messageCount = 0; // how many messages are currently in the history
	
// Message History Array
for (i = 0; i < maxMessages; i++){
	for (j = 0; j < msg.MAX; j++){
		message[i, j] = "";
		// message[0, msg.time]
		// message[0, msg.sender] 
		// message[0, msg.text]
		// ......
		// message[24, msg.time]
		// message[24, msg.sender]
		// message[24, msg.text]
		
	}
}