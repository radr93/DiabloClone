/// @description Launch UI elements and destroy self

instance_create_layer(x, y, "Controllers", obj_Camera);		// Launch the Camera
instance_create_layer(x, y, "Controllers", obj_Inventory);	// Launch inventory
instance_create_layer(x, y, "Controllers", obj_MessageBox);	// Launch messages/console

instance_destroy();