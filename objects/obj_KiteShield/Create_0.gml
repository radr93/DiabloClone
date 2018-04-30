/// @description Initialize Variables

// Inherit from Shield Parent
event_inherited();

// Kite Shield specific variables
item[property.name] = "Kite Shield";
item[property.sprite] = spr_KiteShield;
item[property.object] = obj_KiteShield;
item[property.width] = 2;
item[property.height] = 3;
item[property.defence] = irandom_range(20, 30);
item[property.maxDurability] = 30;
item[property.durability] = irandom_range(1, item[property.maxDurability]);
item[property.reqStrength] = 35;