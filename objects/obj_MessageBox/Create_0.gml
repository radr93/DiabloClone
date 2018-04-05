/// @description Initialize Variables

// Show or Hide Box
showMessageBox = false;

// Window drag variables (moves the box around the UI)
draggingWindow = false;
dragOffsetX = 0;
dragOffsetY = 0;

// Get position
var view_x = camera_get_view_x(obj_Camera.camera);
var view_y = camera_get_view_y(obj_Camera.camera);
xOffset = 96; // relative to camera x
yOffset = 384; // relative to camera y
x = view_x+xOffset;
y = view_y+yOffset;

// Get dimensions
width = sprite_get_width(spr_MessageBox);
height = sprite_get_height(spr_MessageBox);

// Message Properties
enum msg{
	time,
	sender,
	text,
	MAX
}

/// Message History
consoleStringPrevious = ""; // the last string that was entered into the console
messagesVisible = 5; // how many messages are visible at a time in the message box
messageIndex = 5; // increments as you scroll up and down through messages (top message in box)
messageCount = 0; // how many messages are in the history
maxMessages = 50; // how many messages to keep in history
for (i = 0; i < maxMessages; i++){
	for (j = 0; j < msg.MAX; j++){
		message[i, j] = "";
		// message[0, msg.time] = "";
		// message[0, msg.sender]  = "";
		// message[0, msg.text] = "";
		// ......
		// message[49, msg.time] = "";
		// message[49, msg.sender] = "";
		// message[49, msg.text] = "";
		
	}
}

/// New Message Queue
messageQueueMax = 25;
for (i = 0; i < messageQueueMax; i++){
	for (j = 0; j < msg.MAX; j++){
		messageQueue[i, j] = ""
		// messageQueue[0, msg.time] = "";
		// messageQueue[0, msg.sender]  = "";
		// messageQueue[0, msg.text] = "";
		// ......
	}
}