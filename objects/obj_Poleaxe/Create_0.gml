/// @description Initialize Variables

// Inherit from Sword Parent
event_inherited();

// Short Sword specific variables
item[property.name] = "Poleaxe";
item[property.sprite] = spr_Poleaxe;
item[property.object] = obj_Poleaxe;
item[property.width] = 2;
item[property.height] = 4;
item[property.minDamage] = irandom_range(16, 19);
item[property.maxDamage] = irandom_range(31, 41);
item[property.maxDurability] = 65;
item[property.durability] = irandom_range(1, item[property.maxDurability]);
item[property.reqStrength] = 62;