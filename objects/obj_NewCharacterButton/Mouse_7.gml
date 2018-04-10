/// @description Go to room target

// Go to room target
if (global.saveSlotsUsed < global.saveSlotsMax and clicking == true){
	// roomTarget is set in creation code for the instance in the room editor
	room_goto(roomTarget);
}