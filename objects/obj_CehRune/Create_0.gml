/// @description Initialize Variables

// Inherit from item parent
event_inherited();

// Minor Mana Potion specific Variables
item[property.name] = "Ceh Rune";
item[property.sprite] = spr_CehRune;
item[property.object] = obj_CehRune;
item[property.reqLevel] = 13;

item[property.magic1stat] = stat.strength;
item[property.magic1value] = 5;
item[property.magic1string] = "Weapons: +"+string(item[property.magic1value])+" to Strength";

item[property.magic2stat] = stat.strength;
item[property.magic2value] = 3;
item[property.magic2string] = "Armor: +"+string(item[property.magic2value])+" to Strength";

item[property.magic3stat] = stat.strength;
item[property.magic3value] = 3;
item[property.magic3string] = "Helms: +"+string(item[property.magic3value])+" to Strength";

item[property.magic4stat] = stat.strength;
item[property.magic4value] = 3;
item[property.magic4string] = "Shields: +"+string(item[property.magic1value])+" to Strength";