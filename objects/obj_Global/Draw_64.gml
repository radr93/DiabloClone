/// @description Debug Info

// Open Debug Menu
if (keyboard_check_pressed(input.toggleDebug) and input.free){
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
	draw_text(32, yy, "DEBUG LIST:"); yy+=16;
	draw_text(32, yy, "global.clickingSomething = " + string(global.clickingSomething)); yy+=16;
	draw_text(32, yy, "obj_Global instances: " + string(instance_number(obj_Global))); yy+=16;
	draw_text(32, yy, "obj_Camera instances: " + string(instance_number(obj_Camera))); yy+=16;
	draw_text(32, yy, "obj_Console instances: " + string(instance_number(obj_Console))); yy+=16;
	draw_text(32, yy, "obj_MessageBox instances: " + string(instance_number(obj_MessageBox))); yy+=16;
	draw_text(32, yy, "obj_MessageBox newMessage: " + string(obj_MessageBox.newMessage)); yy+=16;
	draw_text(32, yy, "obj_MessageBox message[0]: " + string(obj_MessageBox.message[0])); yy+=16;
	draw_text(32, yy, "obj_MessageBox message[1]: " + string(obj_MessageBox.message[1])); yy+=16;
	draw_text(32, yy, "obj_MessageBox message[2]: " + string(obj_MessageBox.message[2])); yy+=16;
	draw_text(32, yy, "obj_MessageBox message[3]: " + string(obj_MessageBox.message[3])); yy+=16;
	draw_text(32, yy, "obj_MessageBox message[4]: " + string(obj_MessageBox.message[4])); yy+=16;
	draw_text(32, yy, "obj_MessageBox message[5]: " + string(obj_MessageBox.message[5])); yy+=16;
}