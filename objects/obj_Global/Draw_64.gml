/// @description Debug Info

// Display Information if user enters command /debug list
if (debugOpen){
	draw_set_color(c_yellow);
	var yy = 32;
	draw_text(32, yy, "DEBUG LIST:"); yy+=16;
	draw_text(32, yy, "obj_Global instances: " + string(instance_number(obj_Global))); yy+=16;
	draw_text(32, yy, "obj_Camera instances: " + string(instance_number(obj_Camera))); yy+=16;	
	draw_text(32, yy, "obj_Console instances: " + string(instance_number(obj_Console))); yy+=16;
	draw_text(32, yy, "obj_MessageBox instances: " + string(instance_number(obj_MessageBox))); yy+=16;
	draw_text(32, yy, "global.clickingSomething = " + string(global.clickingSomething)); yy+=16;
	draw_text(32, yy, "guiMouseX: " + string(global.guiMouseX)); yy+=16;
	draw_text(32, yy, "guiMouseY: " + string(global.guiMouseY)); yy+=16;
	draw_text(32, yy, "application_surface width: "+ string(surface_get_width(application_surface))); yy+=16;
	draw_text(32, yy, "application_surface height: "+ string(surface_get_height(application_surface))); yy+=16;
}