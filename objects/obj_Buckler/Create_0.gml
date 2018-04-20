/// @description Initialize Variables

// Inherit from Off-Hand Parent
event_inherited();

// Short Sword specific variables
item[property.name] = "Buckler";
item[property.sprite] = spr_Buckler;
item[property.object] = obj_Buckler;
item[property.width] = 2;
item[property.height] = 2;
item[property.defence] = irandom_range(9, 15);
item[property.reqStrength] = 15;