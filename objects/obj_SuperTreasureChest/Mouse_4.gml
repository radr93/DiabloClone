/// @description Open Chest

global.clickingSomething = true;

if (image_index == 0){
	image_index = 1;
	show_debug_message("\n NEW CHEST DROPS:");
	repeat (random_range(3, 8)){
		var drop = scr_GetDrop(level, treasureClass);
		show_debug_message("Rolled: "+string(drop)+".");
		if (drop > 0){
			i = instance_create_layer(x +-32, y +32, "Instances", drop);
			i.item[property.itemLevel] = level;
			i.rarityMultiplier = rarityMultiplier;
			show_debug_message("Dropped a "+i.item[property.name]+", itemLevel is "+string(i.item[property.itemLevel])+".");
		}
		else{
			show_debug_message("No drop returned from treasure chest.");
		}
	}
}