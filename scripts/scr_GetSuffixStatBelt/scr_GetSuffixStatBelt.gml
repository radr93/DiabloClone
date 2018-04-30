/*

Syntax:
scr_GetSuffixStatHands(itemLevel);

itemLevel	The item's level

This script gets an appropriate suffix for hands slot items.

*/

var iLvl, chance, choice;
iLvl = argument0;

// ITEM LEVEL 1+ ROLLS
chance = choose(1,2,3,4);
switch chance{
	case 1:	choice = stat.strength;		break;
	case 2:	choice = stat.dexterity;	break;
	case 3:	choice = stat.vitality;		break;
	case 4:	choice = stat.intelligence;	break;
}

// ITEM LEVEL 5+ ROLLS
if (iLvl >= 5){
	chance = choose(1,2,3,4,5);
	switch chance{
		case 1:	choice = stat.strength;		break;
		case 2:	choice = stat.dexterity;	break;
		case 3:	choice = stat.vitality;		break;
		case 4:	choice = stat.intelligence;	break;
		case 5:	choice = stat.hitRecovery;	break;
	}
}
// ITEM LEVEL 7+ ROLLS
if (iLvl >= 7){
	chance = choose(1,2,3,4,5,6);
	switch chance{
		case 1:	choice = stat.strength;		break;
		case 2:	choice = stat.dexterity;	break;
		case 3:	choice = stat.vitality;		break;
		case 4:	choice = stat.intelligence;	break;
		case 5:	choice = stat.hitRecovery;	break;
		case 6:	choice = stat.poisonLength;	break;
	}
}
// ITEM LEVEL 10+ ROLLS
if (iLvl >= 10){
	chance = choose(1,2,3,4,5,6,7,8);
	switch chance{
		case 1:	choice = stat.strength;		break;
		case 2:	choice = stat.dexterity;	break;
		case 3:	choice = stat.vitality;		break;
		case 4:	choice = stat.intelligence;	break;
		case 5:	choice = stat.hitRecovery;	break;
		case 6:	choice = stat.poisonLength;	break;
		case 7:	choice = stat.healthRegen;	break;
		case 8:	choice = stat.manaRegen;	break;
	}
}
return(choice);