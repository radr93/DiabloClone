/// @description Debug Info

draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_yellow);

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
	draw_text(32, yy, "obj_MessageBox message[0]: " + string(obj_MessageBox.message[0,msg.text])); yy+=16;
}