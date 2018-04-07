/// @description Launch room controller

// As long as you're not in a set-up or title room
if (room != __init__ and room != rm_SplashScreen){
	// Launch UI controller
	instance_create_layer(x, y, "Controllers", obj_UILauncher); // Launch the UI
}