/// @description Draw Character Information

// As long as there's a save file in the slot
if (stats[stat.sprite] != undefined){
	draw_set_font(font_Calibri);
	draw_set_color(c_white);
	// Draw the character
	draw_sprite(stats[stat.sprite], 0, x+32, y+32);
	// Draw the character's name, level and class
	draw_text(x+80, y+16, stats[stat.name]);
	draw_text(x+80, y+32, "Level " + string(stats[stat.level]) + " " + stats[stat.classString]);
}
// Draw rectangle around box if selected
//draw_text(32, 32, "selected = "+string(obj_SelectCharacterController.selected))
//draw_text(32, 64, "global.saveSlotsUsed = "+string(global.saveSlotsUsed))
if (obj_SelectCharacterController.selected == saveSlot){
	var width = sprite_get_width(spr_SelectCharacterFrame);
	var height = sprite_get_height(spr_SelectCharacterFrame);
	draw_set_color(c_red);
	draw_rectangle(x, y, x+width, y+height, true);
}