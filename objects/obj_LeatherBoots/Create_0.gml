/// @description Initialize Variables

// Inherit from head parent
event_inherited();

// Gauntlets specific variables
item[property.name] = "Leather Boots";
item[property.sprite] = spr_LeatherBoots;
item[property.object] = obj_LeatherBoots;
item[property.defence] = irandom_range(2, 5);