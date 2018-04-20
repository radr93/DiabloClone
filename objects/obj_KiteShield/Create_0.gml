/// @description Initialize Variables

// Inherit from Off-Hand Parent
event_inherited();

// Short Sword specific variables
item[property.name] = "Kite Shield";
item[property.sprite] = spr_KiteShield;
item[property.object] = obj_KiteShield;
item[property.width] = 2;
item[property.height] = 3;
item[property.defence] = irandom_range(20, 30);
item[property.reqStrength] = 35;