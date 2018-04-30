/*

Syntax:
scr_DrawTooltip(color, string);

color = The color of the tooltip's text
string = The string to display in the tooltip

This script draws the provided string in the provided color at mouse_x and mouse_y when called.

*/

var color, tooltip, text_width, text_height, view_x, view_y, view_width, view_height, xOffset, yOffset, xx, yy;

color = argument0;
tooltip = argument1;

text_width  = (-5 +- string_width(tooltip));
text_height = (-5 +- string_height(tooltip));
view_x = camera_get_view_x(obj_Camera.camera);
view_y = camera_get_view_y(obj_Camera.camera);
view_width = camera_get_view_width(obj_Camera.camera);
view_height = camera_get_view_height(obj_Camera.camera);

// Get tooltip offsets
// xOffset
if (mouse_x < view_x+(view_width/2)){
	xOffset = 48;
}
else if (mouse_x >= view_x+(view_width/2)){
	xOffset = -48;
}
// yOffset
if (mouse_y < view_y+(view_height/2)){
	yOffset = 48;
}
else if (mouse_y >= view_y+(view_height/2)){
	yOffset = -48;
}

// Get Draw Position
xx = mouse_x + xOffset;
yy = mouse_y + yOffset;

// Make magic blue color
if (color == c_blue){
	var c_magicBlueRGB, c_magicBlueHSV, c_magicBlue
	c_magicBlueRGB = make_color_rgb(42, 89, 255);
	c_magicBlueHSV = make_color_hsv(227, 84, 100);
	c_magicBlue = merge_color(c_magicBlueRGB, c_magicBlueHSV, 0.5)
	color = c_magicBlue
}

//Set color, font, alpha and alignment
draw_set_color(color);  
draw_set_font(global.messageFont);
draw_set_alpha(0.75);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
    
//Draw a rectangle behind the text and draw text on top
draw_roundrect_color((xx - (text_width/2)), (yy - (text_height/2)),
					 (xx + (text_width/2)), (yy + (text_height/2)),
					 c_black, c_black, false);  
draw_text(xx, yy, string(tooltip));
    
// Reset alpha and alignment
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);