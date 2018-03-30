/// @description Draw Textbox

// Draw console
	draw_sprite(spr_Console, 0, x, y);

// Draw text in console
	// Set Align
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	// Get and draw string
	inputText = keyboard_string;
	draw_text(x+3, y-3, "["+obj_Player.name+"] "+inputText);