/*

Syntax:
scr_GetPrefixStatNeck(itemLevel);

itemLevel	The item's level

This script gets an appropriate prefix for neck slot items.

*/

var iLvl, chance, choice;
iLvl = argument0;

// ITEM LEVEL 1+ ROLLS
chance = choose(1,2,3,4,5,6);
switch chance{
	case 1:	choice = stat.goldFind;			break;
	case 2:	choice = stat.fireResist;		break;
	case 3:	choice = stat.coldResist;		break;
	case 4:	choice = stat.lightningResist;	break;
	case 5:	choice = stat.poisonResist;		break;
	case 6: choice = stat.maxMana;			break;
}
// ITEM LEVEL 8+ ROLLS
if (iLvl >= 8){
	chance = choose(1,2,3,4,5,6,7);
	switch chance{
		case 1:	choice = stat.goldFind;			break;
		case 2:	choice = stat.fireResist;		break;
		case 3:	choice = stat.coldResist;		break;
		case 4:	choice = stat.lightningResist;	break;
		case 5:	choice = stat.poisonResist;		break;
		case 6: choice = stat.maxMana;			break;
		case 7: choice = stat.allResist;		break;
	}
}
return(choice);