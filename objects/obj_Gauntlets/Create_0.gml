/// @description Initialize Variables

// Inherit from head parent
event_inherited();

// Gauntlets specific variables
item[property.name] = "Gauntlets";
item[property.sprite] = spr_Gauntlets;
item[property.object] = obj_Gauntlets;
item[property.defence] = irandom_range(12, 15);
item[property.maxDurability] = 24;
item[property.durability] = irandom_range(1, item[property.maxDurability]);
item[property.reqStrength] = 60;