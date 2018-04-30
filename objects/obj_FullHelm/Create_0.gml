/// @description Initialize Variables

// Inherit from head parent
event_inherited();

// Leather Cap specific variables
item[property.name] = "Full Helm";
item[property.sprite] = spr_FullHelm;
item[property.object] = obj_FullHelm;
item[property.defence] = irandom_range(17, 26);
item[property.maxDurability] = 24;
item[property.durability] = irandom_range(1, item[property.maxDurability]);
item[property.reqStrength] = 25;