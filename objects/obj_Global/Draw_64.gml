/// @description Debug Info

// Open Debug Menu

if keyboard_check_pressed(input.toggleDebug){
	if (debugOpen){
		debugOpen = false;
	}
	else{
		debugOpen = true;
	}
}

// Display Information
if (debugOpen){
	var yy = 32;
	draw_text(32, yy, "DEBUG MENU:"); yy+=16;
	// clickingSomething == true(1) or false(0)
	draw_text(32, yy, "clickingSomething = " + string(global.clickingSomething)); yy+=16;
	// number of inventory slots
	draw_text(32, yy, "Inventory Slot Count = " + string(obj_Inventory.inventorySlots)); yy+=16;
	draw_text(32, yy, "obj_Camera instances: " + string(instance_number(obj_Camera))); yy+=16;
	draw_text(32, yy, "obj_UserInputTextbox instances: " + string(instance_number(obj_UserInputTextbox))); yy+=16;
	draw_text(32, yy, "actionKey pressed?: " + string(keyboard_check_pressed(input.actionKey))); yy+=16;
}