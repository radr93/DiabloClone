/// @description Set-up camera

// Create Camera and initialize variables
camera = camera_create(); //show_debug_message("I'm camera# "+string(camera));

followTarget = obj_PlayerParent;
xTo = x;
yTo = y;

defaultWidth = 1024;
defaultHeight = 576;

// Set Matrices
var viewMatrix = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var projMatrix = matrix_build_projection_ortho(defaultWidth, defaultHeight, 1, 10000);
camera_set_view_mat(camera, viewMatrix);
camera_set_proj_mat(camera, projMatrix);

// Apply Camera to View
view_camera[0] = camera;