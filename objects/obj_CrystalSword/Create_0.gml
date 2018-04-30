/// @description Initialize Variables

// Inherit from Sword Parent
event_inherited();

// Short Sword specific variables
item[property.name] = "Crystal Sword";
item[property.sprite] = spr_CrystalSword;
item[property.object] = obj_CrystalSword;
item[property.width] = 2;
item[property.height] = 3;
item[property.minDamage] = irandom_range(8, 12);
item[property.maxDamage] = irandom_range(16, 18);
item[property.maxDurability] = 20;
item[property.durability] = irandom_range(1, item[property.maxDurability]);
item[property.reqStrength] = 43;