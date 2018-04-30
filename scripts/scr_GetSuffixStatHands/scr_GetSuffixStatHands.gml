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
// ITEM LEVEL 4+ ROLLS
if (iLvl >= 4){
	chance = choose(1,2,3,4,5);
	switch chance{
		case 1:	choice = stat.strength;		break;
		case 2:	choice = stat.dexterity;	break;
		case 3:	choice = stat.vitality;		break;
		case 4:	choice = stat.intelligence;	break;
		case 5:	choice = stat.magicFind;	break;
	}
}
// ITEM LEVEL 5+ ROLLS
if (iLvl >= 5){
	chance = choose(1,2,3,4,5,6);
	switch chance{
		case 1:	choice = stat.strength;		break;
		case 2:	choice = stat.dexterity;	break;
		case 3:	choice = stat.vitality;		break;
		case 4:	choice = stat.intelligence;	break;
		case 5:	choice = stat.magicFind;	break;
		case 6:	choice = stat.hitRecovery;	break;
	}
}
// ITEM LEVEL 7+ ROLLS
if (iLvl >= 7){
	chance = choose(1,2,3,4,5,6,7);
	switch chance{
		case 1:	choice = stat.strength;		break;
		case 2:	choice = stat.dexterity;	break;
		case 3:	choice = stat.vitality;		break;
		case 4:	choice = stat.intelligence;	break;
		case 5:	choice = stat.magicFind;	break;
		case 6:	choice = stat.hitRecovery;	break;
		case 7:	choice = stat.poisonLength;	break;
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
		case 5:	choice = stat.magicFind;	break;
		case 6:	choice = stat.hitRecovery;	break;
		case 7:	choice = stat.poisonLength;	break;
		case 8:	choice = stat.coldLength;	break;
	}
}
// ITEM LEVEL 20+ ROLLS
if (iLvl >= 10){
	chance = choose(1,2,3,4,5,6,7,8,9);
	switch chance{
		case 1:	choice = stat.strength;		break;
		case 2:	choice = stat.dexterity;	break;
		case 3:	choice = stat.vitality;		break;
		case 4:	choice = stat.intelligence;	break;
		case 5:	choice = stat.magicFind;	break;
		case 6:	choice = stat.hitRecovery;	break;
		case 7:	choice = stat.poisonLength;	break;
		case 8:	choice = stat.coldLength;	break;
		case 9:	choice = stat.attackSpeed;	break;
	}
}
// ITEM LEVEL 34+ ROLLS
if (iLvl >= 34){
	chance = choose(1,2,3,4,5,6,7,8,9,10,11);
	switch chance{
		case 1:	choice = stat.strength;		break;
		case 2:	choice = stat.dexterity;	break;
		case 3:	choice = stat.vitality;		break;
		case 4:	choice = stat.intelligence;	break;
		case 5:	choice = stat.magicFind;	break;
		case 6:	choice = stat.hitRecovery;	break;
		case 7:	choice = stat.poisonLength;	break;
		case 8:	choice = stat.coldLength;	break;
		case 9:	choice = stat.attackSpeed;	break;
		case 10: choice = stat.lifeSteal;	break;
		case 11: choice = stat.manaSteal;	break;
	}
}
// ITEM LEVEL 40+ ROLLS
if (iLvl >= 40){
	chance = choose(1,2,3,4,5,6,7,8,9,10,11,12,13);
	switch chance{
		case 1:	choice = stat.strength;		break;
		case 2:	choice = stat.dexterity;	break;
		case 3:	choice = stat.vitality;		break;
		case 4:	choice = stat.intelligence;	break;
		case 5:	choice = stat.magicFind;	break;
		case 6:	choice = stat.hitRecovery;	break;
		case 7:	choice = stat.poisonLength;	break;
		case 8:	choice = stat.coldLength;	break;
		case 9:	choice = stat.attackSpeed;	break;
		case 10: choice = stat.lifeSteal;	break;
		case 11: choice = stat.manaSteal;	break;
		case 12: choice = stat.healthRegen;	break;
		case 13: choice = stat.manaRegen;	break;
	}
}
return(choice);