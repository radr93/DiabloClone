// Go to create character screen if no characters saved
if (global.saveSlot[0] == ""){
	room_goto(rm_CreateCharacter);
}

// Launch select character buttons
instance_create_layer(x, y, "Controllers", obj_SelectCharacterController);