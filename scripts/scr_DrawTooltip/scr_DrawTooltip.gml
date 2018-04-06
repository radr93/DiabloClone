/// @description Draw Tooltip on cursor 
/*
argument0 = rarity
argument1 = tooltip
*/

var color = argument0;
var tooltip = argument1;

if (color == c_blue){
	var c_magicBlueRGB = make_color_rgb(22, 81, 229);
	var c_magicBlueHSV = make_color_hsv(223, 90, 90);
	c_magicBlue = merge_color(c_magicBlueRGB, c_magicBlueHSV, 0.5)
	color = c_magicBlue
}

if (is_string(tooltip)){
    var text_width, text_height;
    text_width  = (-5 +- string_width(string_hash_to_newline(tooltip)));
    text_height = (-5 +- string_height(string_hash_to_newline(tooltip)));
    
    //Set alpha
    draw_set_alpha(0.75);
    //Set font
    draw_set_font(font_Calibri);
    //Set Align
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);
    
    //Draw rectangle around the text
    draw_roundrect_color((mouse_x - (text_width/2)), (mouse_y - (text_height/2)), (mouse_x + (text_width/2)), (mouse_y + (text_height/2)), c_black, c_black, false);
    //Set text color
    draw_set_color(color);    
    //Draw the text inside the rect
    draw_text(mouse_x, (mouse_y), string_hash_to_newline(argument1));
    
    // Reset alpha
    draw_set_alpha(1);
    //Reset Alignment
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}