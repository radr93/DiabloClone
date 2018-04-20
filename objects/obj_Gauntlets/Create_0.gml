/// @description Initialize Variables

// Inherit from head parent
event_inherited();

// Gauntlets specific variables
item[property.name] = "Gauntlets";
item[property.sprite] = spr_Gauntlets;
item[property.object] = obj_Gauntlets;
item[property.defence] = irandom_range(12, 19);
item[property.reqStrength] = 20;