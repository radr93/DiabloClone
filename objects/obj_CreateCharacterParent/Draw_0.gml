/// @description Draw Sprite

if (selected = true){
	// Change to action animation
	draw_sprite(sprite, 1, x, y);
	// Set Alignment
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	// Draw Text
	draw_set_font(global.messageFont);
	draw_set_color(c_orange);
	draw_text(512, 32, classInfo);
	draw_set_font(global.buttonFont);
	draw_text(512, 416, className);
	// Reset Alignment
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
else{
	// Draw regular animation
	draw_sprite(sprite, 0, x, y);
}