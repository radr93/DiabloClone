/// @description Initialize Variables

// Initialize Variables
selected = 0; // use left click or arrows to select a save slot
loadFile = false; // press enter or double click a slot to load the game

/// Create Select Character buttons
// Local variables for for loop
var xx, yy, button, count
xx = 128;
yy = 96;
button = obj_SelectCharacterButton;
count = 0;
// Iterate left to right
for (r = 0; r < 4; r++){
	// Iterate top to bottom
	for (c = 0; c < 2; c++){
		// Create a button and assign it a saveSlot#(0-global.maxSaveSlots)
		i = instance_create_layer(xx, yy, "Instances", button);
		i.saveSlot = count;
		// Move right and add to save slot count
		xx = 416;
		count ++ ;
	}
	// Move left and down a row
	xx = 128;
	yy += 96;
}