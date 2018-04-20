/// @description Initialize Variables

// Inherit from Off-Hand Parent
event_inherited();

// Short Sword specific variables
item[property.name] = "Bone Shield";
item[property.sprite] = spr_BoneShield;
item[property.object] = obj_BoneShield;
item[property.width] = 2;
item[property.height] = 3;
item[property.defence] = irandom_range(18, 36);
item[property.reqStrength] = 25;