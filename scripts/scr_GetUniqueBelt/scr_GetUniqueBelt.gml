/*

Syntax:
scr_GetUniqueBelt(item[]);

item[]	The item's properties array

This script checks if an item that rolls unique actually has a real unique item.

*/

var item;
item = argument0;

// Belt
if (item[property.object] == obj_Sash){
	item[property.title] = "The String of Ears";
	item[property.defence] = irandom_range(29,34);
	item[property.reqLevel] = 29;
	item[property.reqStrength] = 20;
	item[property.maxDurability] = 22;
	item[property.durability] = irandom_range(1, item[property.maxDurability]);
	item[property.magic1stat]	= stat.enhancedDefence;
	item[property.magic1value]	= irandom_range(150,180);
	item[property.magic1string] = scr_GetStatString(item[property.magic1stat], item[property.magic1value], item[property.magic1value2]);
	item[property.magic2stat]	= stat.defence;
	item[property.magic2value]	= 15;
	item[property.magic2string] = scr_GetStatString(item[property.magic2stat], item[property.magic2value], item[property.magic2value2]);
	item[property.magic3stat]	= stat.lifeSteal;
	item[property.magic3value]	= irandom_range(6,8);
	item[property.magic3string] = scr_GetStatString(item[property.magic3stat], item[property.magic3value], item[property.magic3value2]);
	item[property.magic4stat]	= stat.damageReductionPercent;
	item[property.magic4value]	= irandom_range(10,15);
	item[property.magic4string] = scr_GetStatString(item[property.magic4stat], item[property.magic4value], item[property.magic4value2]);
	item[property.magic5stat]	= stat.damageReduction;
	item[property.magic5value]	= 10-15;
	item[property.magic5string] = scr_GetStatString(item[property.magic5stat], item[property.magic5value], item[property.magic5value2]);
	return(item);
}

else{
	// No item found for this object at this item level
	return(-1);	
}