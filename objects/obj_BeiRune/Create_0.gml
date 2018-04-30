/// @description Initialize Variables

// Inherit from item parent
event_inherited();

// Minor Mana Potion specific Variables
item[property.name] = "Bei Rune";
item[property.sprite] = spr_BeiRune;
item[property.object] = obj_BeiRune;
item[property.reqLevel] = 11;

item[property.magic1stat] = stat.defence;
item[property.magic1value] = 50;
item[property.magic1string] = "Weapons: +"+string(item[property.magic1value])+" to Defence";

item[property.magic2stat] = stat.defence;
item[property.magic2value] = 35;
item[property.magic2string] = "Armor: +"+string(item[property.magic2value])+" to Defence";

item[property.magic3stat] = stat.defence;
item[property.magic3value] = 25;
item[property.magic3string] = "Helms: +"+string(item[property.magic3value])+" to Defence";

item[property.magic4stat] = stat.defence;
item[property.magic4value] = 45;
item[property.magic4string] = "Shields: +"+string(item[property.magic1value])+" to Defence";