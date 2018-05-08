/// @description Draw chest level and treasure class

draw_self();

if (image_index == 0){
	draw_set_font(global.messageFont);
	draw_set_color(c_fuchsia);
	draw_text(x, y-24, "TC: "+treasureClass);
	draw_text(x, y-8, "iLvl: "+string(level));
}