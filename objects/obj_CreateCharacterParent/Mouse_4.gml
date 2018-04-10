/// @description Select this character

var create = obj_CreateCharacterButton;

// If this class hasn't been selected
if (create.class != class){
	// Select it
	create.class = class;
	instance_create_layer(448, 448, "Instances", obj_CreateCharacterNamebox);
	// Reset other characters' positions
	with (obj_CreateCharacterParent){
		x = xDefault;
		y = yDefault;
	}
	// Move forward
	x = xMove;
	y = yMove;
}
// Otherwise deselect it
else{
	create.class = -1;
	x = xDefault;
	y = yDefault;
}
	