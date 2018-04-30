/// @description Open Chest

global.clickingSomething = true;

if (image_index == 0){
	image_index = 1;
	show_debug_message("\n NEW CHEST DROPS:");
	repeat (random_range(3, 8)){
		// Drop Gold
		if (0.20 >= random(1)){
			var drop = obj_Gold;
			i = instance_create_layer(x +-32, y +32, "Instances", drop)
			i.item[property.itemLevel] = level;
			i.goldValue = irandom_range(1, (level*30));
			// Assign sprite depending on amount of gold
			if (i.goldValue >= 1 and i.goldValue <= 99){
				i.item[property.sprite] = spr_GoldSmall;
			}
			else if (i.goldValue >= 100 and i.goldValue <= 1999){
				i.item[property.sprite] = spr_GoldMedium;
			}
			else if (i.goldValue >= 2000){
				i.item[property.sprite] = spr_GoldLarge;
			}
			show_debug_message(string(i.goldValue)+" "+i.item[property.name]+", itemLevel is "+string(i.item[property.itemLevel])+".");
		}
		// Drop Items
		else{
			var drop = scr_GetDrop(level, treasureClass);
			if (drop != -1){
				i = instance_create_layer(x +-32, y +32, "Instances", drop);
				i.item[property.itemLevel] = level;
				i.rarityMultiplier = rarityMultiplier;
				show_debug_message(""+i.item[property.name]+", itemLevel is "+string(i.item[property.itemLevel])+".");
			}
			else{
				show_debug_message("No drop returned from treasure chest.");
			}
		}
	}
}