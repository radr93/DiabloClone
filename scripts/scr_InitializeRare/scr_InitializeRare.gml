/*

Syntax:
scr_InitializeRare(item);

item	The array that holds all of the item's information

This script changes variables on the item array to suit that of a rare item
such as adding multiple prefixes and suffixes

*/
var item, chance;
item = argument0;
chance = choose(1, 2, 3, 5, 6);

show_debug_message("\n"+item[property.name]+" rolled rare. Chance was "+string(chance)+".\n(1 = 2Pre 1Suf, 2 = 1Pre 2Suf, 3 = 2Pre 2Suf, 4 = 3Pre 2Suf, 5 = 2Pre 3Suf, 6 = 3Pre 3Suf)");
// Get 2 Prefix, 1 Suffix
if (chance == 1){
	// Prefix 1
	item[property.magic1stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
	item[property.magic1value] = scr_GetStatValue(item[property.magic1stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic1value2] = scr_GetStatValue2(item[property.magic1stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic1string] = scr_GetStatString(item[property.magic1stat], item[property.magic1value], item[property.magic1value2]);
	// Prefix 2
	item[property.magic2stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
	if (item[property.magic2stat] == item[property.magic1stat]){
		while (item[property.magic2stat] == item[property.magic1stat]){
			item[property.magic2stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
		}
	}
	item[property.magic2value] = scr_GetStatValue(item[property.magic2stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic2value2] = scr_GetStatValue2(item[property.magic2stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic2string] = scr_GetStatString(item[property.magic2stat], item[property.magic2value], item[property.magic2value2]);
	// Suffix 1
	item[property.magic3stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);
	item[property.magic3value] = scr_GetStatValue(item[property.magic3stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic3value2] = scr_GetStatValue2(item[property.magic3stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic3string] = scr_GetStatString(item[property.magic3stat], item[property.magic3value], item[property.magic3value2]);
}
// Get 1 Prefix, 2 Suffix
else if (chance == 2){
	// Prefix 1
	item[property.magic1stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
	item[property.magic1value] = scr_GetStatValue(item[property.magic1stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic1value2] = scr_GetStatValue2(item[property.magic1stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic1string] = scr_GetStatString(item[property.magic1stat], item[property.magic1value], item[property.magic1value2]);
	// Suffix 1
	item[property.magic2stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);
	item[property.magic2value] = scr_GetStatValue(item[property.magic2stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic2value2] = scr_GetStatValue2(item[property.magic2stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic2string] = scr_GetStatString(item[property.magic2stat], item[property.magic2value], item[property.magic2value2]);
	// Suffix 2
	item[property.magic3stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);
	if (item[property.magic3stat] == item[property.magic2stat]){
		while (item[property.magic3stat] == item[property.magic2stat]){
			item[property.magic3stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);
		}
	}
	item[property.magic3value] = scr_GetStatValue(item[property.magic3stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic3value2] = scr_GetStatValue2(item[property.magic3stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic3string] = scr_GetStatString(item[property.magic3stat], item[property.magic3value], item[property.magic3value2]);
}
// Get 2 Prefix, 2 Suffix
else if (chance == 3){
	// Prefix 1
	item[property.magic1stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
	item[property.magic1value] = scr_GetStatValue(item[property.magic1stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic1value2] = scr_GetStatValue2(item[property.magic1stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic1string] = scr_GetStatString(item[property.magic1stat], item[property.magic1value], item[property.magic1value2]);
	// Prefix 2
	item[property.magic2stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
	if (item[property.magic2stat] == item[property.magic1stat]){
		while (item[property.magic2stat] == item[property.magic1stat]){
			item[property.magic2stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
		}
	}
	item[property.magic2value] = scr_GetStatValue(item[property.magic2stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic2value2] = scr_GetStatValue2(item[property.magic2stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic2string] = scr_GetStatString(item[property.magic2stat], item[property.magic2value], item[property.magic2value2]);
	// Suffix 1
	item[property.magic3stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);			
	item[property.magic3value] = scr_GetStatValue(item[property.magic3stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic3value2] = scr_GetStatValue2(item[property.magic3stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic3string] = scr_GetStatString(item[property.magic3stat], item[property.magic3value], item[property.magic3value2]);
	// Suffix 2
	item[property.magic4stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);			
	if (item[property.magic4stat] == item[property.magic3stat]){
		while (item[property.magic4stat] == item[property.magic3stat]){
			item[property.magic4stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);
		}
	}
	item[property.magic4value] = scr_GetStatValue(item[property.magic4stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic4value2] = scr_GetStatValue2(item[property.magic4stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic4string] = scr_GetStatString(item[property.magic4stat], item[property.magic4value], item[property.magic4value2]);
}
// Get 3 Prefix, 2 Suffix
else if (chance == 4){
	// Prefix 1
	item[property.magic1stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
	item[property.magic1value] = scr_GetStatValue(item[property.magic1stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic1value2] = scr_GetStatValue2(item[property.magic1stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic1string] = scr_GetStatString(item[property.magic1stat], item[property.magic1value], item[property.magic1value2]);
	// Prefix 2
	item[property.magic2stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
	if (item[property.magic2stat] == item[property.magic1stat]){
		while (item[property.magic2stat] == item[property.magic1stat]){
			item[property.magic2stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
		}
	}
	item[property.magic2value] = scr_GetStatValue(item[property.magic2stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic2value2] = scr_GetStatValue2(item[property.magic2stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic2string] = scr_GetStatString(item[property.magic2stat], item[property.magic2value], item[property.magic2value2]);
	// Prefix 3
	item[property.magic3stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
	if (item[property.magic3stat] == item[property.magic1stat] or item[property.magic3stat] == item[property.magic2stat]){
		while (item[property.magic3stat] == item[property.magic1stat] or item[property.magic3stat] == item[property.magic2stat]){
			item[property.magic3stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
		}
	}
	item[property.magic3value] = scr_GetStatValue(item[property.magic3stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic3value2] = scr_GetStatValue2(item[property.magic3stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic3string] = scr_GetStatString(item[property.magic3stat], item[property.magic3value], item[property.magic3value2]);
	// Suffix 1
	item[property.magic4stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);			
	item[property.magic4value] = scr_GetStatValue(item[property.magic4stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic4value2] = scr_GetStatValue2(item[property.magic4stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic4string] = scr_GetStatString(item[property.magic4stat], item[property.magic4value], item[property.magic4value2]);
	// Suffix 2
	item[property.magic5stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);			
	if (item[property.magic5stat] == item[property.magic4stat]){
		while (item[property.magic5stat] == item[property.magic4stat]){
			item[property.magic5stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);
		}
	}
	item[property.magic5value] = scr_GetStatValue(item[property.magic5stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic5value2] = scr_GetStatValue2(item[property.magic5stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic5string] = scr_GetStatString(item[property.magic5stat], item[property.magic5value], item[property.magic5value2]);
}
// Get 2 prefix, 3 suffix
else if (chance == 5){
	// Prefix 1
	item[property.magic1stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
	item[property.magic1value] = scr_GetStatValue(item[property.magic1stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic1value2] = scr_GetStatValue2(item[property.magic1stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic1string] = scr_GetStatString(item[property.magic1stat], item[property.magic1value], item[property.magic1value2]);
	// Prefix 2
	item[property.magic2stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
	if (item[property.magic2stat] == item[property.magic1stat]){
		while (item[property.magic2stat] == item[property.magic1stat]){
			item[property.magic2stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
		}
	}
	item[property.magic2value] = scr_GetStatValue(item[property.magic2stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic2value2] = scr_GetStatValue2(item[property.magic2stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic2string] = scr_GetStatString(item[property.magic2stat], item[property.magic2value], item[property.magic2value2]);
	// Suffix 1
	item[property.magic3stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);			
	item[property.magic3value] = scr_GetStatValue(item[property.magic3stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic3value2] = scr_GetStatValue2(item[property.magic3stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic3string] = scr_GetStatString(item[property.magic3stat], item[property.magic3value], item[property.magic3value2]);
	// Suffix 2
	item[property.magic4stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);			
	if (item[property.magic4stat] == item[property.magic3stat]){
		while (item[property.magic4stat] == item[property.magic3stat]){
			item[property.magic4stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);
		}
	}
	item[property.magic4value] = scr_GetStatValue(item[property.magic4stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic4value2] = scr_GetStatValue2(item[property.magic4stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic4string] = scr_GetStatString(item[property.magic4stat], item[property.magic4value], item[property.magic4value2]);
	// Suffix 3
	item[property.magic5stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);			
	if (item[property.magic5stat] == item[property.magic3stat] or item[property.magic5stat] == item[property.magic4stat]){
		while (item[property.magic5stat] == item[property.magic3stat] or item[property.magic5stat] == item[property.magic4stat]){
			item[property.magic5stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);
		}
	}
	item[property.magic5value] = scr_GetStatValue(item[property.magic5stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic5value2] = scr_GetStatValue2(item[property.magic5stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic5string] = scr_GetStatString(item[property.magic5stat], item[property.magic5value], item[property.magic5value2]);
}
// Get 3 Prefix, 3 Suffix
else if (chance == 6){
	// Prefix 1
	item[property.magic1stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
	item[property.magic1value] = scr_GetStatValue(item[property.magic1stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic1value2] = scr_GetStatValue2(item[property.magic1stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic1string] = scr_GetStatString(item[property.magic1stat], item[property.magic1value], item[property.magic1value2]);
	// Prefix 2
	item[property.magic2stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
	if (item[property.magic2stat] == item[property.magic1stat]){
		while (item[property.magic2stat] == item[property.magic1stat]){
			item[property.magic2stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
		}
	}
	item[property.magic2value] = scr_GetStatValue(item[property.magic2stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic2value2] = scr_GetStatValue2(item[property.magic2stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic2string] = scr_GetStatString(item[property.magic2stat], item[property.magic2value], item[property.magic2value2]);
	// Prefix 3
	item[property.magic3stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
	if (item[property.magic3stat] == item[property.magic1stat] or item[property.magic3stat] == item[property.magic2stat]){
		while (item[property.magic3stat] == item[property.magic1stat] or item[property.magic3stat] == item[property.magic2stat]){
			item[property.magic3stat] = scr_GetPrefixStat(item[property.itemLevel], item[property.type], item[property.subType]);
		}
	}
	item[property.magic3value] = scr_GetStatValue(item[property.magic3stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic3value2] = scr_GetStatValue2(item[property.magic3stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic3string] = scr_GetStatString(item[property.magic3stat], item[property.magic3value], item[property.magic3value2]);
	// Suffix 1
	item[property.magic4stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);			
	item[property.magic4value] = scr_GetStatValue(item[property.magic4stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic4value2] = scr_GetStatValue2(item[property.magic4stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic4string] = scr_GetStatString(item[property.magic4stat], item[property.magic4value], item[property.magic4value2]);
	// Suffix 2
	item[property.magic5stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);			
	if (item[property.magic5stat] == item[property.magic4stat]){
		while (item[property.magic5stat] == item[property.magic4stat]){
			item[property.magic5stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);
		}
	}
	item[property.magic5value] = scr_GetStatValue(item[property.magic5stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic5value2] = scr_GetStatValue2(item[property.magic5stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic5string] = scr_GetStatString(item[property.magic5stat], item[property.magic5value], item[property.magic5value2]);
	// Suffix 3
	item[property.magic6stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);			
	if (item[property.magic6stat] == item[property.magic4stat] or item[property.magic6stat] == item[property.magic5stat]){
		while (item[property.magic6stat] == item[property.magic4stat] or item[property.magic6stat] == item[property.magic5stat]){
			item[property.magic6stat] = scr_GetSuffixStat(item[property.itemLevel], item[property.type], item[property.subType]);
		}
	}
	item[property.magic6value] = scr_GetStatValue(item[property.magic6stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic6value2] = scr_GetStatValue2(item[property.magic6stat], item[property.type], item[property.subType], item[property.itemLevel]);
	item[property.magic6string] = scr_GetStatString(item[property.magic6stat], item[property.magic6value], item[property.magic6value2]);
}

// Get Level Requirement
var propArray = scr_GetPropertiesAsArray(item);
var levelReq = scr_GetReqLevel(propArray);
if (levelReq > item[property.reqLevel]){
	item[property.reqLevel] = levelReq;
}

// Get Rare Name
item[property.title] = scr_GetRareName(item[property.type], item[property.subType]);

return(item);