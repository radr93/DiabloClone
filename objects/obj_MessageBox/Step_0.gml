/// @description Toggle Console

// Toggle message box
if (keyboard_check_pressed(input.toggleMessages) and input.free){
	if (showMessageBox == true){
		showMessageBox = false;
		instance_destroy(obj_Console);
	}
	else{
		showMessageBox = true;
	}
}
// Toggle Console
if (keyboard_check_pressed(input.toggleConsole)){
	if (!instance_exists(obj_Console)){
		showMessageBox = true;
		instance_create_layer(x, y, "Controllers", obj_Console);
	}
	else{
		// Send message to message box
		if (obj_Console.inputText != ""){
			obj_MessageBox.newMessageSender = obj_PlayerParent.name;
			obj_MessageBox.newMessage = obj_Console.inputText;
			obj_Global.consoleStringPrevious = obj_Console.inputText;
		}
		instance_destroy(obj_Console);
	}
}