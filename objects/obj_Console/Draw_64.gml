/// @description Draw Textbox

guiX = obj_MessageBox.guiX;
guiY = obj_MessageBox.guiY + 96;

if (global.guiMouseX >= guiX and global.guiMouseX <= (guiX+sprite_get_width(spr_Console))){
	if (global.guiMouseY >= guiY and global.guiMouseY <= guiY + sprite_get_height(spr_Console)){
		if (mouse_check_button(input.leftClick)){
			global.clickingSomething = true;
		}
	}
}
// Draw console
	draw_sprite_ext(spr_Console, 0, guiX, guiY, 1, 1, 0, c_white, .8);

// Draw text in console
	draw_set_font(global.messageFont);
	draw_set_color(c_white);
	// Get and draw string
	inputText = keyboard_string;
	draw_text(guiX+(2*global.windowWidthScale), guiY+(2*global.windowHeightScale), "["+obj_Player.name+"]:"+inputText+cursor);