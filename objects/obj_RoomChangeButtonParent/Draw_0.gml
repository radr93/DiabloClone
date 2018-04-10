/// @description Draw Button and text

// Text is set in creation code for the instance in the room editor

// Draw Button
draw_sprite(sprite, 0, x, y);

// Set Alignment
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw Button Text
draw_set_font(global.buttonFont);
draw_set_color(c_orange);
draw_text(x+(sprite_width/2), y+(sprite_height/2), text);

// Reset Alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);