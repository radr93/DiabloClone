/// @description Launch room controller

if (room != __init__ and room != rm_SplashScreen){
	// Don't launch room controllers until you're in-game.
	instance_create_layer(x, y, "Controllers", obj_UILauncher); // Launch the UI
}