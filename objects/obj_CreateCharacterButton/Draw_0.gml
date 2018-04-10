/// @description Draw Button and text

// If a class and name have been selected
if (class != -1 and name != ""){
	// Draw Button
	draw_sprite(spr_ButtonSmall, 0, x, y);
	// Set Alignment
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	// Draw Text
	draw_set_font(global.buttonFont);
	draw_set_color(c_orange);
	draw_text(x+(sprite_width/2), y+(sprite_height/2), text);
	// Reset Alignment
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}