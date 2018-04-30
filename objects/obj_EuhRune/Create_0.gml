/// @description Initialize Variables

// Inherit from item parent
event_inherited();

// Minor Mana Potion specific Variables
item[property.name] = "Euh Rune";
item[property.sprite] = spr_EuhRune;
item[property.object] = obj_EuhRune;
item[property.reqLevel] = 13;

item[property.magic1stat] = stat.vitality;
item[property.magic1value] = 5;
item[property.magic1string] = "Weapons: +"+string(item[property.magic1value])+" to Vitality";

item[property.magic2stat] = stat.vitality;
item[property.magic2value] = 3;
item[property.magic2string] = "Armor: +"+string(item[property.magic2value])+" to Vitality";

item[property.magic3stat] = stat.vitality;
item[property.magic3value] = 3;
item[property.magic3string] = "Helms: +"+string(item[property.magic3value])+" to Vitality";

item[property.magic4stat] = stat.vitality;
item[property.magic4value] = 3;
item[property.magic4string] = "Shields: +"+string(item[property.magic1value])+" to Vitality";