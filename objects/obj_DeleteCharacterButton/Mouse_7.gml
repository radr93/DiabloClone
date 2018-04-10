/// @description Delete Character

if (global.saveSlotsUsed > 0 and clicking == true){
	// Get selection to get character name for path
	var selection = obj_SelectCharacterController.selected
	var name = global.saveSlot[obj_SelectCharacterController.selected]
	// Delete directory, edit global variables and save changes
	directory_destroy("save/"+name);
	global.saveSlotsUsed--;
	global.saveSlot[selection] = "";
	ini_open("save/global/global.ini");
	ini_write_real("Save", "Save Slots Used", global.saveSlotsUsed);
	ini_write_string("Save", "Save Slot"+string(selection), global.saveSlot[selection]);
	ini_close();
	show_debug_message("DELETED CHARACTER");
	for (s = 0; s < global.saveSlotsMax; s++){
		if (global.saveSlot[s] == "" and s+1 < global.saveSlotsMax){
			if (global.saveSlot[s+1] != ""){
				var currentSaveSlot = s;
				for (c = currentSaveSlot; c < global.saveSlotsMax; c++){
					if (c+1 < global.saveSlotsMax){
						global.saveSlot[c] = global.saveSlot[c+1];
						global.saveSlot[c+1] = "";
					}
				}
			}
		}
	}
	room_restart();
}