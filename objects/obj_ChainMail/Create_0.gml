/// @description Initialize Variables

// Inherit from Chest Parent
event_inherited();

// Quilted Armor specific variables
item[property.name] = "Chain Mail";
item[property.sprite] = spr_ChainMail;
item[property.object] = obj_ChainMail;
item[property.defence] = irandom_range(127, 215);
item[property.maxDurability] = 35;
item[property.durability] = irandom_range(1, item[property.maxDurability]);
item[property.reqStrength] = 35;