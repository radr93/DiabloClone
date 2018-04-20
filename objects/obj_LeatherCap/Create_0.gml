/// @description Initialize Variables

// Inherit from head parent
event_inherited();

// Leather Cap specific variables
item[property.name] = "Leather Cap";
item[property.sprite] = spr_LeatherCap;
item[property.object] = obj_LeatherCap;
item[property.defence] = irandom_range(2, 5);