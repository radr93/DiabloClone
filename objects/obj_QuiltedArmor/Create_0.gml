/// @description Initialize Variables

// Inherit from Off-Hand Parent
event_inherited();

// Quilted Armor specific variables
item[property.name] = "Quilted Armor";
item[property.sprite] = spr_QuiltedArmor;
item[property.object] = obj_QuiltedArmor;
item[property.defence] = irandom_range(7, 14);
item[property.reqStrength] = 12;