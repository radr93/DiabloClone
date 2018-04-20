/*

Syntax:
scr_GetTooltip(item);

item	The entire array that holds all of the item's information

This script returns a long string that contains all of the item's information
in tooltip format.

e.g.:
   SKIN OF THE VIPERMAGI	[title]
	 SERPENTSKIN ARMOR		[name]
		DEFENCE: 279		(armor)[defence] (weapon)[damage range]
    DURABILITY: 20 of 24	[durability]
   REQUIRED STRENGTH: 43	[requirements]
	 REQUIRED LEVEL: 29		[rune magic 1,2,3.. would go directly after requirements]
	  +2 TO ALL SKILLS		[property 1]
	+30% FASTER CAST RATE	[property 2]
   +120% ENHANCED DEFENCE	[property 3]
	  MAGIC RESIST +9%		[property 4]
	ALL RESISTANCES +34%	[property 5]
 MAGIC DAMAGE REDUCED BY 11	[property 6]
		SOCKETED (1)		[sockets]
ETHEREAL (CANNOT BE REPAIRED[ethereal]
							** space **
							[set magic 1,2,3.. goes here]
							** space **
							[set completion goes here]

*/

var item, tooltip;

item = argument0;
tooltip = "";

// Title and name
if (item[property.title] != -1){
	tooltip = item[property.title]+"\n"+item[property.name];
}
else{
	tooltip = item[property.name];
}

// Defence (Armor Only)
if (item[property.type] != type.weapon and item[property.type] != type.neck and item[property.type] != type.ring){
	tooltip = tooltip+"\nDefence: "+string(item[property.defence]);
}
// Damage (Weapon Only)
else if (item[property.type] == type.weapon){
	tooltip = tooltip+"\nDamage: "+string(item[property.minDamage])+" to "+string(item[property.maxDamage])
}
// Jewelry/Misc
else{
	tooltip = item[property.name];
}

// Requirements
if (item[property.reqStrength] != -1){
	tooltip = tooltip+"\nRequired Strength: "+string(item[property.reqStrength]);
}
if (item[property.reqDexterity] != -1){
	tooltip = tooltip+"\nRequired Dexterity: "+string(item[property.reqDexterity]);
}
if (item[property.reqIntelligence] != -1){
	tooltip = tooltip+"\nRequired Intelligence: "+string(item[property.reqIntelligence]);
}
if (item[property.reqLevel] != -1){
	tooltip = tooltip+"\nRequired Level: "+string(item[property.reqStrength]);
}


// Socketed
if (item[property.socketed] == true){
	tooltip = tooltip+"\nSocketed ["+string(item[property.sockets])+"]";
}

// Ethereal
if (item[property.ethereal] == true){
	tooltip = tooltip+"\nEthereal (Cannot be repaired)";
}

// Item level
tooltip = tooltip+"\niLvl: "+string(item[property.itemLevel]);

return(tooltip);











