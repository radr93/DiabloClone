/// @description Draw chest level and treasure class

draw_self();

draw_set_font(global.messageFont);
draw_set_color(c_fuchsia);
draw_text(x, y-24, "iLvl: "+string(level));
draw_text(x, y-8, "TC: "+treasureClass);