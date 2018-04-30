/// @description Initialize Variables

// Inherit from head parent
event_inherited();

// Gauntlets specific variables
item[property.name] = "Sash";
item[property.sprite] = spr_Sash;
item[property.object] = obj_Sash;
item[property.defence] = 2;
item[property.maxDurability] = 12;
item[property.durability] = irandom_range(1, item[property.maxDurability]);