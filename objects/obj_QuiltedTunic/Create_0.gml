/// @description Initialize Variables

// Inherit from Chest Parent
event_inherited();

// Quilted Armor specific variables
item[property.name] = "Quilted Tunic";
item[property.sprite] = spr_QuiltedTunic;
item[property.object] = obj_QuiltedTunic;
item[property.defence] = irandom_range(8, 11);
item[property.maxDurability] = 12;
item[property.durability] = irandom_range(1, item[property.maxDurability]);
item[property.reqStrength] = 12;