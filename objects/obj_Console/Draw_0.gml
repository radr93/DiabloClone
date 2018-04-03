/// @description Draw Textbox

// Draw console
draw_sprite_ext(spr_Console, 0, x, y, 1, 1, 0, c_white, .8);

// Get and draw text in console
draw_set_font(global.messageFont);
draw_set_color(c_white);
inputText = keyboard_string; // get string to draw
draw_text(x+2, y+2, "["+string(obj_Player.name)+"]:"+inputText+cursor);