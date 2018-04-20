/// @description Initialize Variables

// Inherit from Sword Parent
event_inherited();

// Short Sword specific variables
item[property.name] = "Short Sword";
item[property.sprite] = spr_ShortSword;
item[property.object] = obj_ShortSword;
item[property.width] = 1;
item[property.height] = 3;
item[property.minDamage] = irandom_range(2, 4);
item[property.maxDamage] = irandom_range(6, 8);
item[property.reqStrength] = 15;
item[property.reqDexterity] = 12;