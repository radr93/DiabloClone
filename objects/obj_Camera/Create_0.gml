/// @description Set-up camera

// Initialize variables and create camera
defaultWidth = 1024;
defaultHeight = 576;
followTarget = obj_PlayerParent;

camera = camera_create_view(x, y, defaultWidth, defaultHeight, 0, -1, 2, 2, 0, 0);

// Apply Camera to View
view_camera[0] = camera;