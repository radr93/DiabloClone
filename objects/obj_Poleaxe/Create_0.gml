/// @description Initialize Variables

// Inherit from Sword Parent
event_inherited();

// Short Sword specific variables
item[property.name] = "Poleaxe";
item[property.sprite] = spr_Poleaxe;
item[property.object] = obj_Poleaxe;
item[property.width] = 2;
item[property.height] = 4;
item[property.minDamage] = irandom_range(12, 14);
item[property.maxDamage] = irandom_range(26, 38);
item[property.reqStrength] = 35;
item[property.reqDexterity] = 25;