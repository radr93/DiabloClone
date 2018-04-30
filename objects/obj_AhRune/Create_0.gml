/// @description Initialize Variables

// Inherit from item parent
event_inherited();

// Minor Mana Potion specific Variables
item[property.name] = "Ah Rune";
item[property.sprite] = spr_AhRune;
item[property.object] = obj_AhRune;
item[property.reqLevel] = 11;

item[property.magic1stat] = stat.attackRating;
item[property.magic1value] = 50;
item[property.magic1string] = "Weapons: +"+string(item[property.magic1value])+" to Attack Rating";

item[property.magic2stat] = stat.attackRating;
item[property.magic2value] = 35;
item[property.magic2string] = "Armor: +"+string(item[property.magic2value])+" to Attack Rating";

item[property.magic3stat] = stat.attackRating;
item[property.magic3value] = 25;
item[property.magic3string] = "Helms: +"+string(item[property.magic3value])+" to Attack Rating";

item[property.magic4stat] = stat.attackRating;
item[property.magic4value] = 45;
item[property.magic4string] = "Shields: +"+string(item[property.magic3value])+" to Attack Rating";
