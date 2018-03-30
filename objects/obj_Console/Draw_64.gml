/// @description Draw Textbox

x = defaultX * global.windowWidthScale;
y = defaultY * global.windowHeightScale;

// Draw console
	draw_sprite_ext(spr_Console, 0, x, y, global.windowWidthScale, global.windowHeightScale, 0, c_white, .8);

// Draw text in console
	draw_set_font(global.messageFont);
	// Get and draw string
	inputText = keyboard_string;
	draw_text(x+(2*global.windowWidthScale), y+(2*global.windowHeightScale), "["+obj_Player.name+"] "+inputText);