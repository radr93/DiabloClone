/*

Syntax:
scr_GetPrefixStatBelt(itemLevel);

itemLevel	The item's level

This script gets an appropriate prefix for belt slot items.

*/

var iLvl, chance, choice;
iLvl = argument0;

// ITEM LEVEL 1+ ROLLS
chance = choose(1,2,3,4,5);
switch chance{
	case 1:	choice = stat.enhancedDefence;	break;
	case 2:	choice = stat.fireResist;		break;
	case 3:	choice = stat.coldResist;		break;
	case 4:	choice = stat.lightningResist;	break;
	case 5:	choice = stat.poisonResist;		break;
}
// ITEM LEVEL 6+ ROLLS
if (iLvl >= 6){
	chance = choose(1,2,3,4,5,6);
	switch chance{
		case 1:	choice = stat.enhancedDefence;	break;
		case 2:	choice = stat.fireResist;		break;
		case 3:	choice = stat.coldResist;		break;
		case 4:	choice = stat.lightningResist;	break;
		case 5:	choice = stat.poisonResist;		break;
		case 6:	choice = stat.maxMana;			break;
	}
}

return(choice);