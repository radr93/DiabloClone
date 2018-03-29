/// @description Type Messages to console

if (keyboard_check_pressed(input.enterTextKey)){
	if (!instance_exists(obj_UserInputTextbox)){
		instance_create_layer(x, y, "Controllers", obj_UserInputTextbox);
	}
	else{
		instance_destroy(obj_UserInputTextbox);
	}
}