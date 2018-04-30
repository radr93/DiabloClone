/// @description Initialize Variables

// Inherit from Shield Parent
event_inherited();

// Buckler specific variables
item[property.name] = "Buckler";
item[property.sprite] = spr_Buckler;
item[property.object] = obj_Buckler;
item[property.width] = 2;
item[property.height] = 2;
item[property.defence] = irandom_range(4, 6);
item[property.maxDurability] = 12;
item[property.durability] = irandom_range(1, item[property.maxDurability]);
item[property.reqStrength] = 12;