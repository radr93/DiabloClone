/*

Syntax:
scr_GetTooltip(item);

item	The entire array that holds all of the item's information

This script returns a long string that contains all of the item's information
in tooltip format.

e.g.:
	SKIN OF THE VIPERMAGI			[title]
MAGIC SERPENTSKIN ARMOR OF MAGIC	[prefix][name][suffix]
  		  'Ah, Beh'					[sub-title]
		DEFENCE: 279				(armor)[defence] (weapon)[damage range]
    DURABILITY: 20 of 24			[durability]
   REQUIRED STRENGTH: 43			[requirements]
	 REQUIRED LEVEL: 29				[rune magic would go directly before requirements]
	  +2 TO ALL SKILLS				[magic 1]
	+30% FASTER CAST RATE			[magic 2]
   +120% ENHANCED DEFENCE			[magic 3]
	  MAGIC RESIST +9%				[magic 4]
	ALL RESISTANCES +34%			[magic 5]
 MAGIC DAMAGE REDUCED BY 11			[magic 6]
	+50 TO ATTACK RATING			[socket 1]
	  +25 BONUS DEFENCE				[socket 2] [socket 3..4..etc]
		SOCKETED (2)				[sockets]
ETHEREAL (CANNOT BE REPAIRED)		[ethereal]
									** space **
									[set magic 1,2,3.. goes here]
									** space **
							[set completion goes here]

*/

var item, tooltip;

item = argument0;
tooltip = "";

// Title
if (item[property.title] != -1){
	tooltip = item[property.title]+"\n"+item[property.name];
}

// Prefix/Suffix/Name
else{
	tooltip = item[property.name];
	if (item[property.prefix] != -1){
		tooltip = item[property.prefix]+tooltip
	}
	if(item[property.suffix] != -1){
		tooltip = tooltip+item[property.suffix]
	}
}

// Sub-Title
if (item[property.subTitle] != -1){
	tooltip = tooltip+"\n"+item[property.subTitle];
}
// Defence (Armor Only)
if (item[property.type] == type.armor){
	tooltip = tooltip+"\nDefence: "+string(item[property.defence]);
}
// Damage (Weapon Only)
if (item[property.type] == type.weapon){
	tooltip = tooltip+"\nDamage: "+string(item[property.minDamage])+" to "+string(item[property.maxDamage]);
}
// Durability (Armor and Weapons)
if (item[property.type] == type.armor or item[property.type] == type.weapon){
	tooltip = tooltip+"\nDurability: "+string(item[property.durability])+" of "+string(item[property.maxDurability]);
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
	tooltip = tooltip+"\nRequired Level: "+string(item[property.reqLevel]);
}

// Magic Properties
if (item[property.magic1stat] != -1){
	if (item[property.magic1stat] != stat.socketed){
		tooltip = tooltip+"\n"+item[property.magic1string]
	}
	if (item[property.magic2stat] != -1){
		if (item[property.magic2stat] != stat.socketed){
			tooltip = tooltip+"\n"+item[property.magic2string]
		}
		if (item[property.magic3stat] != -1){
			if (item[property.magic3stat] != stat.socketed){
				tooltip = tooltip+"\n"+item[property.magic3string]
			}
			if (item[property.magic4stat] != -1){
				if (item[property.magic4stat] != stat.socketed){
					tooltip = tooltip+"\n"+item[property.magic4string]
				}
				if (item[property.magic5stat] != -1){
					if (item[property.magic5stat] != stat.socketed){
						tooltip = tooltip+"\n"+item[property.magic5string]
					}
					if (item[property.magic6stat] != -1){
						if (item[property.magic6stat] != stat.socketed){
							tooltip = tooltip+"\n"+item[property.magic6string]
						}
					}
				}
			}
		}
	}
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











