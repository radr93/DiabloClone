/// @description Initialize Variables

// Inherit from item parent
event_inherited();

// Gold specific Variables
item[property.subType] = misc.gold;
item[property.name] = "Gold";
item[property.sprite] = spr_GoldSmall;
item[property.object] = obj_Gold;

goldValue = 0; // amount of gold the pile is worth (decided in Alarm[0] after an item level has been retrieved)