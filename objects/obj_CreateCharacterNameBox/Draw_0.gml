/// @description Draw name box

var create = obj_CreateCharacterButton;

// If a class has been selected
if (create.class == class){
	// Draw name box
	draw_sprite(spr_ButtonSmall, 0, x, y);
	// Set alignment, font
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	// Draw Name
	draw_set_font(global.messageFont);
	draw_set_color(c_orange);
	draw_text(x+(sprite_width/2), (y+(sprite_height/2))-32, "Enter your name:");
	draw_set_font(global.messageFont);
	draw_set_color(c_white);
	draw_text(x+(sprite_width/2), y+(sprite_height/2), keyboard_string+cursor);
	// Reset Alignment
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
// Otherwise, wait for class selection to appear
else{
	instance_destroy();
}