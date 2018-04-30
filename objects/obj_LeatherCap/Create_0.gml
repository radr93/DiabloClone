/// @description Initialize Variables

// Inherit from head parent
event_inherited();

// Leather Cap specific variables
item[property.name] = "Leather Cap";
item[property.sprite] = spr_LeatherCap;
item[property.object] = obj_LeatherCap;
item[property.defence] = irandom_range(3, 5);
item[property.maxDurability] = 12;
item[property.durability] = irandom_range(1, item[property.maxDurability]);