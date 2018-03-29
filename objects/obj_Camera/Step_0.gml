/// @description Run Camera

x += (xTo - x)/25;
y += (yTo - y)/25;

if (instance_exists(followTarget)){
	xTo = followTarget.x;
	yTo = followTarget.y;
}

var viewMatrix = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, viewMatrix);