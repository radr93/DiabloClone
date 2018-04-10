/// @description Update messages
// Check the queue for new messages and add each new message to the history

// If you have a new message
if (messageQueue[0,msg.text] != ""){
	for (m = 0; m < messageQueueMax; m++){ // Start looping through the message queue
		if (messageQueue[m,msg.text] != ""){ // If the new message at this spot in the queue actually has text
			
			// Move old messages in the history up to make room
			for (i = maxMessages-1; i >= 0; i--){
				for (j = 0; j < msg.MAX; j++){
					message[i+1, j] = message[i, j];
				}
			}
			
			// Update message time and sender then parse message text for commands
			message[0,msg.time] = messageQueue[m, msg.time];
			message[0,msg.sender] = "["+messageQueue[m, msg.sender]+"]: ";
			var newMessage = messageQueue[m, msg.text];
			var inputType = scr_CheckInputType(messageQueue[m, msg.text]);
			
			// If it was a /debug command sent from the user
			if (inputType == "/debug" and messageQueue[m, msg.sender] == obj_PlayerController.stats[stat.name]){
				// Get debug return message
				debugResult = scr_GetDebugCommand(newMessage);
				// Change sender to system
				message[0,msg.sender] = "[SYSTEM]: "
				// Send debug message
				message[0,msg.text] = message[0,msg.time]+message[0,msg.sender]+debugResult;
			}
			
			// If it was a /help command sent from the user
			else if (inputType == "/help"){
				message[0,msg.text] = message[0,msg.time]+"["+message[0,msg.sender]+"]: "+messageQueue[m, msg.text];
				for (h = 0; h < global.helpFileSize; h++){ // Loop through each entry in the help file
					for (i = 0; i < obj_MessageBox.messageQueueMax; i++){ // Loop through the message queue for an empty cell
						if (obj_MessageBox.messageQueue[i, msg.text] == ""){ // If current position in the queue cell is blank
							obj_MessageBox.messageQueue[i, msg.time] = scr_GetTime(); // Get timestamp
							obj_MessageBox.messageQueue[i, msg.sender] = "HELP"; // Get sender
							obj_MessageBox.messageQueue[i, msg.text] = scr_GetHelpFile(h); // Get text from help file
							break; // Stop searching the queue for a blank spot (you just found one)
						}
					}
				}
			}
			
			// If it was a regular message
			else{
				message[0,msg.sender] = "["+messageQueue[m, msg.sender]+"]: "; // Get sender
				message[0,msg.text] = message[0,msg.time]+message[0,msg.sender]+string(newMessage); // Send message
			}
			
			// Clear spot in queue
			messageCount++;
			messageQueue[m, msg.time] = "";
			messageQueue[m, msg.sender] = "";
			messageQueue[m, msg.text] = "";
		}
	}
}