/// @description Launch UI elements

// Initialize Variables
showSaveMenu = false;
buttonSelected = 0;
selection[0] = "OPTIONS";
selection[1] = "SAVE AND EXIT GAME";
selection[2] = "RETURN TO GAME";

// Launch UI
instance_create_layer(x, y, "Controllers", obj_Camera);		// Launch the Camera
instance_create_layer(x, y, "Controllers", obj_Inventory);	// Launch inventory
instance_create_layer(x, y, "Controllers", obj_MessageBox);	// Launch messages/console
