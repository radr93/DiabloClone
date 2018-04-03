/// @description Run Camera

// Look for follow target and set position
if (instance_exists(followTarget)){
	var targetX = followTarget.x;
	var targetY = followTarget.y;
	var offsetX = targetX - (defaultWidth/2);
	var offsetY = targetY - (defaultHeight/2);
	view_x = offsetX;
	view_y = offsetY;
	camera_set_view_pos(camera, view_x, view_y);
}

// Fullscreen Toggle
if (keyboard_check_pressed(input.space) and input.free){
	if (!window_get_fullscreen()){
		window_set_fullscreen(true);
	}
	else{
		window_set_fullscreen(false);
	}
}