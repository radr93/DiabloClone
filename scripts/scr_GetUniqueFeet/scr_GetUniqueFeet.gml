/*

Syntax:
scr_GetUniqueFeet(item[]);

item[]	The item's properties array

This script checks if an item that rolls unique actually has a real unique item.

*/

var item;
item = argument0;

// Leather Shoes
if (item[property.sprite] == spr_LeatherShoes){
	item[property.title] = "Hotspur";
	item[property.defence] = 10;
	item[property.reqLevel] = 5;
	item[property.magic1stat]	= stat.enhancedDefence;
	item[property.magic1value]	= irandom_range(10,20);
	item[property.magic1string] = scr_GetStatString(item[property.magic1stat], item[property.magic1value], item[property.magic1value2]);
	item[property.magic2stat]	= stat.defence;
	item[property.magic2value]	= 6;
	item[property.magic2string] = scr_GetStatString(item[property.magic2stat], item[property.magic2value], item[property.magic2value2]);
	item[property.magic3stat]	= stat.fireResist;
	item[property.magic3value]	= 45;
	item[property.magic3string] = scr_GetStatString(item[property.magic3stat], item[property.magic3value], item[property.magic3value2]);
	item[property.magic4stat]	= stat.fireResistMax;
	item[property.magic4value]	= 15;
	item[property.magic4string] = scr_GetStatString(item[property.magic4stat], item[property.magic4value], item[property.magic4value2]);
	item[property.magic5stat]	= stat.fireDamage;
	item[property.magic5value]	= 3;
	item[property.magic5value2]	= 6;
	item[property.magic5string] = scr_GetStatString(item[property.magic5stat], item[property.magic5value], item[property.magic5value2]);item[property.magic6stat]	= stat.strength;
	item[property.magic6stat]	= stat.maxHealth;
	item[property.magic6value]	= 15;
	item[property.magic6string] = scr_GetStatString(item[property.magic6stat], item[property.magic6value], item[property.magic6value2]);
	return(item);
}

else{
	// No item found for this object at this item level
	return(-1);	
}