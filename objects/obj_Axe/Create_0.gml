/// @description Initialize Variables

// Inherit from Axe Parent
event_inherited();

// Short Sword specific variables
item[property.name] = "Axe";
item[property.sprite] = spr_Axe;
item[property.object] = obj_Axe;
item[property.width] = 2;
item[property.height] = 3;
item[property.minDamage] = irandom_range(2, 4);
item[property.maxDamage] = irandom_range(6, 8);
item[property.maxDurability] = 24;
item[property.durability] = irandom_range(1, item[property.maxDurability]);
item[property.reqStrength] = 32;