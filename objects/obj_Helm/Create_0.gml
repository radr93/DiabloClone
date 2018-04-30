/// @description Initialize Variables

// Inherit from head parent
event_inherited();

// Leather Cap specific variables
item[property.name] = "Helm";
item[property.sprite] = spr_Helm;
item[property.object] = obj_Helm;
item[property.defence] = irandom_range(9, 15);
item[property.maxDurability] = 18;
item[property.durability] = irandom_range(1, item[property.maxDurability]);
item[property.reqStrength] = 15;