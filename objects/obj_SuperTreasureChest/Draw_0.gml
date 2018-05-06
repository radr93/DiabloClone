/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_set_font(global.messageFont);
draw_set_color(c_fuchsia);
draw_text(x, y-24, "iLvl: "+string(level));
draw_text(x, y-8, "TC: "+treasureClass);