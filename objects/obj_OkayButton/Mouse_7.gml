/// @description Go to room target

// Go to room target
if (clicking == true){
	// roomTarget is set in creation code for the instance in the room editor
	scr_LoadGame(global.saveSlot[obj_SelectCharacterController.selected]);
	room_goto(roomTarget);
}