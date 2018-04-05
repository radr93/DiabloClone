/// @description Debug Info

// Display Information if user enters command /debug list
if (debugOpen){
	var view_x = camera_get_view_x(obj_Camera.camera);
	var view_y = camera_get_view_y(obj_Camera.camera);
	// Get Debug Text
	var debugList =
	 "DEBUG LIST:"+"\n"+
	"obj_Global instances: " + string(instance_number(obj_Global)) + " \n" +
	"obj_Console instances: " + string(instance_number(obj_Console)) + " \n" +
	"obj_MessageBox instances: " + string(instance_number(obj_MessageBox))+ " \n" +
	"obj_Camera instances: " + string(instance_number(obj_Camera)) + " \n" +
	"current_camera: "+ string(view_get_camera(0)) + " \n" +
	" \n"+
	"global.clickingSomething = " + string(global.clickingSomething) + " \n" 
	
	// Draw Debug Text	
	var w = string_width(debugList)*1.15;
	var h = string_height(debugList)*1.2;
	draw_rectangle_colour(view_x+16, view_y+16, view_x+w+16, view_y+h+16, c_black, c_gray, c_gray, c_black, false);
	draw_set_color(c_yellow);
	draw_text(view_x+32, view_y+32, debugList);
}