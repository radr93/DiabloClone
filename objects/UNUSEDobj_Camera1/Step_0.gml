/// @description Run Camera

// Set follow speed
x += (xTo - x)/10;
y += (yTo - y)/10;

// Look for follow target
if (instance_exists(followTarget)){
	xTo = followTarget.x;
	yTo = followTarget.y;
}

// Set matrix
var viewMatrix = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, viewMatrix);
