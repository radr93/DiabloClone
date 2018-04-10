/// @description Create the character

// If a class has been selected
if (class != -1){
	// If a name has been selected
	if (name != ""){
		// Create a new player controller and pass on name and class
		i = instance_create_layer(x, y, "Controllers", obj_PlayerController);
		i.stats[stat.class] = class;
		i.stats[stat.name] = name;
		global.saveSlot[global.saveSlotsUsed] = name;
		global.saveSlotsUsed++;
		room_goto(room0);
	}
}