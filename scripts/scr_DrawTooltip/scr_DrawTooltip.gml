/*

Syntax:
scr_DrawTooltip(color, string);

color = The color of the tooltip's text
string = The string to display in the tooltip

This script draws the provided string in the provided color at mouse_x and mouse_y when called.

*/

var color = argument0;
var tooltip = argument1;

// If provided color is default blue
if (color == c_blue){
	// Mix a blue that's easier on the eyes
	var c_magicBlueRGB = make_color_rgb(22, 81, 229);
	var c_magicBlueHSV = make_color_hsv(223, 90, 90);
	c_magicBlue = merge_color(c_magicBlueRGB, c_magicBlueHSV, 0.5)
	color = c_magicBlue
}

// If string provided is really a string
if (is_string(tooltip)){
	// Get text size
    var text_width, text_height;
    text_width  = (-5 +- string_width(string_hash_to_newline(tooltip)));
    text_height = (-5 +- string_height(string_hash_to_newline(tooltip)));
    //Set color, font, alpha and alignment
    draw_set_color(color);  
    draw_set_font(global.messageFont);
    draw_set_alpha(0.75);
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);
    
    //Draw a rectangle behind the text and draw text on top
    draw_roundrect_color((mouse_x - (text_width/2)), (mouse_y - (text_height/2)), (mouse_x + (text_width/2)), (mouse_y + (text_height/2)), c_black, c_black, false);  
    draw_text(mouse_x, (mouse_y), string_hash_to_newline(argument1));
    
    // Reset alpha and alignment
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}