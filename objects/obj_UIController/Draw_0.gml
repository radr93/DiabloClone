/// @description Draw Save Menu if visible

view_x = camera_get_view_x(obj_Camera.camera);
view_y = camera_get_view_y(obj_Camera.camera);

if (showSaveMenu){
	draw_sprite(spr_SaveMenu, 0, view_x, view_y)
	
	// If you're hovering over OPTIONS
	if (buttonSelected == selection[0]){
		draw_sprite(spr_SaveMenuStar, 0, view_x+320, view_y+192);
		draw_sprite(spr_SaveMenuStar, 0, view_x+640, view_y+192);
	}
			
	// If you're hovering over SAVE AND EXIT GAME
	else if (buttonSelected == selection[1]){
		draw_sprite(spr_SaveMenuStar, 0, view_x+160, view_y+256);
		draw_sprite(spr_SaveMenuStar, 0, view_x+792, view_y+256);
	}
	
	// If you're hovering over RETURN TO GAME
	else if (buttonSelected == selection[2]){
		draw_sprite(spr_SaveMenuStar, 0, view_x+224, view_y+320);
		draw_sprite(spr_SaveMenuStar, 0, view_x+720, view_y+320);
	}
}