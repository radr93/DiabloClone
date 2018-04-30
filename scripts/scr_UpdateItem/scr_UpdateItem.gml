/*

Syntax:
scr_UpdateItem(item);

item	The array of the item properties to convert to new array

This script returns an array that contains each stat the item has in the
item[property.x] array, for ease of shorter iterations.

*/

// Store item's properties in temporary array
var item, statArray;

item = argument0;
statArray = scr_GetPropertiesAsArray(item);

// Loops through once for each property
for (var i = 0; i < 6; i++){
	if (statArray[i,0] == stat.enhancedDefence){
		var enhDefPercent = (statArray[i,1]/100)+1;
		if (item[property.defence] != -1){
			item[property.defence] = round(item[property.defence]*enhDefPercent);
		}
	}
	else if (statArray[i,0] == stat.defence){
		if (item[property.defence] != -1){
			item[property.defence] += statArray[i,1];
		}
	}
	else if (statArray[i,0] == stat.enhancedDamage){
		var enhDamPercent = (statArray[i,1]/100)+1;
		if (item[property.minDamage] != -1){
			item[property.minDamage] = round(item[property.minDamage]*enhDamPercent);
		}
		if (item[property.maxDamage] != -1){
			item[property.maxDamage] = round(item[property.maxDamage]*enhDamPercent);
		}
	}
	else if (statArray[i,0] == stat.minDamage){
		if (item[property.minDamage] != -1){
			item[property.minDamage] += statArray[i,1];
		}
	}
	else if (statArray[i,0] == stat.maxDamage){
		if (item[property.maxDamage] != -1){
			item[property.maxDamage] += statArray[i,1];
		}
	}
	else if (statArray[i,0] == stat.requirements){
		var reqPercent = (100-statArray[i,1])/100
		if (item[property.reqStrength] != -1){
			item[property.reqStrength] = round(item[property.reqStrength]*reqPercent)
		}
		if (item[property.reqDexterity] != -1){
			item[property.reqDexterity] = round(item[property.reqDexterity]*reqPercent)
		}
		if (item[property.reqIntelligence] != -1){
			item[property.reqIntelligence] = round(item[property.reqIntelligence]*reqPercent)
		}
		if (item[property.reqLevel] != -1){
			item[property.reqLevel] = round(item[property.reqLevel]*reqPercent)
		}
	}
	else if (statArray[i,0] == stat.socketed){
		item[property.socketed] = true;
		item[property.sockets] = statArray[i,1];
	}
}

return(item);