/// @description Initialize Variables

// Inherit from Shield Parent
event_inherited();

// Bone Shield specific variables
item[property.name] = "Bone Shield";
item[property.sprite] = spr_BoneShield;
item[property.object] = obj_BoneShield;
item[property.width] = 2;
item[property.height] = 3;
item[property.defence] = irandom_range(18, 36);
item[property.maxDurability] = 40;
item[property.durability] = irandom_range(1, item[property.maxDurability]);
item[property.reqStrength] = 25;