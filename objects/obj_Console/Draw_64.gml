/// @description Draw Textbox

// Update Position underneath of Message Box
guiX = obj_MessageBox.guiX;
guiY = obj_MessageBox.guiY+96;

// Draw console
draw_sprite_ext(spr_Console, 0, guiX, guiY, 1, 1, 0, c_white, .8);

// Get and draw text in console
draw_set_font(global.messageFont);
draw_set_color(c_white);

inputText = keyboard_string; // get string to draw
draw_text(guiX+2, guiY+2, "["+string(obj_Player.name)+"]:"+inputText+cursor);

// Sets global.clickingSomething flag to true if clicked on
if (global.guiMouseX >= guiX and global.guiMouseX <= (guiX+sprite_get_width(spr_Console))){
	if (global.guiMouseY >= guiY and global.guiMouseY <= guiY + sprite_get_height(spr_Console)){
		if (mouse_check_button(input.leftClick)){
			global.clickingSomething = true;
		}
	}
}