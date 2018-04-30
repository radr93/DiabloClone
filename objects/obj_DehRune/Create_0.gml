/// @description Initialize Variables

// Inherit from item parent
event_inherited();

// Minor Mana Potion specific Variables
item[property.name] = "Deh Rune";
item[property.sprite] = spr_DehRune;
item[property.object] = obj_DehRune;
item[property.reqLevel] = 13;

item[property.magic1stat] = stat.dexterity;
item[property.magic1value] = 5;
item[property.magic1string] = "Weapons: +"+string(item[property.magic1value])+" to Dexterity";

item[property.magic2stat] = stat.dexterity;
item[property.magic2value] = 3;
item[property.magic2string] = "Armor: +"+string(item[property.magic2value])+" to Dexterity";

item[property.magic3stat] = stat.dexterity;
item[property.magic3value] = 3;
item[property.magic3string] = "Helms: +"+string(item[property.magic3value])+" to Dexterity";

item[property.magic4stat] = stat.dexterity;
item[property.magic4value] = 3;
item[property.magic4string] = "Shields: +"+string(item[property.magic1value])+" to Dexterity";