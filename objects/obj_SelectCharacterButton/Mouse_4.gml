/// @description Communicate slots

// Clicking on something
global.clickingSomething = true;

// Tell obj_SelectCharacterController that this slot is selected
if (stats[stat.name] != undefined){
	obj_SelectCharacterController.selected = saveSlot;
}

// Count clicks and set double click alarm
doubleClick++;
alarm[0] = 15;

// If you double click, tell obj_SelectCharacterController to load the file
if (doubleClick > 1){
	if (stats[stat.name] != undefined){
		obj_SelectCharacterController.loadFile = true;
	}
}