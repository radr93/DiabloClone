/// @description Movement

// If player has been given a target to move
if (instance_exists(obj_MouseClick)){
	// Pathfinding AI
	mp_potential_step(obj_MouseClick.x, obj_MouseClick.y, 4, false);
	if (place_meeting(x, y, obj_MouseClick)){
		with(obj_MouseClick){
			instance_destroy();
		}
	}
}