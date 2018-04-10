/// @description Draw Button and text

// Fade if at max save slots used
if (global.saveSlotsUsed < global.saveSlotsMax){
	draw_set_alpha(1);
}
else{
	draw_set_alpha(.5);
}

draw_sprite(sprite, 0, x, y);

// Set Alignment
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw Button Text
draw_set_font(global.buttonFont);
draw_set_color(c_orange);
draw_text(x+(sprite_width/2), y+(sprite_height/2), text);

// Reset Alignment and alpha
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);