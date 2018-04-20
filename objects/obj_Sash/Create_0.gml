/// @description Initialize Variables

// Inherit from head parent
event_inherited();

// Gauntlets specific variables
item[property.name] = "Sash";
item[property.sprite] = spr_Sash;
item[property.object] = obj_Sash;
item[property.defence] = irandom_range(2, 5);