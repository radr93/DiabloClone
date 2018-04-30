/// @description Initialize Variables

// Inherit from head parent
event_inherited();

// Gauntlets specific variables
item[property.name] = "Leather Boots";
item[property.sprite] = spr_LeatherBoots;
item[property.object] = obj_LeatherBoots;
item[property.defence] = irandom_range(2, 3);
item[property.maxDurability] = 12;
item[property.durability] = irandom_range(1, item[property.maxDurability]);