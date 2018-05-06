/*

Syntax:
scr_GetUniqueShield(item[]);

item[]	The item's properties array

This script checks if an item that rolls unique actually has a real unique item.

*/

var item;
item = argument0;

// Buckler
if (item[property.sprite] == spr_Buckler){
	item[property.title] = "Pelta Lunata";
	item[property.reqLevel] = 2;
	item[property.magic1stat]	= stat.enhancedDefence;
	item[property.magic1value]	= irandom_range(30,40);
	item[property.magic1string] = scr_GetStatString(item[property.magic1stat], item[property.magic1value], item[property.magic1value2]);
	item[property.magic2stat]	= stat.defence;
	item[property.magic2value]	= 30;
	item[property.magic2string] = scr_GetStatString(item[property.magic2stat], item[property.magic2value], item[property.magic2value2]);
	item[property.magic3stat]	= stat.blockChance;
	item[property.magic3value]	= 20;
	item[property.magic3string] = scr_GetStatString(item[property.magic3stat], item[property.magic3value], item[property.magic3value2]);
	item[property.magic4stat]	= stat.intelligence;
	item[property.magic4value]	= 10;
	item[property.magic4string] = scr_GetStatString(item[property.magic4stat], item[property.magic4value], item[property.magic4value2]);
	item[property.magic5stat]	= stat.vitality;
	item[property.magic5value]	= 10;
	item[property.magic5string] = scr_GetStatString(item[property.magic5stat], item[property.magic5value], item[property.magic5value2]);
	item[property.magic6stat]	= stat.strength;
	item[property.magic6value]	= 2;
	item[property.magic6string] = scr_GetStatString(item[property.magic6stat], item[property.magic6value], item[property.magic6value2]);
	return(item);
}

else{
	// No item found for this object at this item level
	return(-1);	
}