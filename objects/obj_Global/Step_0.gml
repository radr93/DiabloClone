/// @description Toggle Console

// Toggle Console
if (keyboard_check_pressed(input.toggleConsole)){
	if (!instance_exists(obj_Console)){
		instance_create_layer(x, y, "Controllers", obj_Console);
	}
	else{
		instance_destroy(obj_Console);
	}
}