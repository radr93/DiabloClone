/// @description Draw Textbox

var mid_width = (surface_get_width(application_surface)/2);
var lower_mid_height = (surface_get_height(application_surface)/4)*3;
x = mid_width;
y = lower_mid_height;
draw_sprite(spr_UserInputTextbox, 0, x, y);