/// @description Set-up camera

camera = camera_create();

var viewMatrix = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var projMatrix = matrix_build_projection_ortho(1024, 576, 1, 10000);

camera_set_view_mat(camera, viewMatrix);
camera_set_proj_mat(camera, projMatrix);

view_camera[0] = camera;

followTarget = obj_PlayerParent;
xTo = x;
yTo = y;