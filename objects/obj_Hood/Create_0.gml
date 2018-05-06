/// @description Initialize Variables

// Inherit from head parent
event_inherited();

// Leather Cap specific variables
item[property.name] = "Hood";
item[property.sprite] = spr_Hood;
item[property.object] = obj_Hood;
item[property.defence] = irandom_range(3, 5);
item[property.maxDurability] = 12;
item[property.durability] = irandom_range(1, item[property.maxDurability]);