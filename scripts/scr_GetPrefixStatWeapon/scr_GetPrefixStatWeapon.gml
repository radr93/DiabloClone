/*

Syntax:
scr_GetPrefixStatWeapon(itemLevel);

itemLevel	The item's level

This script gets an appropriate prefix for weapon slot items.

*/

var iLvl, chance, choice;
iLvl = argument0;

// ITEM LEVEL 1+ ROLLS
chance = choose(1,2,3,4,5);
switch chance{
	case 1:	choice = stat.enhancedDamage;	break;
	case 2:	choice = stat.fireResist;		break;
	case 3:	choice = stat.coldResist;		break;
	case 4:	choice = stat.lightningResist;	break;
	case 5:	choice = stat.poisonResist;		break;
	case 6: choice = stat.poisonDamage;		break;
}
// ITEM LEVEL 4+ ROLLS
if (iLvl >= 4){
	chance = choose(1,2,3,4,5,6,7);
	switch chance{
		case 1:	choice = stat.enhancedDamage;	break;
		case 2:	choice = stat.fireResist;		break;
		case 3:	choice = stat.coldResist;		break;
		case 4:	choice = stat.lightningResist;	break;
		case 5:	choice = stat.poisonResist;		break;
		case 6: choice = stat.poisonDamage;		break;
		case 7: choice = stat.attackRating;		break;
	}
}
// ITEM LEVEL 10+ ROLLS
if (iLvl >= 10){
	chance = choose(1,2,3,4,5,6,7,8);
	switch chance{
		case 1:	choice = stat.enhancedDamage;	break;
		case 2:	choice = stat.fireResist;		break;
		case 3:	choice = stat.coldResist;		break;
		case 4:	choice = stat.lightningResist;	break;
		case 5:	choice = stat.poisonResist;		break;
		case 6: choice = stat.poisonDamage;		break;
		case 7: choice = stat.attackRating;		break;
		case 8: choice = stat.socketed;			break;
	}
}		
// ITEM LEVEL 25+ ROLLS
if (iLvl >= 25){
	chance = choose(1,2,3,4,5,6,7,8,9,10,11);
	switch chance{
		case 1:	choice = stat.enhancedDamage;	break;
		case 2:	choice = stat.fireResist;		break;
		case 3:	choice = stat.coldResist;		break;
		case 4:	choice = stat.lightningResist;	break;
		case 5:	choice = stat.poisonResist;		break;
		case 6: choice = stat.attackRating;		break;
		case 7: choice = stat.poisonDamage;		break;
		case 8: choice = stat.socketed;			break;
		case 9: choice = stat.fireDamage;		break;
		case 10: choice = stat.coldDamage;		break;
		case 11: choice = stat.lightningDamage;	break;
	}
}
// ITEM LEVEL 37+ ROLLS
if (iLvl >= 37){
	chance = choose(1,2,3,4,5,6,7,8,9,10,11,12);
	switch chance{
		case 1:	choice = stat.enhancedDamage;	break;
		case 2:	choice = stat.fireResist;		break;
		case 3:	choice = stat.coldResist;		break;
		case 4:	choice = stat.lightningResist;	break;
		case 5:	choice = stat.poisonResist;		break;
		case 6: choice = stat.attackRating;		break;
		case 7: choice = stat.poisonDamage;		break;
		case 8: choice = stat.socketed;			break;
		case 9: choice = stat.fireDamage;		break;
		case 10: choice = stat.coldDamage;		break;
		case 11: choice = stat.lightningDamage;	break;
		case 12: choice = stat.maxMana;			break;
	}
}
return(choice);