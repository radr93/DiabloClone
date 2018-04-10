// Flag obj_Global to create obj_UIController
global.launchUI = true;

// Player starting position
var p = obj_PlayerController;
if (p.stats[stat.class] == classes.mage){
	instance_create_layer(672, 416, "Instances", obj_Mage);
}
else if (p.stats[stat.class] == classes.ranger){
	instance_create_layer(672, 416, "Instances", obj_Ranger);
}
else if (p.stats[stat.class] == classes.warrior){
	instance_create_layer(672, 416, "Instances", obj_Warrior);
}