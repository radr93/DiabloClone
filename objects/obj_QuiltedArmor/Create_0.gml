/// @description Initialize Variables

// Inherit from Chest Parent
event_inherited();

// Quilted Armor specific variables
item[property.name] = "Quilted Armor";
item[property.sprite] = spr_QuiltedArmor;
item[property.object] = obj_QuiltedArmor;
item[property.defence] = irandom_range(8, 11);
item[property.maxDurability] = 20;
item[property.durability] = irandom_range(1, item[property.maxDurability]);
item[property.reqStrength] = 12;