/*

Syntax:
scr_GetSuffixStatRing(itemLevel);

itemLevel	The item's level

This script gets an appropriate suffix for ring slot items.

*/

var iLvl, chance, choice;
iLvl = argument0;

// ITEM LEVEL 1+ ROLLS
chance = choose(1,2,3,4,5);
switch chance{
	case 1:	choice = stat.strength;		break;
	case 2:	choice = stat.dexterity;	break;
	case 3:	choice = stat.vitality;		break;
	case 4:	choice = stat.intelligence;	break;
	case 5: choice = stat.maxDamage;	break;
}
// ITEM LEVEL 4+ ROLLS
if (iLvl >= 4){
	chance = choose(1,2,3,4,5,6);
	switch chance{
		case 1:	choice = stat.strength;		break;
		case 2:	choice = stat.dexterity;	break;
		case 3:	choice = stat.vitality;		break;
		case 4:	choice = stat.intelligence;	break;
		case 5: choice = stat.maxDamage;	break;
		case 6: choice = stat.magicFind;	break;
	}
}
// ITEM LEVEL 5+ ROLLS
if (iLvl >= 5){
	chance = choose(1,2,3,4,5,6,7);
	switch chance{
		case 1:	choice = stat.strength;		break;
		case 2:	choice = stat.dexterity;	break;
		case 3:	choice = stat.vitality;		break;
		case 4:	choice = stat.intelligence;	break;
		case 5: choice = stat.maxDamage;	break;
		case 6: choice = stat.magicFind;	break;
		case 7: choice = stat.castRate;		break;
	}
}
// ITEM LEVEL 7+ ROLLS
if (iLvl >= 7){
	chance = choose(1,2,3,4,5,6,7,8,9);
	switch chance{
		case 1:	choice = stat.strength;			break;
		case 2:	choice = stat.dexterity;		break;
		case 3:	choice = stat.vitality;			break;
		case 4:	choice = stat.intelligence;		break;
		case 5: choice = stat.maxDamage;		break;
		case 6: choice = stat.magicFind;		break;
		case 7: choice = stat.castRate;			break;
		case 8: choice = stat.poisonLength;		break;
		case 9: choice = stat.damageReduction;	break;
	}
}
// ITEM LEVEL 10+ ROLLS
if (iLvl >= 10){
	chance = choose(1,2,3,4,5,6,7,8,9,10,11);
	switch chance{
		case 1:	choice = stat.strength;			break;
		case 2:	choice = stat.dexterity;		break;
		case 3:	choice = stat.vitality;			break;
		case 4:	choice = stat.intelligence;		break;
		case 5: choice = stat.maxDamage;		break;
		case 6: choice = stat.magicFind;		break;
		case 7: choice = stat.castRate;			break;
		case 8: choice = stat.poisonLength;		break;
		case 9: choice = stat.damageReduction;	break;
		case 10: choice = stat.healthRegen;		break;
		case 11: choice = stat.manaRegen;		break;
	}
}
// ITEM LEVEL 14+ ROLLS
if (iLvl >= 10){
	chance = choose(1,2,3,4,5,6,7,8,9,10,11,12,13);
	switch chance{
		case 1:	choice = stat.strength;			break;
		case 2:	choice = stat.dexterity;		break;
		case 3:	choice = stat.vitality;			break;
		case 4:	choice = stat.intelligence;		break;
		case 5: choice = stat.maxDamage;		break;
		case 6: choice = stat.magicFind;		break;
		case 7: choice = stat.castRate;			break;
		case 8: choice = stat.poisonLength;		break;
		case 9: choice = stat.damageReduction;	break;
		case 10: choice = stat.healthRegen;		break;
		case 11: choice = stat.manaRegen;		break;
		case 12: choice = stat.lifeSteal;		break;
		case 13: choice = stat.manaSteal;		break;
	}
}
// ITEM LEVEL 14+ ROLLS
if (iLvl >= 15){
	chance = choose(1,2,3,4,5,6,7,8,9,10,11,12,13,14);
	switch chance{
		case 1:	choice = stat.strength;			break;
		case 2:	choice = stat.dexterity;		break;
		case 3:	choice = stat.vitality;			break;
		case 4:	choice = stat.intelligence;		break;
		case 5: choice = stat.maxDamage;		break;
		case 6: choice = stat.magicFind;		break;
		case 7: choice = stat.castRate;			break;
		case 8: choice = stat.poisonLength;		break;
		case 9: choice = stat.damageReduction;	break;
		case 10: choice = stat.healthRegen;		break;
		case 11: choice = stat.manaRegen;		break;
		case 12: choice = stat.lifeSteal;		break;
		case 13: choice = stat.manaSteal;		break;
		case 14: choice = stat.minDamage;		break;
	}
}
return(choice);