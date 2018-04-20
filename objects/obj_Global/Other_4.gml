/// @description Launch room controller

// Launch UI when in game room
if (global.launchUI == true){
	if (!instance_exists(obj_UIController)){
		// Launch UI controller
		instance_create_layer(x, y, "Highest", obj_UIController); // Launch the UI
	}
}