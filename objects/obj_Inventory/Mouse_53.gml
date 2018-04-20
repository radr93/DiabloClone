/// @description Drop items held

if (itemHeld[property.name] != -1 and global.clickingSomething == false){
	global.clickingSomething = true;
	i = instance_create_layer(obj_PlayerParent.x, obj_PlayerParent.y, "Instances", itemHeld[property.object])
	for (p = 0; p < property.MAX; p++){
		i.item[p] = itemHeld[p];
		itemHeld[p] = -1;
	}
}
